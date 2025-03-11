import 'package:crafty_bay/features/home/data/models/slider_model.dart';

class SliderPaginationModel {
  int? code;
  String? status;
  String? msg;
  SliderListDataModel? data;

  SliderPaginationModel({this.code, this.status, this.msg, this.data});

  SliderPaginationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new SliderListDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
