import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quote_app/core/theme/app_theme.dart';
import 'package:quote_app/feature/qoute/view_model/quote_viewmodel.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quoteProvider = Provider.of<QuoteProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.greyColor100,
      appBar: AppBar(
        backgroundColor: AppTheme.greyColor100,
        centerTitle: true,
        title: Text(
          'Quote App',
          style: GoogleFonts.alike(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: quoteProvider.quotes.length,
            itemBuilder: (context, index) {
              final quote = quoteProvider.quotes[index];
              return ListTile(
                title: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.accents[index % Colors.accents.length],
                  ),
                  child: Text(
                    quote.quoteText,
                    style: GoogleFonts.alike(
                        color: AppTheme.greyColor900,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(
                    'Author: ${quote.quoteAuthor}',
                    style: GoogleFonts.alike(
                        color: AppTheme.greyColor700,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              );
            },
          ),
          if (quoteProvider.isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => quoteProvider.fetchQuote(),
        tooltip: 'Load More',
        shape: const CircleBorder(),
        backgroundColor: AppTheme.blueColor100,
        child: const Icon(Icons.add),
      ),
    );
  }
}
