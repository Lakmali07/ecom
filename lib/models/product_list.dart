class ProductList {
  int? code;
  String? message;
  Data? data;

  ProductList({this.code, this.message, this.data});

  ProductList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
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
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
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
        images!.add(new Images.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['discount_price'] = this.discountPrice;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    data['shortDescription'] = this.shortDescription;
    data['product_code'] = this.productCode;
    data['search_url'] = this.searchUrl;
    data['name'] = this.name;
    data['price_currency'] = this.priceCurrency;
    data['rate'] = this.rate;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order'] = this.order;
    data['url'] = this.url;
    return data;
  }
}