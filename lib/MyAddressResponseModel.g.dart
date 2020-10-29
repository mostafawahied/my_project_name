// GENERATED CODE - DO NOT MODIFY BY HAND

part of MyAddressResponseModel;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAddressResponseModel _$MyAddressResponseModelFromJson(
    Map<String, dynamic> json) {
  return MyAddressResponseModel(
    status: json['status'],
  )
    ..ResultCode = json['ResultCode']?.toString()
    ..Message = json['Message']?.toString()
    ..result = (json['result'] != null &&
                json['result']?.toString()?.isNotEmpty == true &&
                json['result'] is List
            ? json['result'] as List
            : null)
        ?.map((e) =>
            e == null ? null : AddressModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MyAddressResponseModelToJson(
        MyAddressResponseModel instance) =>
    <String, dynamic>{
      'ResultCode': instance.ResultCode,
      'Message': instance.Message,
      'status': instance.status,
      'result': instance.result,
    };

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return AddressModel(
    name: json['name']?.toString(),
    flat: json['flat']?.toString(),
    type: json['type']?.toString(),
    isDefault: json['isDefault'] as bool,
    city: json['city']?.toString(),
    area: json['area']?.toString(),
    id: json['id'] != null && json['id']?.toString()?.isNotEmpty == true
        ? int.tryParse(json['id'].toString()) ??
            (throw FormatException(
                "The expected type: `int` but the recived value is ${json['id']} in json['id']"))
        : null,
    rowVersion: json['rowVersion']?.toString(),
    district: json['district']?.toString(),
    landMark: json['landMark']?.toString(),
    number: json['number']?.toString(),
    street: json['street']?.toString(),
    location: json['location'] == null
        ? null
        : AddressLocation.fromJson(json['location'] as Map<String, dynamic>),
    buliding: json['buliding']?.toString(),
    neighborhood: json['neighborhood']?.toString(),
    fkArea: json['fkArea'] != null &&
            json['fkArea']?.toString()?.isNotEmpty == true
        ? int.tryParse(json['fkArea'].toString()) ??
            (throw FormatException(
                "The expected type: `int` but the recived value is ${json['fkArea']} in json['fkArea']"))
        : null,
    searchWithIt: json['searchWithIt'] as bool,
  );
}

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'flat': instance.flat,
      'type': instance.type,
      'isDefault': instance.isDefault,
      'city': instance.city,
      'area': instance.area,
      'id': instance.id,
      'rowVersion': instance.rowVersion,
      'district': instance.district,
      'landMark': instance.landMark,
      'number': instance.number,
      'street': instance.street,
      'location': instance.location,
      'buliding': instance.buliding,
      'neighborhood': instance.neighborhood,
      'fkArea': instance.fkArea,
      'searchWithIt': instance.searchWithIt,
    };

AddressLocation _$AddressLocationFromJson(Map<String, dynamic> json) {
  return AddressLocation(
    latitude: json['latitude'] != null &&
            json['latitude']?.toString()?.isNotEmpty == true
        ? double.tryParse(json['latitude'].toString()) ??
            (throw FormatException(
                "The expected type: `double` but the recived value is ${json['latitude']} in json['latitude']"))
        : null,
    longitude: json['longitude'] != null &&
            json['longitude']?.toString()?.isNotEmpty == true
        ? double.tryParse(json['longitude'].toString()) ??
            (throw FormatException(
                "The expected type: `double` but the recived value is ${json['longitude']} in json['longitude']"))
        : null,
  );
}

Map<String, dynamic> _$AddressLocationToJson(AddressLocation instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
