import 'package:flutter/material.dart';
import 'package:navbar/profile_screen/BooksApi/book_list.dart';
import 'package:navbar/profile_screen/BooksApi/google_books_api.dart';
import 'package:navbar/profile_screen/spotify_Api/search_bar.dart';

class BookHome extends StatefulWidget {
  final GoogleBooksApi googleBooksApi;

  BookHome({required this.googleBooksApi});

  @override
  _BookHomeState createState() => _BookHomeState();
}

class _BookHomeState extends State<BookHome> {
  List<dynamic> _books = [];
  bool _isLoading = false;
  String _errorMessage = '';

  void _searchBooks(String query) async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      final results = await widget.googleBooksApi.searchBooks(query);
      setState(() {
        _books = results;
      });
    } catch (error) {
      setState(() {
        _errorMessage = 'Error searching for books: $error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to handle book selection
  void _selectBook(dynamic book) {
    Navigator.pop(context, book); // Return selected book to FirstSlideScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select a Book")),
      body: Column(
        children: [
          CustomSearchBar(onSearch: _searchBooks),
          if (_isLoading) CircularProgressIndicator(),
          if (_errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_errorMessage, style: TextStyle(color: Colors.red)),
            ),
          Expanded(
            child: BookList(
              books: _books,
              onBookTap: _selectBook, // Pass callback to handle book selection
            ),
          ),
        ],
      ),
    );
  }
}
