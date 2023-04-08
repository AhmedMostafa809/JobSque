import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'select_job_state.dart';

class SelectJobCubit extends Cubit<SelectJobState> {
  SelectJobCubit() : super(SelectJobInitial());

  static SelectJobCubit get(context) => BlocProvider.of(context);
  bool UI_UX_designer = false;
  bool illustratorDesigner = false;
  bool developer = false;
  bool management = false;
  bool informationTechnology = false;
  bool researchAnalytics = false;
  List selectedJobsList = [];

  void selectUIUXDesigner() {
    if (UI_UX_designer == true) {
      selectedJobsList.remove('UI/UX Designer');
      UI_UX_designer = false;
    } else if (UI_UX_designer == false) {
      selectedJobsList.add('UI/UX Designer');
      UI_UX_designer = true;
    }

    emit(SelectedJobState());
  }

  void selectIllustratorDesigner() {
    if (illustratorDesigner == true) {
      selectedJobsList.remove('Illustrator Category');

      illustratorDesigner = false;
    } else if (illustratorDesigner == false) {
      selectedJobsList.add('Illustrator Category');

      illustratorDesigner = true;
    }
    emit(SelectedJobState());
  }

  void selectDeveloper() {
    if (developer == true) {
      selectedJobsList.remove('Developer');

      developer = false;
    } else if (developer == false) {
      selectedJobsList.add('Developer');

      developer = true;
    }
    emit(SelectedJobState());
  }

  void selectManagement() {
    if (management == true) {
      selectedJobsList.remove('Management');
      management = false;
    } else if (management == false) {
      selectedJobsList.add('Management');

      management = true;
    }
    emit(SelectedJobState());
  }

  void selectInformationTechnology() {
    if (informationTechnology == true) {
      selectedJobsList.remove('Information Technology');

      informationTechnology = false;
    } else if (informationTechnology == false) {
      selectedJobsList.add('Information Technology');

      informationTechnology = true;
    }
    emit(SelectedJobState());
  }

  void selectResearchAnalytics() {
    if (researchAnalytics == true) {
      selectedJobsList.remove('Research and Analytics');

      researchAnalytics = false;
    } else if (researchAnalytics == false) {
      selectedJobsList.add('Research and Analytics');

      researchAnalytics = true;
    }
    emit(SelectedJobState());
    // print(selectedJobsList);
  }
}
