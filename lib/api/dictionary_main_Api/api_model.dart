class DictModel {
  String word;
  String phonetic;
  List<Noun> nouns;
  List<Verb> verbs;
  List<Pronoun> pronouns;
  List<Adjective> adjectives;
  List<Adverb> adverbs;
  List<Preposition> prepositions;
  List<Conjunction> conjunctions;
  List<Interjection> interjections;
  List<String> synonyms;
  List<String> antonyms;

  DictModel({
    this.word = "",
    this.phonetic = "",
    this.nouns = const [],
    this.verbs = const [],
    this.pronouns = const [],
    this.adjectives = const [],
    this.adverbs = const [],
    this.prepositions = const [],
    this.conjunctions = const [],
    this.interjections = const [],
    this.synonyms = const [],
    this.antonyms = const [],
  });
}

class Noun {
  String definition;
  String example;

  Noun({this.definition = "", this.example = ""});
}

class Verb {
  String definition;
  String example;

  Verb({this.definition = "", this.example = ""});
}

class Pronoun {
  String definition;
  String example;

  Pronoun({this.definition = "", this.example = ""});
}

class Adjective {
  String definition;
  String example;

  Adjective({this.definition = "", this.example = ""});
}

class Adverb {
  String definition;
  String example;

  Adverb({this.definition = "", this.example = ""});
}

class Preposition {
  String definition;
  String example;

  Preposition({this.definition = "", this.example = ""});
}

class Conjunction {
  String definition;
  String example;

  Conjunction({this.definition = "", this.example = ""});
}

class Interjection {
  String definition;
  String example;

  Interjection({this.definition = "", this.example = ""});
}
