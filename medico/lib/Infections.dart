class Infections {
  late int id;
  late String name;
  late int conditionId;

  Infections(this.id, this.name, this.conditionId);
  Infections.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        conditionId = json['conditionId_id'];
  Map toJson() {
    return {
      'id': id,
      'name': name,
      'conditionId_id': conditionId,
    };
  }
}
