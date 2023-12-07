import 'package:e_commerce/Domain/entities/CategoryEntity.dart';

class CategoryOrBrandResponseDm extends CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseDm({
    super.results,
    this.metadata,
    this.message,
    this.statusMsg,
    super.data,
  });

  CategoryOrBrandResponseDm.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandDM.fromJson(v));
      });
    }
  }

  Metadata? metadata;
  String? message;
  String? statusMsg;
}

class CategoryOrBrandDM extends CategoryOrBrandEntity {
  CategoryOrBrandDM({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoryOrBrandDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;
}

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  int? currentPage;
  int? numberOfPages;
  int? limit;
}
