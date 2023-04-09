import 'package:bloc/bloc.dart';
import 'package:final_project/controller/dio/dio_helper.dart';
import 'package:final_project/controller/dio/endpoints.dart';
import 'package:final_project/model/auth_models/select_job_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../utilities/assets/app_assets.dart';

part 'select_job_location_state.dart';

class SelectJobLocationCubit extends Cubit<SelectJobLocationState> {
  SelectJobLocationCubit() : super(SelectJobLocationInitial());

  static SelectJobLocationCubit get(context) => BlocProvider.of(context);

  SelectJobModel selectJobModel = SelectJobModel();

  bool selectLocation(bool isSelected) {
    if (isSelected == true) {
      isSelected = false;
      print('val changed to false');
    } else if (isSelected == false) {
      isSelected = true;
      print('val changed to true');
    }
    print('cupit  ${isSelected}');
    emit(SelectedLocationState());

    return isSelected;
  }

  bool setOfficeJobs(bool home) {
    if (home == false) {
      home = true;
    } else if (home == true) {
      home = false;
    }
    emit(SetOfficeState());
    return home;
  }

  bool setRemoteJobs(bool away) {
    if (away == false) {
      away = true;
    } else if (away == true) {
      away = false;
    }
    emit(SetRemoteState());
    return away;
  }

  bool returnFalse(bool f) {
    f = false;
    return f;
  }

  void submitJobs(String selectedJobFromList, String officeJobLocations,
      String remoteJobLocations, String token, int id) {
    emit(SubmitJobLoadingState());
    DioHelper.putData(
            endPoint: "${EndPoint.selectJobUrl}/$id}",
            data: {
              "intersted_work": selectedJobFromList,
              "offline_place": officeJobLocations,
              "remote_place": remoteJobLocations
            },
            token: token,
           )
        .then((value) {
      selectJobModel = SelectJobModel.fromJson(value.data);
      print("selected jobs from cubit ::  ${value.data}     :: Done");
      emit(SubmitJobSuccessState());
    }).catchError((error) {
      emit(SubmitJobErrorStates());
    });
  }
}
