final List<LanguageModel> languages = [
  LanguageModel("English", "en_US"),
  LanguageModel("Indonesia", "id_ID"),
];

class LanguageModel {
  LanguageModel(
    this.language,
    this.symbol,
  );

  String language;
  String symbol;
}
