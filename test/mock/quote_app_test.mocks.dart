import 'package:mocktail/mocktail.dart';
import 'package:quote_app/feature/qoute/services/quote_service.dart';

//@GenerateMocks([QuoteService]) -> with mockito package
class MockQuoteService extends Mock implements QuoteService {}
