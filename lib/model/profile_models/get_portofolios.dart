class GetPortofolioModel {
  bool? status;
  List<Data>? data;

  GetPortofolioModel({this.status, this.data});

  GetPortofolioModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? cvFile;
  String? name;
  int? userId;
  int? profileId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.cvFile,
        this.name,
        this.userId,
        this.profileId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cvFile = json['cv_file'];
    name = json['name'];
    userId = json['user_id'];
    profileId = json['profile_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cv_file'] = this.cvFile;
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['profile_id'] = this.profileId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
