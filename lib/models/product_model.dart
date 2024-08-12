import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  String? name;
  String? imageUrl;
  String? desc;
  String? price;
  String? type;
  String? id;
  String? departmentId;

  ProductModel({
    this.name,
    this.imageUrl,
    this.desc,
    this.price,
    this.type,
    this.id,
    this.departmentId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        imageUrl: json["imageUrl"],
        desc: json["desc"],
        price: json["price"],
        type: json["type"],
        id: json["id"],
        departmentId: json["departmentId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
        "desc": desc,
        "price": price,
        "type": type,
        "id": id,
        "departmentId": departmentId,
      };
}
