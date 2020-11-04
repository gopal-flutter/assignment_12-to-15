class Quote {
  final String category;
  final String quotes;
  final int id;
  final String shortName;

  Quote({
    this.shortName,
    this.category,
    this.quotes,
    this.id,
  });

  factory Quote.fromMap(Map<String, dynamic> data) {
    return Quote(
      category: data['category'],
      quotes: data['quotes'],
      id: data['id'],
      shortName: data['shortName'],
    );
  }

  Map<String, dynamic> toMap() => {
        'category': category,
        'quotes': quotes,
        'id': id,
        'shortName': shortName,
      };
}
