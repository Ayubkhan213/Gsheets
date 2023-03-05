class TranscationModel {
  String transcationName;
  String transcationAmount;
  String transcationType;
  TranscationModel(
      {required this.transcationName,
      required this.transcationAmount,
      required this.transcationType});

  Map<String, dynamic> toMap() {
    return {
      'transcationName': transcationName,
      'transcationAmount': transcationAmount,
      'transcationtype': transcationType,
    };
  }

  List<dynamic> toList() {
    return [
      transcationName,
      transcationAmount,
      transcationType,
    ];
  }
}
