// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class PageProps {
  PageProps({
    required this.banners,
    required this.categories,
    required this.popups,
    required this.lang,
    required this.namespaces,
  });

  List<Banner> banners;
  List<Category> categories;
  List<Popup> popups;
  String lang;
  Namespaces namespaces;

  factory PageProps.fromJson(Map<String, dynamic> json) => PageProps(
        banners:
            List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        popups: List<Popup>.from(json["popups"].map((x) => Popup.fromJson(x))),
        lang: json["__lang"],
        namespaces: Namespaces.fromJson(json["__namespaces"]),
      );
}

class Banner {
  Banner({
    required this.id,
    required this.title,
    required this.position,
    required this.image,
    required this.url,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.shipperId,
    required this.about,
  });

  String id;
  Title title;
  String position;
  String image;
  String url;
  bool active;
  String createdAt;
  String updatedAt;
  String shipperId;
  String about;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        position: json["position"],
        image: json["image"],
        url: json["url"],
        active: json["active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        shipperId: json["shipper_id"],
        about: json["about"],
      );
}

class Title {
  Title({
    required this.uz,
    required this.ru,
    required this.en,
  });

  String uz;
  String ru;
  String en;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        uz: json["uz"],
        ru: json["ru"],
        en: json["en"],
      );
}

class Category {
  Category({
    required this.id,
    required this.slug,
    required this.parentId,
    required this.image,
    required this.description,
    required this.title,
    required this.orderNo,
    required this.active,
    required this.products,
    this.childCategories,
  });

  String id;
  String slug;
  String parentId;
  String image;
  Title description;
  Title title;
  String orderNo;
  bool active;
  List<Product> products;
  dynamic childCategories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        slug: json["slug"],
        parentId: json["parent_id"],
        image: json["image"],
        description: Title.fromJson(json["description"]),
        title: Title.fromJson(json["title"]),
        orderNo: json["order_no"],
        active: json["active"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        childCategories: json["child_categories"],
      );
}

class Product {
  Product({
    required this.id,
    required this.outPrice,
    required this.currency,
    required this.string,
    required this.type,
    required this.categories,
    required this.brandId,
    required this.rateId,
    required this.image,
    required this.activeInMenu,
    required this.hasModifier,
    required this.fromTime,
    required this.toTime,
    required this.offAlways,
    this.gallery,
    required this.title,
    required this.description,
    required this.active,
    required this.iikoId,
    required this.jowiId,
  });

  String id;
  int outPrice;
  Currency currency;
  String string;
  Type type;
  List<String> categories;
  String brandId;
  String rateId;
  String image;
  bool activeInMenu;
  bool hasModifier;
  String fromTime;
  String toTime;
  bool offAlways;
  dynamic gallery;
  Title title;
  Title description;
  bool active;
  String iikoId;
  String jowiId;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        outPrice: json["out_price"],
        currency: currencyValues.map[json["currency"]]!,
        string: json["string"],
        type: typeValues.map[json["type"]]!,
        categories: List<String>.from(json["categories"].map((x) => x)),
        brandId: json["brand_id"],
        rateId: json["rate_id"],
        image: json["image"],
        activeInMenu: json["active_in_menu"],
        hasModifier: json["has_modifier"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        offAlways: json["off_always"],
        gallery: json["gallery"],
        title: Title.fromJson(json["title"]),
        description: Title.fromJson(json["description"]),
        active: json["active"],
        iikoId: json["iiko_id"],
        jowiId: json["jowi_id"],
      );
}

enum Currency { UZS }

final currencyValues = EnumValues({"UZS": Currency.UZS});

enum Type { SIMPLE, ORIGIN }

final typeValues = EnumValues({"origin": Type.ORIGIN, "simple": Type.SIMPLE});

class Namespaces {
  Namespaces({
    required this.common,
  });

  Map<String, String> common;

  factory Namespaces.fromJson(Map<String, dynamic> json) => Namespaces(
        common: Map.from(json["common"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );
}

class Popup {
  Popup({
    required this.title,
    required this.about,
    required this.image,
    required this.fromDate,
    required this.toDate,
    required this.fromTime,
    required this.toTime,
    required this.url,
    required this.button,
    required this.active,
    required this.shipperId,
    required this.id,
    required this.orderNo,
  });

  Title title;
  Title about;
  String image;
  String fromDate;
  String toDate;
  String fromTime;
  String toTime;
  String url;
  Title button;
  bool active;
  String shipperId;
  String id;
  int orderNo;

  factory Popup.fromJson(Map<String, dynamic> json) => Popup(
        title: Title.fromJson(json["title"]),
        about: Title.fromJson(json["about"]),
        image: json["image"],
        fromDate: json["from_date"],
        toDate: json["to_date"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        url: json["url"],
        button: Title.fromJson(json["button"]),
        active: json["active"],
        shipperId: json["shipper_id"],
        id: json["id"],
        orderNo: json["order_no"],
      );
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
