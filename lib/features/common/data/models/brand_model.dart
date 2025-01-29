
class BrandModel {
  int? id;
  String? brandName;
  String? brandImg;
  String? createdAt;
  String? updatedAt;

  BrandModel(
      {this.id, this.brandName, this.brandImg, this.createdAt, this.updatedAt});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brandName'];
    brandImg = json['brandImg'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brandName'] = this.brandName;
    data['brandImg'] = this.brandImg;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}