// To parse this JSON data, do
//
//     final itementry = itementryFromJson(jsonString);

import 'dart:convert';

Itementry itementryFromJson(String str) => Itementry.fromJson(json.decode(str));

String itementryToJson(Itementry data) => json.encode(data.toJson());

class Itementry {
    String model;
    String pk;
    Fields fields;

    Itementry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Itementry.fromJson(Map<String, dynamic> json) => Itementry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    int rarity;
    int rating;
    String kategories;
    DateTime time;
    String imageUrl;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.rarity,
        required this.rating,
        required this.kategories,
        required this.time,
        required this.imageUrl,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        rarity: json["rarity"],
        rating: json["rating"],
        kategories: json["kategories"],
        time: DateTime.parse(json["time"]),
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "rarity": rarity,
        "rating": rating,
        "kategories": kategories,
        "time": time.toIso8601String(),
        "image_url": imageUrl,
    };
}
