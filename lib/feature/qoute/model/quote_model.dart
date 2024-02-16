class QuoteModel {
  final String id;
  final String quoteText;
  final String quoteAuthor;
  final String quoteGenre;

  const QuoteModel({
    required this.id,
    required this.quoteText,
    required this.quoteAuthor,
    required this.quoteGenre,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
        id: json['_id'] as String,
        quoteText: json['quoteText'] as String,
        quoteAuthor: json['quoteAuthor'] as String,
        quoteGenre: json['quoteGenre'] as String);
  }
}

class PaginationModel {
  final int currentPage;
  final int nextPage;
  final int totalPages;

  const PaginationModel({
    required this.currentPage,
    required this.nextPage,
    required this.totalPages,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      currentPage: json['currentPage'] as int,
      nextPage: json['nextPage'] as int,
      totalPages: json['totalPages'] as int,
    );
  }
}
