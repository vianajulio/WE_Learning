import 'dart:convert';

class Category {
  int? id;
  String? name;
  String? description;
  String? pierSitReg;

  Category({
    this.id,
    this.name,
    this.description,
    this.pierSitReg,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pierSitReg: json['pierSitReg'],
    );
  }

  List<Category> listFromJson(List<Map<String, dynamic>> json) {
    var lista =
        List<Category>.from(json.map((json) => Category.fromJson(json)));
    return lista;
  }

  List<Category> listFromJsonDynamic(List<dynamic> json) {
    var lista =
        List<Category>.from(json.map((json) => Category.fromJson(json)));
    return lista;
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'pierSitReg': pierSitReg,
    };
  }
}
