class Conditions {
  late int id;
  late String name;
  late int medicineId;

  Conditions(this.id, this.name, this.medicineId);
  Conditions.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        medicineId = json['medicineId_id'];
  Map toJson() {
    return {
      'id': id,
      'name': name,
      'medicineId_id': medicineId,
    };
  }
}
