import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starwars/layers/domain/entity/vehicle.dart';

part 'vehicle_details_event.dart';

part 'vehicle_details_state.dart';

class VehicleDetailsBloc
    extends Bloc<VehicleDetailsEvent, VehicleDetailsState> {
  VehicleDetailsBloc({required Vehicle vehicle})
      : super(VehicleDetailsState(vehicle: vehicle));
}
