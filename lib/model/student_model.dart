class StudentModel {
  final String id;
  final String name;
  final String email;
  final String image;
  int? score;

  StudentModel({
    required this.id,
    required this.name,
    required this.image,
    this.score,
    required this.email,
  });
  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        score: json['score'],
        email: json['email'],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    if (score != null) {
      data['score'] = score;
    }

    return data;
  }
}
