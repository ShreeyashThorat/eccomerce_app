class ProductModel {
  String? sId;
  String? category;
  String? title;
  String? description;
  num? price;
  List<String>? imgUrl;
  String? updatedOn;
  String? createdOn;

  ProductModel(
      {this.sId,
      this.category,
      this.title,
      this.description,
      this.price,
      this.imgUrl,
      this.updatedOn,
      this.createdOn});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    imgUrl = json['imgUrl'].cast<String>();
    updatedOn = json['updatedOn'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['category'] = category;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['imgUrl'] = imgUrl;
    data['updatedOn'] = updatedOn;
    data['createdOn'] = createdOn;
    return data;
  }
}
