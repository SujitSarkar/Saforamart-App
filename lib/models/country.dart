// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

ListCountryModel listcountryModelFromJson(String str) => ListCountryModel.fromJson(json.decode(str));

String listcountryModelToJson(ListCountryModel data) => json.encode(data.toJson());

class ListCountryModel {
    ListCountryModel({
        required this.data,
    });

    List<CountryModel> data;

    factory ListCountryModel.fromJson(Map<String, dynamic> json) => ListCountryModel(
        data: List<CountryModel>.from(json["data"].map((x) => CountryModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CountryModel {
    CountryModel({
        required this.name,
        required this.capital,
    });

    String name;
    String capital;

    factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"],
        capital: json["capital"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "capital": capital,
    };
}
