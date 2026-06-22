class DiseaseModel {
  final String name;
  final String description;
  final List<String> symptoms;
  final List<String> causes;
  final List<String> fertilizers;
  final List<String> chemicals;
  final List<String> prevention;

  DiseaseModel({
    required this.name,
    required this.description,
    required this.symptoms,
    required this.causes,
    required this.fertilizers,
    required this.chemicals,
    required this.prevention,
  });

  factory DiseaseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return DiseaseModel(
      name: json['name'],
      description: json['description'],
      symptoms: List<String>.from(
        json['symptoms'],
      ),
      causes: List<String>.from(
        json['causes'],
      ),
      fertilizers: List<String>.from(
        json['fertilizers'],
      ),
      chemicals: List<String>.from(
        json['chemicals'],
      ),
      prevention: List<String>.from(
        json['prevention'],
      ),
    );
  }
}