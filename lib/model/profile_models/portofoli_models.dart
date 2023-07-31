class UploadPortofolioModel {
  bool? status;
  Data? data;

  UploadPortofolioModel({this.status, this.data});

  UploadPortofolioModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? userId;
  int? profileId;
  String? cvFile;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.name,
        this.userId,
        this.profileId,
        this.cvFile,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['user_id'];
    profileId = json['profile_id'];
    cvFile = json['cv_file'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['profile_id'] = this.profileId;
    data['cv_file'] = this.cvFile;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
