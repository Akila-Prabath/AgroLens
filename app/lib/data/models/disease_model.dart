class DiseaseModel {
  /// Basic Information
  final String name;
  final String scientificName;
  final String description;
  final String imagePath;

  /// Crop Information
  final String cropName;
  final String growthStage;
  final String severity;

  /// Disease Details
  final List<String> symptoms;
  final List<String> causes;

  /// Recommendations
  final List<String> fertilizers;
  final List<String> chemicals;
  final List<String> prevention;

  const DiseaseModel({
    required this.name,
    required this.scientificName,
    required this.description,
    required this.imagePath,
    required this.cropName,
    required this.growthStage,
    required this.severity,
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
      name: json['name'] ?? '',
      scientificName:
          json['scientificName'] ?? '',
      description:
          json['description'] ?? '',
      imagePath:
          json['imagePath'] ?? '',

      cropName:
          json['cropName'] ?? '',

      growthStage:
          json['growthStage'] ?? '',

      severity:
          json['severity'] ?? '',

      symptoms: List<String>.from(
        json['symptoms'] ?? [],
      ),

      causes: List<String>.from(
        json['causes'] ?? [],
      ),

      fertilizers: List<String>.from(
        json['fertilizers'] ?? [],
      ),

      chemicals: List<String>.from(
        json['chemicals'] ?? [],
      ),

      prevention: List<String>.from(
        json['prevention'] ?? [],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'scientificName': scientificName,
      'description': description,
      'imagePath': imagePath,
      'cropName': cropName,
      'growthStage': growthStage,
      'severity': severity,
      'symptoms': symptoms,
      'causes': causes,
      'fertilizers': fertilizers,
      'chemicals': chemicals,
      'prevention': prevention,
    };
  }

  DiseaseModel copyWith({
    String? name,
    String? scientificName,
    String? description,
    String? imagePath,
    String? cropName,
    String? growthStage,
    String? severity,
    List<String>? symptoms,
    List<String>? causes,
    List<String>? fertilizers,
    List<String>? chemicals,
    List<String>? prevention,
  }) {
    return DiseaseModel(
      name: name ?? this.name,
      scientificName:
          scientificName ??
              this.scientificName,
      description:
          description ?? this.description,
      imagePath:
          imagePath ?? this.imagePath,
      cropName:
          cropName ?? this.cropName,
      growthStage:
          growthStage ??
              this.growthStage,
      severity:
          severity ?? this.severity,
      symptoms:
          symptoms ?? this.symptoms,
      causes:
          causes ?? this.causes,
      fertilizers:
          fertilizers ??
              this.fertilizers,
      chemicals:
          chemicals ??
              this.chemicals,
      prevention:
          prevention ??
              this.prevention,
    );
  }

  @override
  String toString() {
    return 'DiseaseModel('
        'name: $name, '
        'scientificName: $scientificName, '
        'cropName: $cropName, '
        'severity: $severity'
        ')';
  }
}