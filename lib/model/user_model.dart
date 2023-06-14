class UserModel {
  bool? status;
  String? message;
  List<Data>? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
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
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  User? user;
  String? status;
  String? date;
  int? iV;
  String? createdAt;
  String? updatedAt;
  String? inTime;
  String? outTime;
  String? dateString;

  Data(
      {this.sId,
        this.user,
        this.status,
        this.date,
        this.iV,
        this.createdAt,
        this.updatedAt,
        this.inTime,
        this.outTime,
        this.dateString});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    status = json['status'];
    date = json['date'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    inTime = json['inTime'];
    outTime = json['outTime'];
    dateString = json['dateString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['status'] = this.status;
    data['date'] = this.date;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['inTime'] = this.inTime;
    data['outTime'] = this.outTime;
    data['dateString'] = this.dateString;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? userId;
  String? position;
  String? picture;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
        this.name,
        this.userId,
        this.position,
        this.picture,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    userId = json['userId'];
    position = json['position'];
    picture = json['picture'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['userId'] = this.userId;
    data['position'] = this.position;
    data['picture'] = this.picture;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}