
class SliderModel {
  String? sId;
  String? photoUrl;
  String? description;
  String? product;
  String? brand;
  Null? category;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SliderModel(
      {this.sId,
      this.photoUrl,
      this.description,
      this.product,
      this.brand,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SliderModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    photoUrl = json['photo_url'];
    description = json['description'];
    product = json['product'];
    brand = json['brand'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['photo_url'] = this.photoUrl;
    data['description'] = this.description;
    data['product'] = this.product;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
