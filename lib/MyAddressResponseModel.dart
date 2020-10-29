library MyAddressResponseModel;

import 'package:json_annotation/json_annotation.dart';
import 'package:my_project_name/BaseApiResponse.dart';

part 'MyAddressResponseModel.g.dart';

@JsonSerializable()
class MyAddressResponseModel extends BaseApiResponse {
  List<AddressModel> result;

  MyAddressResponseModel({status, message, resultCode})
      : super(status, message, resultCode);

  MyAddressResponseModel.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (json['Result'] != null) {
      result = new List<AddressModel>();
      json['Result'].forEach((v) {
        result.add(new AddressModel.fromJson(v));
      });
    }
  }

  static const fromJsonFactory = _$MyAddressResponseModelFromJson;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['Result'] = this.result.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

@JsonSerializable()
class AddressModel {
  String name;
  String flat;
  String type = '3';
  bool isDefault;
  String city;
  String area;
  int id;
  String rowVersion;
  String district;
  String landMark;
  String number;
  String street;
  AddressLocation location;
  String buliding;
  String neighborhood;
  int fkArea;
  bool searchWithIt = false;

  AddressModel({
    this.name,
    this.flat,
    this.type,
    this.isDefault,
    this.city,
    this.area,
    this.id,
    this.rowVersion,
    this.district,
    this.landMark,
    this.number,
    this.street,
    this.location,
    this.buliding,
    this.neighborhood,
    this.fkArea,
    this.searchWithIt,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    flat = json['Flat'];
    type = json['Type'];
    isDefault = json['IsDefault'];
    city = json['City'];
    area = json['Area'];
    id = json['Id'];
    rowVersion = json['RowVersion'];
    district = json['District'];
    landMark = json['LandMark'];
    number = json['Number'];
    street = json['Street'];
    location = json['Location'] != null
        ? new AddressLocation.fromJson(json['Location'])
        : null;
    buliding = json['Buliding'];
    neighborhood = json['Neighborhood'];
    fkArea = json['Fk_Area'];
    searchWithIt = false;
  }

  static const fromJsonFactory = _$AddressModelFromJson;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (name != null) data['Name'] = this.name;
    if (flat != null) data['Flat'] = this.flat;
    if (type != null) data['Type'] = this.type;
    if (isDefault != null) data['IsDefault'] = this.isDefault;
    if (city != null) data['City'] = this.city;
    if (area != null) data['Area'] = this.area;
    if (id != null) data['Id'] = this.id;
    if (rowVersion != null) data['RowVersion'] = this.rowVersion;
    if (district != null) data['District'] = this.district;
    if (landMark != null) data['LandMark'] = this.landMark;
    if (number != null) data['Number'] = this.number;
    if (street != null) data['Street'] = this.street;

    if (this.location != null) {
      data['Location'] = this.location.toJson();
    }
    if (buliding != null) data['Buliding'] = this.buliding;
    if (neighborhood != null) data['Neighborhood'] = this.neighborhood;
    if (fkArea != null) data['Fk_Area'] = this.fkArea;
    data['searchWithIt'] = this.searchWithIt;
    return data;
  }
}

@JsonSerializable()
class AddressLocation {
  double latitude;
  double longitude;

  AddressLocation({this.latitude, this.longitude});

  AddressLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['Latitude'];
    longitude = json['Longitude'];
  }

  static const fromJsonFactory = _$AddressLocationFromJson;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    return data;
  }
}

List<AddressModel> addressesList = [];
int searchAddressId;
