import 'dart:convert';

class GetUthmaniScriptQuranResponse {
  final List<Verse> verses;
  final Meta meta;

  GetUthmaniScriptQuranResponse({
    required this.verses,
    required this.meta,
  });

  GetUthmaniScriptQuranResponse copyWith({
    List<Verse>? verses,
    Meta? meta,
  }) =>
      GetUthmaniScriptQuranResponse(
        verses: verses ?? this.verses,
        meta: meta ?? this.meta,
      );

  factory GetUthmaniScriptQuranResponse.fromRawJson(String str) =>
      GetUthmaniScriptQuranResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetUthmaniScriptQuranResponse.fromJson(Map<String, dynamic> json) =>
      GetUthmaniScriptQuranResponse(
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Meta {
  final Filters filters;

  Meta({
    required this.filters,
  });

  Meta copyWith({
    Filters? filters,
  }) =>
      Meta(
        filters: filters ?? this.filters,
      );

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        filters: Filters.fromJson(json["filters"]),
      );

  Map<String, dynamic> toJson() => {
        "filters": filters.toJson(),
      };
}

class Filters {
  final String pageNumber;

  Filters({
    required this.pageNumber,
  });

  Filters copyWith({
    String? pageNumber,
  }) =>
      Filters(
        pageNumber: pageNumber ?? this.pageNumber,
      );

  factory Filters.fromRawJson(String str) => Filters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        pageNumber: json["page_number"],
      );

  Map<String, dynamic> toJson() => {
        "page_number": pageNumber,
      };
}

class Verse {
  final int id;
  final String verseKey;
  final String textUthmani;

  Verse({
    required this.id,
    required this.verseKey,
    required this.textUthmani,
  });

  Verse copyWith({
    int? id,
    String? verseKey,
    String? textUthmani,
  }) =>
      Verse(
        id: id ?? this.id,
        verseKey: verseKey ?? this.verseKey,
        textUthmani: textUthmani ?? this.textUthmani,
      );

  factory Verse.fromRawJson(String str) => Verse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json["id"],
        verseKey: json["verse_key"],
        textUthmani: json["text_uthmani"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "verse_key": verseKey,
        "text_uthmani": textUthmani,
      };
}
