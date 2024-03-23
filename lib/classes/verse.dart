import 'dart:convert';

class GetVersesResponse {
  final List<Verse> verses;
  final Pagination pagination;

  GetVersesResponse({
    required this.verses,
    required this.pagination,
  });

  GetVersesResponse copyWith({
    List<Verse>? verses,
    Pagination? pagination,
  }) =>
      GetVersesResponse(
        verses: verses ?? this.verses,
        pagination: pagination ?? this.pagination,
      );

  factory GetVersesResponse.fromRawJson(String str) =>
      GetVersesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetVersesResponse.fromJson(Map<String, dynamic> json) =>
      GetVersesResponse(
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  final int perPage;
  final int currentPage;
  final dynamic nextPage;
  final int totalPages;
  final int totalRecords;

  Pagination({
    required this.perPage,
    required this.currentPage,
    required this.nextPage,
    required this.totalPages,
    required this.totalRecords,
  });

  Pagination copyWith({
    int? perPage,
    int? currentPage,
    dynamic nextPage,
    int? totalPages,
    int? totalRecords,
  }) =>
      Pagination(
        perPage: perPage ?? this.perPage,
        currentPage: currentPage ?? this.currentPage,
        nextPage: nextPage ?? this.nextPage,
        totalPages: totalPages ?? this.totalPages,
        totalRecords: totalRecords ?? this.totalRecords,
      );

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        perPage: json["per_page"],
        currentPage: json["current_page"],
        nextPage: json["next_page"],
        totalPages: json["total_pages"],
        totalRecords: json["total_records"],
      );

  Map<String, dynamic> toJson() => {
        "per_page": perPage,
        "current_page": currentPage,
        "next_page": nextPage,
        "total_pages": totalPages,
        "total_records": totalRecords,
      };
}

class Verse {
  final int id;
  final int verseNumber;
  final String verseKey;
  final int hizbNumber;
  final int rubElHizbNumber;
  final int rukuNumber;
  final int manzilNumber;
  final dynamic sajdahNumber;
  final String textUthmani;
  final int pageNumber;
  final int juzNumber;
  final List<Word> words;

  Verse({
    required this.id,
    required this.verseNumber,
    required this.verseKey,
    required this.hizbNumber,
    required this.rubElHizbNumber,
    required this.rukuNumber,
    required this.manzilNumber,
    required this.sajdahNumber,
    required this.textUthmani,
    required this.pageNumber,
    required this.juzNumber,
    required this.words,
  });

  Verse copyWith({
    int? id,
    int? verseNumber,
    String? verseKey,
    int? hizbNumber,
    int? rubElHizbNumber,
    int? rukuNumber,
    int? manzilNumber,
    dynamic sajdahNumber,
    String? textUthmani,
    int? pageNumber,
    int? juzNumber,
    List<Word>? words,
  }) =>
      Verse(
        id: id ?? this.id,
        verseNumber: verseNumber ?? this.verseNumber,
        verseKey: verseKey ?? this.verseKey,
        hizbNumber: hizbNumber ?? this.hizbNumber,
        rubElHizbNumber: rubElHizbNumber ?? this.rubElHizbNumber,
        rukuNumber: rukuNumber ?? this.rukuNumber,
        manzilNumber: manzilNumber ?? this.manzilNumber,
        sajdahNumber: sajdahNumber ?? this.sajdahNumber,
        textUthmani: textUthmani ?? this.textUthmani,
        pageNumber: pageNumber ?? this.pageNumber,
        juzNumber: juzNumber ?? this.juzNumber,
        words: words ?? this.words,
      );

  factory Verse.fromRawJson(String str) => Verse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json["id"],
        verseNumber: json["verse_number"],
        verseKey: json["verse_key"],
        hizbNumber: json["hizb_number"],
        rubElHizbNumber: json["rub_el_hizb_number"],
        rukuNumber: json["ruku_number"],
        manzilNumber: json["manzil_number"],
        sajdahNumber: json["sajdah_number"],
        textUthmani: json["text_uthmani"],
        pageNumber: json["page_number"],
        juzNumber: json["juz_number"],
        words: List<Word>.from(json["words"].map((x) => Word.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "verse_number": verseNumber,
        "verse_key": verseKey,
        "hizb_number": hizbNumber,
        "rub_el_hizb_number": rubElHizbNumber,
        "ruku_number": rukuNumber,
        "manzil_number": manzilNumber,
        "sajdah_number": sajdahNumber,
        "text_uthmani": textUthmani,
        "page_number": pageNumber,
        "juz_number": juzNumber,
        "words": List<dynamic>.from(words.map((x) => x.toJson())),
      };
}

class Word {
  final int id;
  final int position;
  final String? audioUrl;
  final CharTypeName charTypeName;
  final String textUthmani;
  final int pageNumber;
  final int lineNumber;
  final String text;
  final Translation translation;
  final Translation transliteration;

  Word({
    required this.id,
    required this.position,
    required this.audioUrl,
    required this.charTypeName,
    required this.textUthmani,
    required this.pageNumber,
    required this.lineNumber,
    required this.text,
    required this.translation,
    required this.transliteration,
  });

  Word copyWith({
    int? id,
    int? position,
    String? audioUrl,
    CharTypeName? charTypeName,
    String? textUthmani,
    int? pageNumber,
    int? lineNumber,
    String? text,
    Translation? translation,
    Translation? transliteration,
  }) =>
      Word(
        id: id ?? this.id,
        position: position ?? this.position,
        audioUrl: audioUrl ?? this.audioUrl,
        charTypeName: charTypeName ?? this.charTypeName,
        textUthmani: textUthmani ?? this.textUthmani,
        pageNumber: pageNumber ?? this.pageNumber,
        lineNumber: lineNumber ?? this.lineNumber,
        text: text ?? this.text,
        translation: translation ?? this.translation,
        transliteration: transliteration ?? this.transliteration,
      );

  factory Word.fromRawJson(String str) => Word.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        id: json["id"],
        position: json["position"],
        audioUrl: json["audio_url"],
        charTypeName: charTypeNameValues.map[json["char_type_name"]]!,
        textUthmani: json["text_uthmani"],
        pageNumber: json["page_number"],
        lineNumber: json["line_number"],
        text: json["text"],
        translation: Translation.fromJson(json["translation"]),
        transliteration: Translation.fromJson(json["transliteration"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
        "audio_url": audioUrl,
        "char_type_name": charTypeNameValues.reverse[charTypeName],
        "text_uthmani": textUthmani,
        "page_number": pageNumber,
        "line_number": lineNumber,
        "text": text,
        "translation": translation.toJson(),
        "transliteration": transliteration.toJson(),
      };
}

enum CharTypeName { end, word }

final charTypeNameValues =
    EnumValues({"end": CharTypeName.end, "word": CharTypeName.word});

class Translation {
  final String? text;
  final LanguageName languageName;

  Translation({
    required this.text,
    required this.languageName,
  });

  Translation copyWith({
    String? text,
    LanguageName? languageName,
  }) =>
      Translation(
        text: text ?? this.text,
        languageName: languageName ?? this.languageName,
      );

  factory Translation.fromRawJson(String str) =>
      Translation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        text: json["text"],
        languageName: languageNameValues.map[json["language_name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "language_name": languageNameValues.reverse[languageName],
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
