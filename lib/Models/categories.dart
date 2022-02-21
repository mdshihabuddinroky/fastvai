// To parse this JSON data, do
//
//     final Categories = CategoriesFromJson(jsonString);

import 'dart:convert';
List<Categories> categoriesFromJson(String str) => List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
    Categories({
        required this.id,
        required this.name,
        required this.parent,
        required this.description,
        required this.image,
        required this.menuOrder,
        required this.count,
    });

    int id;
    String name;
    int parent;
    String description;
    Image image;
    int menuOrder;
    int count;

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
        parent: json["parent"],
        description: json["description"],
        image: Image.fromJson(json["image"]),
        menuOrder: json["menu_order"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent": parent,
        "description": description,
        "image": image.toJson(),
        "menu_order": menuOrder,
        "count": count,
    };
}

class Image {
    Image({
        required this.id,
        required this.src,
    });

    int id;
    String src;
    

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        src: json["src"],
       
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "src": src
    };
}
