class Surah {
  final int id;
  final String name;
  final int versesCount;
  final String english;
  final String place;
  final String arabic;

  Surah({
    required this.id,
    required this.name,
    required this.versesCount,
    required this.english,
    required this.place,
    required this.arabic,
  });
}

List<Surah> surahs = [
  Surah(
    id: 1,
    name: "Al Fatiha",
    versesCount: 7,
    english: "The Opening",
    place: "مكية",
    arabic: "الفاتحة",
  ),
  Surah(
    id: 2,
    name: "Al Baqarah",
    versesCount: 286,
    english: "The Cow",
    place: "مدنية",
    arabic: "البقرة",
  ),
  Surah(
    id: 3,
    name: "Al Imran",
    versesCount: 200,
    english: "The Family of Imran",
    place: "مدنية",
    arabic: "آل عمران",
  ),
  Surah(
    id: 4,
    name: "An Nisa",
    versesCount: 176,
    english: "The Women",
    place: "مدنية",
    arabic: "النساء",
  ),
  Surah(
    id: 5,
    name: "Al Ma'idah",
    versesCount: 120,
    english: "The Table",
    place: "مدنية",
    arabic: "المائدة",
  ),
  Surah(
    id: 6,
    name: "Al An'am",
    versesCount: 165,
    english: "The Cattle",
    place: "مكية",
    arabic: "الأنعام",
  ),
  Surah(
    id: 7,
    name: "Al A'raf",
    versesCount: 206,
    english: "The Heights",
    place: "مكية",
    arabic: "الأعراف",
  ),
  Surah(
    id: 8,
    name: "Al Anfal",
    versesCount: 75,
    english: "The Spoils of War",
    place: "مدنية",
    arabic: "الأنفال",
  ),
  Surah(
    id: 9,
    name: "At Tawbah",
    versesCount: 129,
    english: "The Repentance",
    place: "مدنية",
    arabic: "التوبة",
  ),
  Surah(
    id: 10,
    name: "Al Yunus",
    versesCount: 109,
    english: "Jonah",
    place: "مكية",
    arabic: "يونس",
  ),
  Surah(
    id: 11,
    name: "Hud",
    versesCount: 123,
    english: "Hud",
    place: "مكية",
    arabic: "هود",
  ),
  Surah(
    id: 12,
    name: "Yusuf",
    versesCount: 111,
    english: "Joseph",
    place: "مكية",
    arabic: "يوسف",
  ),
  Surah(
    id: 13,
    name: "Ar Ra'd",
    versesCount: 43,
    english: "The Thunder",
    place: "مدنية",
    arabic: "الرعد",
  ),
  Surah(
    id: 14,
    name: "Ibrahim",
    versesCount: 52,
    english: "Abraham",
    place: "مكية",
    arabic: "ابراهيم",
  ),
  Surah(
    id: 15,
    name: "Al Hijr",
    versesCount: 99,
    english: "The Stoneland",
    place: "مكية",
    arabic: "الحجر",
  ),
  Surah(
    id: 16,
    name: "An Nahl",
    versesCount: 128,
    english: "The Honey Bee",
    place: "مكية",
    arabic: "النحل",
  ),
  Surah(
    id: 17,
    name: "Al Isra'",
    versesCount: 111,
    english: "The Night Journey",
    place: "مكية",
    arabic: "الإسراء",
  ),
  Surah(
    id: 18,
    name: "Al Kahf",
    versesCount: 110,
    english: "The Cave",
    place: "مكية",
    arabic: "الكهف",
  ),
  Surah(
    id: 19,
    name: "Maryam",
    versesCount: 98,
    english: "Mary",
    place: "مكية",
    arabic: "مريم",
  ),
  Surah(
    id: 20,
    name: "Ta Ha",
    versesCount: 135,
    english: "Ta Ha",
    place: "مكية",
    arabic: "طه",
  ),
  Surah(
    id: 21,
    name: "Al Anbiya",
    versesCount: 112,
    english: "The Prophets",
    place: "مكية",
    arabic: "الأنبياء",
  ),
  Surah(
    id: 22,
    name: "Al Hajj",
    versesCount: 78,
    english: "The Pilgrimage",
    place: "مدنية",
    arabic: "الحج",
  ),
  Surah(
    id: 23,
    name: "Al Mu minun",
    versesCount: 118,
    english: "The Believers",
    place: "مكية",
    arabic: "المؤمنون",
  ),
  Surah(
    id: 24,
    name: "An Nur",
    versesCount: 64,
    english: "The Light",
    place: "مدنية",
    arabic: "النور",
  ),
  Surah(
    id: 25,
    name: "Al Furqan",
    versesCount: 77,
    english: "The Criterion",
    place: "مكية",
    arabic: "الفرقان",
  ),
  Surah(
    id: 26,
    name: "As Su'ara",
    versesCount: 227,
    english: "The Poets",
    place: "مكية",
    arabic: "الشعراء",
  ),
  Surah(
    id: 27,
    name: "An Naml",
    versesCount: 93,
    english: "The Ant",
    place: "مكية",
    arabic: "النمل",
  ),
  Surah(
    id: 28,
    name: "Al Qasas",
    versesCount: 88,
    english: "The Narrations",
    place: "مكية",
    arabic: "القصص",
  ),
  Surah(
    id: 29,
    name: "Al Ankabut",
    versesCount: 69,
    english: "The Spider",
    place: "مكية",
    arabic: "العنكبوت",
  ),
  Surah(
    id: 30,
    name: "Ar Rum",
    versesCount: 60,
    english: "Rome",
    place: "مكية",
    arabic: "الروم",
  ),
  Surah(
    id: 31,
    name: "Luqman",
    versesCount: 34,
    english: "Luqman",
    place: "مكية",
    arabic: "لقمان",
  ),
  Surah(
    id: 32,
    name: "As Sajdah",
    versesCount: 30,
    english: "The Prostration",
    place: "مكية",
    arabic: "السجدة",
  ),
  Surah(
    id: 33,
    name: "Al Ahzab",
    versesCount: 73,
    english: "The Clans",
    place: "مدنية",
    arabic: "الأحزاب",
  ),
  Surah(
    id: 34,
    name: "Saba'",
    versesCount: 54,
    english: "Sheba",
    place: "مكية",
    arabic: "سبإ",
  ),
  Surah(
    id: 35,
    name: "Fatir",
    versesCount: 45,
    english: "The Originator",
    place: "مكية",
    arabic: "فاطر",
  ),
  Surah(
    id: 36,
    name: "Ya'sin",
    versesCount: 83,
    english: "Ya Sin",
    place: "مكية",
    arabic: "يس",
  ),
  Surah(
    id: 37,
    name: "As Saffat",
    versesCount: 182,
    english: "Those Who Set The Ranks",
    place: "مكية",
    arabic: "الصافات",
  ),
  Surah(
    id: 38,
    name: "Saad",
    versesCount: 88,
    english: "Ṣād",
    place: "مكية",
    arabic: "ص",
  ),
  Surah(
    id: 39,
    name: "Az Zumar",
    versesCount: 75,
    english: "The Crowds",
    place: "مكية",
    arabic: "الزمر",
  ),
  Surah(
    id: 40,
    name: "Ghafir",
    versesCount: 85,
    english: "The Forgiver",
    place: "مكية",
    arabic: "غافر",
  ),
  Surah(
    id: 41,
    name: "Fussilat",
    versesCount: 54,
    english: "Expounded",
    place: "مكية",
    arabic: "فصلت",
  ),
  Surah(
    id: 42,
    name: "As Sura",
    versesCount: 53,
    english: "The Consultation",
    place: "مكية",
    arabic: "الشورى",
  ),
  Surah(
    id: 43,
    name: "Az Zukhruf",
    versesCount: 89,
    english: "The Gold Adornments",
    place: "مكية",
    arabic: "الزخرف",
  ),
  Surah(
    id: 44,
    name: "Ad Dukhan",
    versesCount: 59,
    english: "The Smoke",
    place: "مكية",
    arabic: "الدخان",
  ),
  Surah(
    id: 45,
    name: "Al Jaathiyah",
    versesCount: 37,
    english: "The Kneeling Down",
    place: "مكية",
    arabic: "الجاثية",
  ),
  Surah(
    id: 46,
    name: "Al Ahqaf",
    versesCount: 35,
    english: "Winding Sand tracts",
    place: "مكية",
    arabic: "الأحقاف",
  ),
  Surah(
    id: 47,
    name: "Muhammad",
    versesCount: 38,
    english: "Muhammad",
    place: "مدنية",
    arabic: "محمد",
  ),
  Surah(
    id: 48,
    name: "Al Fath",
    versesCount: 29,
    english: "The Victory",
    place: "مدنية",
    arabic: "الفتح",
  ),
  Surah(
    id: 49,
    name: "Al Hujurut",
    versesCount: 18,
    english: "The Private Apartments",
    place: "مدنية",
    arabic: "الحجرات",
  ),
  Surah(
    id: 50,
    name: "Qaaf",
    versesCount: 45,
    english: "Q̈āf",
    place: "مكية",
    arabic: "ق",
  ),
  Surah(
    id: 51,
    name: "Ad Dariyat",
    versesCount: 60,
    english: "The Wind That Scatter",
    place: "مكية",
    arabic: "الذاريات",
  ),
  Surah(
    id: 52,
    name: "At Toor",
    versesCount: 49,
    english: "The Mount",
    place: "مكية",
    arabic: "الطور",
  ),
  Surah(
    id: 53,
    name: "An Najm",
    versesCount: 62,
    english: "The Star",
    place: "مكية",
    arabic: "النجم",
  ),
  Surah(
    id: 54,
    name: "Al Qamar",
    versesCount: 55,
    english: "The Moon",
    place: "مكية",
    arabic: "القمر",
  ),
  Surah(
    id: 55,
    name: "Ar Rahman",
    versesCount: 78,
    english: "The Most Merciful",
    place: "مدنية",
    arabic: "الرحمن",
  ),
  Surah(
    id: 56,
    name: "Al Waqiah",
    versesCount: 96,
    english: "The Inevitable",
    place: "مكية",
    arabic: "الواقعة",
  ),
  Surah(
    id: 57,
    name: "Al Hadeed",
    versesCount: 29,
    english: "The Iron",
    place: "مدنية",
    arabic: "الحديد",
  ),
  Surah(
    id: 58,
    name: "Al Mujadila",
    versesCount: 22,
    english: "The Pleading",
    place: "مدنية",
    arabic: "المجادلة",
  ),
  Surah(
    id: 59,
    name: "Al Hashr",
    versesCount: 24,
    english: "The Mustering",
    place: "Manidah",
    arabic: "الحشر",
  ),
  Surah(
    id: 60,
    name: "Al Mumtahanah",
    versesCount: 13,
    english: "The Examined One",
    place: "مدنية",
    arabic: "الممتحنة",
  ),
  Surah(
    id: 61,
    name: "As Saff",
    versesCount: 14,
    english: "The Ranks",
    place: "مدنية",
    arabic: "الصف",
  ),
  Surah(
    id: 62,
    name: "Al Jumu'ah",
    versesCount: 11,
    english: "Congregation (Friday)",
    place: "مدنية",
    arabic: "الجمعة",
  ),
  Surah(
    id: 63,
    name: "Al Munafiqoon",
    versesCount: 11,
    english: "The Hypocrites",
    place: "مدنية",
    arabic: "المنافقون",
  ),
  Surah(
    id: 64,
    name: "At Taghabun",
    versesCount: 18,
    english: "The Cheating",
    place: "مدنية",
    arabic: "التغابن",
  ),
  Surah(
    id: 65,
    name: "At Talaq",
    versesCount: 12,
    english: "Divorce",
    place: "مدنية",
    arabic: "الطلاق",
  ),
  Surah(
    id: 66,
    name: "At Tahreem",
    versesCount: 12,
    english: "The Prohibition",
    place: "مدنية",
    arabic: "التحريم",
  ),
  Surah(
    id: 67,
    name: "Al Mulk",
    versesCount: 30,
    english: "The Dominion",
    place: "مكية",
    arabic: "الملك",
  ),
  Surah(
    id: 68,
    name: "Al Qalam",
    versesCount: 52,
    english: "The Pen",
    place: "مكية",
    arabic: "القلم",
  ),
  Surah(
    id: 69,
    name: "Al Haaqqah",
    versesCount: 52,
    english: "The Sure Reality",
    place: "مكية",
    arabic: "الحاقة",
  ),
  Surah(
    id: 70,
    name: "Al Ma'arij",
    versesCount: 44,
    english: "The Ways of Ascent",
    place: "مكية",
    arabic: "المعارج",
  ),
  Surah(
    id: 71,
    name: "Nooh",
    versesCount: 28,
    english: "Noah",
    place: "مكية",
    arabic: "نوح",
  ),
  Surah(
    id: 72,
    name: "Al Jinn",
    versesCount: 28,
    english: "The Jinn",
    place: "makkah",
    arabic: "الجن",
  ),
  Surah(
    id: 73,
    name: "Al Muzammil",
    versesCount: 20,
    english: "The Enfolded One",
    place: "مكية",
    arabic: "المزمل",
  ),
  Surah(
    id: 74,
    name: "Al Muddathir",
    versesCount: 56,
    english: "The One Wrapped Up",
    place: "مكية",
    arabic: "المدثر",
  ),
  Surah(
    id: 75,
    name: "Al Qiyamah",
    versesCount: 40,
    english: "Resurrection",
    place: "مكية",
    arabic: "القيامة",
  ),
  Surah(
    id: 76,
    name: "Al Insaan",
    versesCount: 31,
    english: "The Human",
    place: "مدنية",
    arabic: "الانسان",
  ),
  Surah(
    id: 77,
    name: "Al Mursalat",
    versesCount: 50,
    english: "Those Sent Forth",
    place: "مكية",
    arabic: "المرسلات",
  ),
  Surah(
    id: 78,
    name: "An Naba",
    versesCount: 40,
    english: "The Great News",
    place: "مكية",
    arabic: "النبإ",
  ),
  Surah(
    id: 79,
    name: "An Naaziat",
    versesCount: 46,
    english: "Those Who Tear Out",
    place: "مكية",
    arabic: "النازعات",
  ),
  Surah(
    id: 80,
    name: "Abasa",
    versesCount: 42,
    english: "He Frowned",
    place: "مكية",
    arabic: "عبس",
  ),
  Surah(
    id: 81,
    name: "At Takweer",
    versesCount: 29,
    english: "The Folding Up",
    place: "مكية",
    arabic: "التكوير",
  ),
  Surah(
    id: 82,
    name: "Al Infitar",
    versesCount: 19,
    english: "The Overthrowing",
    place: "مكية",
    arabic: "الإنفطار",
  ),
  Surah(
    id: 83,
    name: "Al Mutaffifin",
    versesCount: 36,
    english: "The Cleaving Asunder",
    place: "مكية",
    arabic: "المطففين",
  ),
  Surah(
    id: 84,
    name: "Al Inshiqaaq",
    versesCount: 25,
    english: "The Dealers in Fraud",
    place: "مكية",
    arabic: "الإنشقاق",
  ),
  Surah(
    id: 85,
    name: "Al Burooj",
    versesCount: 22,
    english: "The Constellations",
    place: "مكية",
    arabic: "البروج",
  ),
  Surah(
    id: 86,
    name: "At Taariq",
    versesCount: 17,
    english: "The Morning Star",
    place: "مكية",
    arabic: "الطارق",
  ),
  Surah(
    id: 87,
    name: "Al A'laa",
    versesCount: 19,
    english: "The Most High",
    place: "مكية",
    arabic: "الأعلى",
  ),
  Surah(
    id: 88,
    name: "Al Ghaashiyah",
    versesCount: 26,
    english: "The Overwhelming Event",
    place: "مكية",
    arabic: "الغاشية",
  ),
  Surah(
    id: 89,
    name: "Al Fajr",
    versesCount: 30,
    english: "The Daybreak",
    place: "مكية",
    arabic: "الفجر",
  ),
  Surah(
    id: 90,
    name: "Al Balad",
    versesCount: 20,
    english: "The City",
    place: "مكية",
    arabic: "البلد",
  ),
  Surah(
    id: 91,
    name: "Ash Shams",
    versesCount: 15,
    english: "The Sun",
    place: "مكية",
    arabic: "الشمس",
  ),
  Surah(
    id: 92,
    name: "Al Layl",
    versesCount: 21,
    english: "The Night",
    place: "مكية",
    arabic: "الليل",
  ),
  Surah(
    id: 93,
    name: "Ad Dhuha",
    versesCount: 11,
    english: "The Glorious Morning Light",
    place: "مكية",
    arabic: "الضحى",
  ),
  Surah(
    id: 94,
    name: "Ash Sharh",
    versesCount: 8,
    english: "The Opening Up of the Heart",
    place: "مكية",
    arabic: "الشرح",
  ),
  Surah(
    id: 95,
    name: "At Teen",
    versesCount: 8,
    english: "The Fig Tree",
    place: "مكية",
    arabic: "التين",
  ),
  Surah(
    id: 96,
    name: "Al Alaq",
    versesCount: 19,
    english: "The Clinging Clot",
    place: "مكية",
    arabic: "العلق",
  ),
  Surah(
    id: 97,
    name: "Al Qadr",
    versesCount: 5,
    english: "The Night of Honor",
    place: "مكية",
    arabic: "القدر",
  ),
  Surah(
    id: 98,
    name: "Al Bayyinah",
    versesCount: 8,
    english: "The Clear Evidence",
    place: "مدنية",
    arabic: "البينة",
  ),
  Surah(
    id: 99,
    name: "Az Zalzalah",
    versesCount: 8,
    english: "The Earthquake",
    place: "مدنية",
    arabic: "الزلزلة",
  ),
  Surah(
    id: 100,
    name: "Al Aadiyaat",
    versesCount: 11,
    english: "The Courser",
    place: "مكية",
    arabic: "العاديات",
  ),
  Surah(
    id: 101,
    name: "Al Qaari'ah",
    versesCount: 11,
    english: "The Striking Hour",
    place: "مكية",
    arabic: "القارعة",
  ),
  Surah(
    id: 102,
    name: "At Takaathur",
    versesCount: 8,
    english: "The Piling Up",
    place: "مكية",
    arabic: "التكاثر",
  ),
  Surah(
    id: 103,
    name: "Al Asr",
    versesCount: 3,
    english: "The Time",
    place: "مكية",
    arabic: "العصر",
  ),
  Surah(
    id: 104,
    name: "Al Humazah",
    versesCount: 9,
    english: "The Scandalmonger",
    place: "مكية",
    arabic: "الهمزة",
  ),
  Surah(
    id: 105,
    name: "Al Feel",
    versesCount: 5,
    english: "The Elephant",
    place: "مكية",
    arabic: "الفيل",
  ),
  Surah(
    id: 106,
    name: "Quraysh",
    versesCount: 4,
    english: "The Quraysh",
    place: "مكية",
    arabic: "قريش",
  ),
  Surah(
    id: 107,
    name: "Al Maa'oon",
    versesCount: 7,
    english: "The Neighbourly Assistance",
    place: "مكية",
    arabic: "الماعون",
  ),
  Surah(
    id: 108,
    name: "Al Kawthar",
    versesCount: 3,
    english: "Abundance",
    place: "مكية",
    arabic: "الكوثر",
  ),
  Surah(
    id: 109,
    name: "Al Kaafiroon",
    versesCount: 6,
    english: "The Disbelievers",
    place: "مكية",
    arabic: "الكافرون",
  ),
  Surah(
    id: 110,
    name: "An Nasr",
    versesCount: 3,
    english: "The Help",
    place: "مدنية",
    arabic: "النصر",
  ),
  Surah(
    id: 111,
    name: "Al Masad",
    versesCount: 5,
    english: "The Plaited Rope",
    place: "مكية",
    arabic: "اللهب",
  ),
  Surah(
    id: 112,
    name: "Al Ikhlaas",
    versesCount: 4,
    english: "Purity of Faith",
    place: "مكية",
    arabic: "الإخلاص",
  ),
  Surah(
    id: 113,
    name: "Al Falaq",
    versesCount: 5,
    english: "The Rising Dawn",
    place: "مكية",
    arabic: "الفلق",
  ),
  Surah(
    id: 114,
    name: "An Naas",
    versesCount: 6,
    english: "Mankind",
    place: "مكية",
    arabic: "الناس",
  ),
];
