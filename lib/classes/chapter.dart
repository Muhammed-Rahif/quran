import 'dart:convert';

class GetAllChaptersResponse {
  final List<Chapter> chapters;

  GetAllChaptersResponse({
    required this.chapters,
  });

  GetAllChaptersResponse copyWith({
    List<Chapter>? chapters,
  }) =>
      GetAllChaptersResponse(
        chapters: chapters ?? this.chapters,
      );

  factory GetAllChaptersResponse.fromRawJson(String str) =>
      GetAllChaptersResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetAllChaptersResponse.fromJson(Map<String, dynamic> json) =>
      GetAllChaptersResponse(
        chapters: List<Chapter>.from(
            json["chapters"].map((x) => Chapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
      };
}

class GetChapterResponse {
  final Chapter chapter;

  GetChapterResponse({
    required this.chapter,
  });

  GetChapterResponse copyWith({
    Chapter? chapter,
  }) =>
      GetChapterResponse(
        chapter: chapter ?? this.chapter,
      );

  factory GetChapterResponse.fromRawJson(String str) =>
      GetChapterResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetChapterResponse.fromJson(Map<String, dynamic> json) =>
      GetChapterResponse(
        chapter: Chapter.fromJson(json["chapter"]),
      );

  Map<String, dynamic> toJson() => {
        "chapter": chapter.toJson(),
      };
}

class Chapter {
  final int id;
  final RevelationPlace revelationPlace;
  final int revelationOrder;
  final bool bismillahPre;
  final String nameSimple;
  final String nameComplex;
  final String nameArabic;
  final int versesCount;
  final List<int> pages;
  final TranslatedName translatedName;

  Chapter({
    required this.id,
    required this.revelationPlace,
    required this.revelationOrder,
    required this.bismillahPre,
    required this.nameSimple,
    required this.nameComplex,
    required this.nameArabic,
    required this.versesCount,
    required this.pages,
    required this.translatedName,
  });

  Chapter copyWith({
    int? id,
    RevelationPlace? revelationPlace,
    int? revelationOrder,
    bool? bismillahPre,
    String? nameSimple,
    String? nameComplex,
    String? nameArabic,
    int? versesCount,
    List<int>? pages,
    TranslatedName? translatedName,
  }) =>
      Chapter(
        id: id ?? this.id,
        revelationPlace: revelationPlace ?? this.revelationPlace,
        revelationOrder: revelationOrder ?? this.revelationOrder,
        bismillahPre: bismillahPre ?? this.bismillahPre,
        nameSimple: nameSimple ?? this.nameSimple,
        nameComplex: nameComplex ?? this.nameComplex,
        nameArabic: nameArabic ?? this.nameArabic,
        versesCount: versesCount ?? this.versesCount,
        pages: pages ?? this.pages,
        translatedName: translatedName ?? this.translatedName,
      );

  factory Chapter.fromRawJson(String str) => Chapter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        revelationPlace: revelationPlaceValues.map[json["revelation_place"]]!,
        revelationOrder: json["revelation_order"],
        bismillahPre: json["bismillah_pre"],
        nameSimple: json["name_simple"],
        nameComplex: json["name_complex"],
        nameArabic: json["name_arabic"],
        versesCount: json["verses_count"],
        pages: List<int>.from(json["pages"].map((x) => x)),
        translatedName: TranslatedName.fromJson(json["translated_name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "revelation_place": revelationPlaceValues.reverse[revelationPlace],
        "revelation_order": revelationOrder,
        "bismillah_pre": bismillahPre,
        "name_simple": nameSimple,
        "name_complex": nameComplex,
        "name_arabic": nameArabic,
        "verses_count": versesCount,
        "pages": List<dynamic>.from(pages.map((x) => x)),
        "translated_name": translatedName.toJson(),
      };
}

enum RevelationPlace { madinah, makkah }

final revelationPlaceValues = EnumValues(
    {"madinah": RevelationPlace.madinah, "makkah": RevelationPlace.makkah});

class TranslatedName {
  final LanguageName languageName;
  final String name;

  TranslatedName({
    required this.languageName,
    required this.name,
  });

  TranslatedName copyWith({
    LanguageName? languageName,
    String? name,
  }) =>
      TranslatedName(
        languageName: languageName ?? this.languageName,
        name: name ?? this.name,
      );

  factory TranslatedName.fromRawJson(String str) =>
      TranslatedName.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TranslatedName.fromJson(Map<String, dynamic> json) => TranslatedName(
        languageName: languageNameValues.map[json["language_name"]]!,
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language_name": languageNameValues.reverse[languageName],
        "name": name,
      };
}

enum LanguageName { english }

final languageNameValues = EnumValues({"english": LanguageName.english});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
