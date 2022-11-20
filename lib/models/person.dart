// To parse this JSON data, do
//
//     final Person = PersonFromJson(jsonString);

import 'dart:convert';

class Person {
    Person({
      required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company,
    });

    final int id;
    final String name;
    final String username;
    final String email;
    final Address address;
    final String phone;
    final String website;
    final Company company;

    factory Person.fromRawJson(String str) => Person.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJson(json["company"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
    };

  static Future<List<Person>> listFromJson(String body) {
    return Future.value(List<Person>.from(json.decode(body).map((x) => Person.fromJson(x))));
  }
}

class Address {
    Address({
      required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo,
    });

    final String street;
    final String suite;
    final String city;
    final String zipcode;
    final Geo geo;

    factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
    };
}

class Geo {
    Geo({
      required this.lat,
      required this.lng,
    });

    final String lat;
    final String lng;

    factory Geo.fromRawJson(String str) => Geo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Company {
    Company({
      required this.name,
      required this.catchPhrase,
      required this.bs,
    });

    final String name;
    final String catchPhrase;
    final String bs;

    factory Company.fromRawJson(String str) => Company.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
    };
}
