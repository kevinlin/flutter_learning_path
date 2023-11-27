import 'package:flutter_learning_path/features/sign_up/gender_picker.dart';

class UserDataPayload {
  String id;
  GenderType? gender;
  DateTime? dateOfBirth;
  int height;
  int weight;

  UserDataPayload(
    this.id,
    this.gender,
    this.dateOfBirth,
    this.height,
    this.weight,
  );

  @override
  String toString() {
    return 'UserDataPayload{id: $id, gender: $gender, dateOfBirth: $dateOfBirth, height: $height, weight: $weight}';
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "gender": gender?.name,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "height": height,
        "weight": weight,
      };
}
