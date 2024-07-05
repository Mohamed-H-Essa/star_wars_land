part of 'vehicle_page_bloc.dart';

sealed class VehiclePageEvent extends Equatable {
  const VehiclePageEvent();

  @override
  List<Object?> get props => [];
}

final class FetchNextPageEvent extends VehiclePageEvent {
  const FetchNextPageEvent();
}
