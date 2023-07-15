class CategoryModel {
  String? sId;
  String? title;
  String? imgUrl;
  String? updatedOn;
  String? createdOn;

  CategoryModel(
      {this.sId, this.title, this.imgUrl, this.updatedOn, this.createdOn});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    imgUrl = json['imgUrl'];
    updatedOn = json['updatedOn'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['imgUrl'] = imgUrl;
    data['updatedOn'] = updatedOn;
    data['createdOn'] = createdOn;
    return data;
  }
}
