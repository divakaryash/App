import 'dart:convert';

import 'package:aaaaa/icecream/model/icecream.dart';
//import 'package:aaaaa/icecream/model/icecream1.dart';

IcecreamData icecreamDataFromJson(String str){
  final jsonData = json.decode(str);
  return IcecreamData.fromJson(jsonData);
}
String icecreamDataToJson(IcecreamData data){
  final dyn = data.toJson();
  return json.encode(dyn);
}
class IcecreamData{
  List<Icecream>? icecreams;

  IcecreamData({
    this.icecreams,
});
  factory IcecreamData.fromJson(Map<String, dynamic> json)=> IcecreamData(
    icecreams: List<Icecream>.from(
      json["icecreams"].map((x) => Icecream.fromJson(x))),
  );
  Map<String,dynamic> toJson() =>{
    "icecreams": List<dynamic>.from(icecreams!.map((x) => x.toJson())),
  };
}
class Icecream{
  String flavor;
  String? description;
  List<String>? toppings;
  double price;
  String? image;
  List<Ingredient> ingredients;

  Icecream({
    required this .flavor,
    required this .description,
    this .toppings,
    required this .price,
    this .image,
    required this .ingredients,
});
  factory Icecream.fromJson(Map<String, dynamic>json) => Icecream(
    flavor: json["flavor"],
    description: json["description"],
    toppings: json["toppings"] != null
        ? List<String>.from(json["topping"].map((x) => x))
        : null,
    price: json["price"],
    image: json["image"],
    ingredients: List<Ingredient>.from(
      json["ingredients"].map((x) => Ingredient.fromJson(x))),
  );
  Map<String,dynamic> toJson() => {
    "flavor" : flavor,
    "description" : description,
    "toppings" : toppings != null? List<dynamic>.from(toppings!.map((x) => x))
        :null,
    "price" : price,
    "image" : image,
    "ingredients" : List<dynamic>.from(ingredients.map((x) => x.toJson)),
  };
}
class Ingredient{
  String name;
  String quantity;

  Ingredient({
    required this.name,
    required this.quantity,
});
  factory Ingredient.fromJson(Map<String, dynamic>)(
      name: json["name"],
      quantity: json["quantity"],
    );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
  };
}