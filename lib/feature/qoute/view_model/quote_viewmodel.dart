import 'package:flutter/material.dart';
import 'package:quote_app/feature/qoute/services/quote_service.dart';

import '../model/quote_model.dart';

class QuoteProvider extends ChangeNotifier {
  final QuoteService quoteService;
  final List<QuoteModel> _quotes = [];
  int _currentPage = 1;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  QuoteProvider({required this.quoteService});

  List<QuoteModel> get quotes => _quotes;

  Future<void> fetchQuote() async {
    try {
      _isLoading = true;
      notifyListeners();
      final List<QuoteModel> newQuote =
          await quoteService.getQuote(_currentPage);
      _quotes.addAll(newQuote);
      _currentPage++;
      notifyListeners();
    } catch (e) {
      print('Error in QuoteProvider: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
