part of 'vehicle_details_bloc.dart';

class VehicleDetailsState with EquatableMixin {
  VehicleDetailsState({required this.vehicle});

  final Vehicle vehicle;

  @override
  List<Object?> get props => [vehicle];
}
