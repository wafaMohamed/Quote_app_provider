import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quote_app/core/constant/api.dart';

import '../model/quote_model.dart';

class QuoteService {
  Future<List<QuoteModel>> getQuote(int page) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndPoints.baseUrl}?page=$page'),
      ); // Add '?' before 'page'
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> quotes = data['data'];
        return quotes.map((quote) => QuoteModel.fromJson(quote)).toList();
      } else {
        throw Exception('Failed to load quotes');
      }
    } catch (e) {
      print('Error in QuoteService: $e');
      rethrow;
    }
  }
}
