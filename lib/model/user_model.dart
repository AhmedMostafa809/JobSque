class UserModel{
  String? id,email,name,password,job,location;

  UserModel({
     this.id,
     this.email,
     this.name,
     this.password,
     this.job,
     this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'email': this.email,
      'name': this.name,
      'password': this.password,
      'job': this.job,
      'location': this.location,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      password: map['password'] as String,
      job: map['job'] as String,
      location: map['location'] as String,
    );
  }
}