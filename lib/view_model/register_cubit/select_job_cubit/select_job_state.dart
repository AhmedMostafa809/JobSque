part of 'select_job_cubit.dart';

@immutable
abstract class SelectJobState {}

class SelectJobInitial extends SelectJobState {}

class SelectedJobState extends SelectJobState {}
