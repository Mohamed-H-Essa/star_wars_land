import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/layers/domain/entity/vehicle.dart';
import 'package:starwars/layers/domain/usecase/get_all_vehicles.dart';
import 'package:starwars/layers/presentation/shared/list_item_header.dart';
import 'package:starwars/layers/presentation/shared/list_item_loading.dart';
import 'package:starwars/layers/presentation/people/shared/person_list_item.dart';
import 'package:starwars/layers/presentation/vehicles/details_page/view/vehicle_details_page.dart';
import 'package:starwars/layers/presentation/vehicles/list_page/bloc/vehicle_page_bloc.dart';
import 'package:starwars/layers/presentation/vehicles/shared/vehicle_list_item.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class VehiclePage extends StatelessWidget {
  const VehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehiclePageBloc(
        getAllVehicle: context.read<GetAllVehicles>(),
      )..add(const FetchNextPageEvent()),
      child: const VehicleView(),
    );
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class VehicleView extends StatelessWidget {
  const VehicleView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((VehiclePageBloc b) => b.state.status);
    return status == VehiclePageStatus.initial
        ? const Center(child: CircularProgressIndicator())
        : const _Content();
  }
}

// -----------------------------------------------------------------------------
// Content
// -----------------------------------------------------------------------------
class _Content extends StatefulWidget {
  const _Content({super.key});

  @override
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  final _scrollController = ScrollController();

  VehiclePageBloc get pageBloc => context.read<VehiclePageBloc>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext ctx) {
    final list = ctx.select((VehiclePageBloc b) => b.state.vehicles);
    final hasEnded = ctx.select((VehiclePageBloc b) => b.state.hasReachedEnd);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListView.builder(
        key: const ValueKey('vehicle_page_list_key'),
        controller: _scrollController,
        itemCount: hasEnded ? list.length : list.length + 1,
        itemBuilder: (context, index) {
          if (index >= list.length) {
            return !hasEnded ? const ListItemLoading() : const SizedBox();
          }
          final item = list[index];
          return index == 0
              ? Column(
                  children: [
                    const ListItemHeader(titleText: 'All Vehicle'),
                    VehicleListItem(item: item, onTap: _goToDetails),
                  ],
                )
              : VehicleListItem(item: item, onTap: _goToDetails);
        },
      ),
    );
  }

  void _goToDetails(Vehicle vehicle) {
    final route = VehicleDetailsPage.route(vehicle: vehicle);
    Navigator.of(context).push(route);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      pageBloc.add(const FetchNextPageEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
