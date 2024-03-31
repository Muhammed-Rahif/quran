import 'dart:convert';

class GetVersesByPageResponse {
  final List<Verse> verses;
  final Pagination pagination;

  GetVersesByPageResponse({
    required this.verses,
    required this.pagination,
  });

  GetVersesByPageResponse copyWith({
    List<Verse>? verses,
    Pagination? pagination,
  }) =>
      GetVersesByPageResponse(
        verses: verses ?? this.verses,
        pagination: pagination ?? this.pagination,
      );

  factory GetVersesByPageResponse.fromRawJson(String str) =>
      GetVersesByPageResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetVersesByPageResponse.fromJson(Map<String, dynamic> json) =>
      GetVersesByPageResponse(
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
  final int? nextPage;
  final int? totalPages;
  final int? totalRecords;

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
    int? nextPage,
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
        totalPages: json["total_pages="],
        totalRecords: json["total_records="],
      );

  Map<String, dynamic> toJson() => {
        "per_page": perPage,
        "current_page": currentPage,
        "next_page": nextPage,
        "total_pages=": totalPages,
        "total_records=": totalRecords,
      };
}

class Verse {
  final int? id;
  final int? chapterId;
  final int? verseNumber;
  final String? verseKey;
  final int? verseIndex;
  final String? textUthmani;
  final String? textUthmaniSimple;
  final String? textImlaei;
  final String? textImlaeiSimple;
  final String? textIndopak;
  final String? textUthmaniTajweed;
  final int? juzNumber;
  final int? hizbNumber;
  final int? rubNumber;
  final dynamic sajdahType;
  final dynamic sajdahNumber;
  final int? pageNumber;
  final String? imageUrl;
  final int? imageWidth;
  final List<Word> words;

  Verse({
    required this.id,
    required this.chapterId,
    required this.verseNumber,
    required this.verseKey,
    required this.verseIndex,
    required this.textUthmani,
    required this.textUthmaniSimple,
    required this.textImlaei,
    required this.textImlaeiSimple,
    required this.textIndopak,
    required this.textUthmaniTajweed,
    required this.juzNumber,
    required this.hizbNumber,
    required this.rubNumber,
    required this.sajdahType,
    required this.sajdahNumber,
    required this.pageNumber,
    required this.imageUrl,
    required this.imageWidth,
    required this.words,
  });

  Verse copyWith({
    int? id,
    int? chapterId,
    int? verseNumber,
    String? verseKey,
    int? verseIndex,
    String? textUthmani,
    String? textUthmaniSimple,
    String? textImlaei,
    String? textImlaeiSimple,
    String? textIndopak,
    String? textUthmaniTajweed,
    int? juzNumber,
    int? hizbNumber,
    int? rubNumber,
    dynamic sajdahType,
    dynamic sajdahNumber,
    int? pageNumber,
    String? imageUrl,
    int? imageWidth,
    List<Word>? words,
  }) =>
      Verse(
        id: id ?? this.id,
        chapterId: chapterId ?? this.chapterId,
        verseNumber: verseNumber ?? this.verseNumber,
        verseKey: verseKey ?? this.verseKey,
        verseIndex: verseIndex ?? this.verseIndex,
        textUthmani: textUthmani ?? this.textUthmani,
        textUthmaniSimple: textUthmaniSimple ?? this.textUthmaniSimple,
        textImlaei: textImlaei ?? this.textImlaei,
        textImlaeiSimple: textImlaeiSimple ?? this.textImlaeiSimple,
        textIndopak: textIndopak ?? this.textIndopak,
        textUthmaniTajweed: textUthmaniTajweed ?? this.textUthmaniTajweed,
        juzNumber: juzNumber ?? this.juzNumber,
        hizbNumber: hizbNumber ?? this.hizbNumber,
        rubNumber: rubNumber ?? this.rubNumber,
        sajdahType: sajdahType ?? this.sajdahType,
        sajdahNumber: sajdahNumber ?? this.sajdahNumber,
        pageNumber: pageNumber ?? this.pageNumber,
        imageUrl: imageUrl ?? this.imageUrl,
        imageWidth: imageWidth ?? this.imageWidth,
        words: words ?? this.words,
      );

  factory Verse.fromRawJson(String str) => Verse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json["id"],
        chapterId: json["chapter_id"],
        verseNumber: json["verse_number"],
        verseKey: json["verse_key"],
        verseIndex: json["verse_index"],
        textUthmani: json["text_uthmani"],
        textUthmaniSimple: json["text_uthmani_simple"],
        textImlaei: json["text_imlaei"],
        textImlaeiSimple: json["text_imlaei_simple"],
        textIndopak: json["text_indopak"],
        textUthmaniTajweed: json["text_uthmani_tajweed"],
        juzNumber: json["juz_number"],
        hizbNumber: json["hizb_number"],
        rubNumber: json["rub_number"],
        sajdahType: json["sajdah_type"],
        sajdahNumber: json["sajdah_number"],
        pageNumber: json["page_number"],
        imageUrl: json["image_url"],
        imageWidth: json["image_width"],
        words: List<Word>.from(json["words"].map((x) => Word.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chapter_id": chapterId,
        "verse_number": verseNumber,
        "verse_key": verseKey,
        "verse_index": verseIndex,
        "text_uthmani": textUthmani,
        "text_uthmani_simple": textUthmaniSimple,
        "text_imlaei": textImlaei,
        "text_imlaei_simple": textImlaeiSimple,
        "text_indopak": textIndopak,
        "text_uthmani_tajweed": textUthmaniTajweed,
        "juz_number": juzNumber,
        "hizb_number": hizbNumber,
        "rub_number": rubNumber,
        "sajdah_type": sajdahType,
        "sajdah_number": sajdahNumber,
        "page_number": pageNumber,
        "image_url": imageUrl,
        "image_width": imageWidth,
        "words": List<dynamic>.from(words.map((x) => x.toJson())),
      };
}

class Word {
  final int id;
  final int position;
  final String? audioUrl;
  final CharTypeName charTypeName;
  final String codeV1;
  final String codeV2;
  final int pageNumber;
  final int lineNumber;
  final String text;
  final Translation translation;
  final Translation transliteration;
  final String? textUthmani;

  Word({
    required this.id,
    required this.position,
    required this.audioUrl,
    required this.charTypeName,
    required this.codeV1,
    required this.codeV2,
    required this.pageNumber,
    required this.lineNumber,
    required this.text,
    required this.translation,
    required this.transliteration,
    required this.textUthmani,
  });

  Word copyWith({
    int? id,
    int? position,
    String? audioUrl,
    CharTypeName? charTypeName,
    String? codeV1,
    String? codeV2,
    int? pageNumber,
    int? lineNumber,
    String? text,
    Translation? translation,
    Translation? transliteration,
    String? textUthmani,
  }) =>
      Word(
        id: id ?? this.id,
        position: position ?? this.position,
        audioUrl: audioUrl ?? this.audioUrl,
        charTypeName: charTypeName ?? this.charTypeName,
        codeV1: codeV1 ?? this.codeV1,
        codeV2: codeV2 ?? this.codeV2,
        pageNumber: pageNumber ?? this.pageNumber,
        lineNumber: lineNumber ?? this.lineNumber,
        text: text ?? this.text,
        translation: translation ?? this.translation,
        transliteration: transliteration ?? this.transliteration,
        textUthmani: textUthmani ?? this.textUthmani,
      );

  factory Word.fromRawJson(String str) => Word.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        id: json["id"],
        position: json["position"],
        audioUrl: json["audio_url"],
        charTypeName: charTypeNameValues.map[json["char_type_name"]]!,
        codeV1: json["code_v1"],
        codeV2: json["code_v2"],
        pageNumber: json["page_number"],
        lineNumber: json["line_number"],
        text: json["text"],
        textUthmani: json["text_uthmani"],
        translation: Translation.fromJson(json["translation"]),
        transliteration: Translation.fromJson(json["transliteration"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
        "audio_url": audioUrl,
        "char_type_name": charTypeNameValues.reverse[charTypeName],
        "code_v1": codeV1,
        "code_v2": codeV2,
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
  final String languageName;

  Translation({
    required this.text,
    required this.languageName,
  });

  Translation copyWith({
    String? text,
    String? languageName,
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
        languageName: json["language_name"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "language_name": languageName,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
