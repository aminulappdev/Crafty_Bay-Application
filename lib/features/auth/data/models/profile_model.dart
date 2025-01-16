import 'package:crafty_bay/features/auth/data/models/user_model.dart';

class ProfileModel {
  int? id;
  String? cusName;
  String? cusAdd;
  String? cusCity;
  String? cusState;
  int? cusPostcode; // Changed to `int?`
  String? cusCountry;
  String? cusPhone;
  String? cusFax;
  String? shipName;
  String? shipAdd;
  String? shipCity;
  String? shipState;
  int? shipPostcode; // Changed to `int?`
  String? shipCountry;
  String? shipPhone;
  int? userId; // Changed to `int?`
  String? createdAt;
  String? updatedAt;
  UserModel? user;

  ProfileModel({
    this.id,
    this.cusName,
    this.cusAdd,
    this.cusCity,
    this.cusState,
    this.cusPostcode,
    this.cusCountry,
    this.cusPhone,
    this.cusFax,
    this.shipName,
    this.shipAdd,
    this.shipCity,
    this.shipState,
    this.shipPostcode,
    this.shipCountry,
    this.shipPhone,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
    cusAdd = json['cus_add'];
    cusCity = json['cus_city'];
    cusState = json['cus_state'];
    cusPostcode = json['cus_postcode'] is int
        ? json['cus_postcode']
        : int.tryParse(json['cus_postcode'] ?? '0');
    cusCountry = json['cus_country'];
    cusPhone = json['cus_phone'];
    cusFax = json['cus_fax'];
    shipName = json['ship_name'];
    shipAdd = json['ship_add'];
    shipCity = json['ship_city'];
    shipState = json['ship_state'];
    shipPostcode = json['ship_postcode'] is int
        ? json['ship_postcode']
        : int.tryParse(json['ship_postcode'] ?? '0');
    shipCountry = json['ship_country'];
    shipPhone = json['ship_phone'];
    userId = json['user_id'] is int
        ? json['user_id']
        : int.tryParse(json['user_id'] ?? '0');
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }
}
