class Medicines {
  late String name;
  late int id;

  Medicines(this.id, this.name);
  Medicines.fromJson(Map json)
      : id = json['id'],
        name = json['name'];
  Map toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
