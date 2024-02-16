import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/qoute/services/quote_service.dart';
import 'feature/qoute/view/qoute_page.dart';
import 'feature/qoute/view_model/quote_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuoteProvider(quoteService: QuoteService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const QuoteScreen(),
      ),
    );
  }
}
