part of 'select_job_location_cubit.dart';

@immutable
abstract class SelectJobLocationState {}

class SelectJobLocationInitial extends SelectJobLocationState {}

class SelectedLocationState extends SelectJobLocationState {}

class SetOfficeState extends SelectJobLocationState {}

class SetRemoteState extends SelectJobLocationState {}

class SubmitJobLoadingState extends SelectJobLocationState {}

class SubmitJobSuccessState extends SelectJobLocationState {}

class SubmitJobErrorStates extends SelectJobLocationState {}
