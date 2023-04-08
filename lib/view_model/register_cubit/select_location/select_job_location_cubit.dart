import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../utilities/assets/app_assets.dart';

part 'select_job_location_state.dart';

class SelectJobLocationCubit extends Cubit<SelectJobLocationState> {
  SelectJobLocationCubit() : super(SelectJobLocationInitial());

  static SelectJobLocationCubit get(context) => BlocProvider.of(context);

  // List<Map> countries = [
  //   {
  //     'image': Img.america,
  //     'name': 'United States',
  //     'selected': false,
  //   },
  //   {
  //     'image': Img.malisia,
  //     'name': 'Malaysia',
  //     'selected': false,
  //   },
  //   {
  //     'image': Img.singaphor,
  //     'name': 'Singapore',
  //     'selected': false,
  //   },
  //   {
  //     'image': Img.indonisia,
  //     'name': 'Indonesia',
  //     'selected': false,
  //   },
  //   {
  //     'image': Img.philipine,
  //     'name': 'Philiphines',
  //     'selected': false,
  //   },
  //   {
  //     'image': Img.poland,
  //     'name': 'Polandia',
  //     'selected': false,
  //   },
  //   {
  //     'image': Img.india,
  //     'name': 'India',
  //     'selected': false,
  //   },
  //   {
  //     'image': Img.vitnam,
  //     'name': 'Vietnam',
  //     'selected': false,
  //   },
  //   {
  //     'image': Img.china,
  //     'name': 'China',
  //     'selected': false,
  //   },
  //   {
  //     'image': Img.canada,
  //     'name': 'Canada',
  //     'selected': false,
  //   },
  //   {
  //     'image': Img.saudia,
  //     'name': 'Saudi Arabia',
  //     'selected': false,
  //   },
  //   {
  //     'image': Img.argantine,
  //     'name': 'Argentina',
  //     'selected': false,
  //   },
  //   {
  //     'image': Img.brazil,
  //     'name': 'Brazil',
  //     'selected': false,
  //   },
  // ];

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
  bool returnFalse(bool f){
    f = false;
    return f;
  }



}
