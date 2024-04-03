class ProductList {
  int? code;
  String? message;
  Data? data;

  ProductList({this.code, this.message, this.data});

  ProductList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Products>? products;
  int? total;

  Data({this.products, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class Products {
  double? price;
  int? discount;
  double? discountPrice;
  List<Images>? images;
  String? code;
  String? shortDescription;
  String? productCode;
  String? searchUrl;
  String? name;
  String? priceCurrency;
  String? rate;

  Products(
      {this.price,
        this.discount,
        this.discountPrice,
        this.images,
        this.code,
        this.shortDescription,
        this.productCode,
        this.searchUrl,
        this.name,
        this.priceCurrency,
        this.rate});

  Products.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    code = json['code'];
    shortDescription = json['shortDescription'];
    productCode = json['product_code'];
    searchUrl = json['search_url'];
    name = json['name'];
    priceCurrency = json['price_currency'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['price'] = price;
    data['discount'] = discount;
    data['discount_price'] = discountPrice;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['shortDescription'] = shortDescription;
    data['product_code'] = productCode;
    data['search_url'] = searchUrl;
    data['name'] = name;
    data['price_currency'] = priceCurrency;
    data['rate'] = rate;
    return data;
  }
}

class Images {
  int? order;
  String? url;

  Images({this.order, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['order'] = order;
    data['url'] = url;
    return data;
  }
}