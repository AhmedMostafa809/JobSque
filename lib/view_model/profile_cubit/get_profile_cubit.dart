
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:final_project/controller/dio/dio_helper.dart';
import 'package:final_project/controller/dio/endpoints.dart';
import 'package:final_project/model/profile_models/edit_profile_model.dart';
import 'package:final_project/model/profile_models/get_portofolios.dart';
import 'package:final_project/model/profile_models/portofoli_models.dart';
import 'package:final_project/view_model/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit() : super(GetProfileInitial());

  List <String> cvName =[];
  List <int> cvId =[];
  static GetProfileCubit get(context) => BlocProvider.of(context);
  EditProfileModel editProfileModel = EditProfileModel();
  UploadPortofolioModel uploadPortofolioModel = UploadPortofolioModel();
  GetPortofolioModel getPortofolioModel = GetPortofolioModel();
  editProfile(
    String bio,
    String address,
    String phone,
  ) {
    DioHelper.putData(
            endPoint: EndPoint.editProfile,
            data: {"bio": bio, "address": address, "mobile": phone},
            token: LoginCubit.loginToken)
        .then((value) {
          editProfileModel =EditProfileModel.fromJson(value.data);

      print("Done + ${editProfileModel.data!.mobile.toString()}");
    });
  }

  // Future<void> uploadPortofolios(PlatformFile CV , String name)async{
  //   FormData formData = FormData.fromMap({
  //     "cv_file": await MultipartFile.fromFile(CV.path!, filename: name),
  //     "name": name,
  //   });
  //
  //   DioHelper.postData(endPoint: EndPoint.uploadPortofolio,
  //   data: formData
  //   ).then((value) {
  //     uploadPortofolioModel = UploadPortofolioModel.fromJson(value.data);
  //     // print("cv: ${uploadPortofolioModel.data!.name.toString()}");
  //   });
  // }
  //

  Future<void> uploadFile(PlatformFile CV,String name) async {
    Dio dio = Dio();
    dio.options.headers["Authorization"] = "Bearer ${LoginCubit.loginToken}";
    FormData formData = FormData.fromMap({
      "cv_file": await MultipartFile.fromFile(CV.path!, filename: name),
      "name": name,
    });
    Response response = await dio.post(
        "https://project2.amit-learning.com/api/user/profile/portofolios/10", data: formData);
    if (response.statusCode == 200) {
      uploadPortofolioModel = UploadPortofolioModel.fromJson(response.data);
          print("cv: ${uploadPortofolioModel.data!.name.toString()}");

      // print("cv: ${response.data["data"]["name"]}");
    } else {
      // print("${DioHelper.baseUrl}${EndPoint.uploadPortofolio}");
      // Handle error response
    }
  }

  getPortofolio(){
    DioHelper.getData(endPoint: EndPoint.uploadPortofolio).then((value) {
      final json = value.data;
      final data = json['data'] as List<dynamic>;
      if (data.isNotEmpty) {
        cvName.clear();
        cvId.clear();
        for (final item in data) {
          final cvFile = item['cv_file'] as String?;
          final name = item['name'] as String?;
          final id = item['id'] as int?;
          if (cvFile != null && name != null) {

            cvName.add(name);
            cvId.add(id!);

          }
        }
        print('id: $cvId, Name: $cvName');
      } else {print('No portfolio data available');}

    });
  }
  Future<void> deletePortofolio() async {
    Dio dio = Dio();
    try {
      final response = await dio.delete("https://project2.amit-learning.com/api/user/profile/portofolios/10");
      if (response.statusCode == 200) {
        print('Data deleted successfully');
      } else {
        print('Error deleting data');
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
        print('Server error: ${e.response?.statusMessage}');
        // Display an error message to the user
        // ...
      } else {
        print('Error deleting data: ${e.message}');
        // Handle other types of errors
        // ...
      }
    } catch (e) {
      print('Unknown error: $e');
    }
  }
}

  
  

