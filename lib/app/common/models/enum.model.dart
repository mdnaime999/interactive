// ignore_for_file: constant_identifier_names

enum StreamStatus {
  COMPLETED,
  ACTIVE
}

final streamStatusValues = EnumValues({
  "Completed": StreamStatus.COMPLETED,
  "Active": StreamStatus.ACTIVE
});

enum Gender {
  FEMALE,
  MALE
}

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "male": Gender.MALE
});

enum LoginProvider {
  GOOGLE
}

final loginProviderValues = EnumValues({
  "Google": LoginProvider.GOOGLE
});

enum LiveType {
  LIVE,
  PK,
  PARTY
}

final liveTypeValues = EnumValues({
  "live": LiveType.LIVE,
  "pk": LiveType.PK,
  "party": LiveType.PARTY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
