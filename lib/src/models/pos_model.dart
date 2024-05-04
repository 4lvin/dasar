class PosModel {
  bool? success;
  List<Data>? data;
  String? message;

  PosModel({this.success, this.data, this.message});

  PosModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? patrolPlaceId;
  String? description;
  String? createdAt;
  String? updatedAt;
  bool? done;
  Location? location;

  Data(
      {this.id,
        this.patrolPlaceId,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.done,
        this.location});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patrolPlaceId = json['patrol_place_id'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    done = json['done'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patrol_place_id'] = this.patrolPlaceId;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['done'] = this.done;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  int? id;
  String? name;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;

  Location(
      {this.id,
        this.name,
        this.image,
        this.description,
        this.createdAt,
        this.updatedAt});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
