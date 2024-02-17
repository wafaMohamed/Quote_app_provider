import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quote_app/feature/qoute/model/quote_model.dart';
import 'package:quote_app/feature/qoute/view_model/quote_viewmodel.dart';

import 'quote_app_test.mocks.dart';

void main() {
  group('QuoteProvider Tests', () {
    late MockQuoteService mockQuoteService;
    late QuoteProvider quoteProvider;

    setUp(() {
      mockQuoteService = MockQuoteService();
      quoteProvider = QuoteProvider(quoteService: mockQuoteService);
    });

    test('Fetch quotes successfully', () async {
      // Arrange
      final mockQuotes = [
        const QuoteModel(
            id: '1',
            quoteText: 'Test Quote',
            quoteAuthor: 'Test Author',
            quoteGenre: 'Test Genre'),
      ];

      when(() => mockQuoteService.getQuote(any(that: isA<int>())))
          .thenAnswer((_) async => mockQuotes);

      // Act
      await quoteProvider.fetchQuote();

      // Assert
      expect(quoteProvider.quotes, equals(mockQuotes));
      expect(quoteProvider.isLoading, isFalse);
      verify(() => mockQuoteService.getQuote(1)).called(1);
    });

    test('Error fetching quotes', () async {
      // Arrange
      when(() => mockQuoteService.getQuote(any(that: isA<int>())))
          .thenThrow(Exception('Failed to load quotes'));

      // Act
      await quoteProvider.fetchQuote();

      // Assert
      expect(quoteProvider.quotes, isEmpty);
      expect(quoteProvider.isLoading, isFalse);
      verify(() => mockQuoteService.getQuote(1)).called(1);
    });

    test('Loading indicator is true while fetching quotes', () async {
      // Arrange
      when(() => mockQuoteService.getQuote(any(that: isA<int>())))
          .thenAnswer((_) async => []);

      // Act
      final future = quoteProvider.fetchQuote();

      // Assert
      expect(quoteProvider.isLoading, isTrue);
      await future;
      expect(quoteProvider.isLoading, isFalse);
      verify(() => mockQuoteService.getQuote(1)).called(1);
    });
  });
}
