class Cases {
  final String id;
  final String name;
  final String code;
  final String description;

  Cases({this.id, this.name, this.code, this.description});

  factory Cases.fromJson(Map<String, dynamic> json) {
    return Cases(
        id: json['_id'] as String,
        name: json['Name'] as String,
        code: json['Code'] as String,
        description: json['Description'] as String);
  }

  @override
  String toString() {
    return 'Trans{name: $name, code: $code}';
  }
}
