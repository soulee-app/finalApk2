// lib/screens/movie_home.dart

import 'package:flutter/material.dart';
import 'package:navbar/profile_screen/movieApi/movie_list.dart';
import 'package:navbar/profile_screen/movieApi/tmdb_api.dart';
import 'package:navbar/profile_screen/spotify_Api/search_bar.dart';

class MovieHome extends StatefulWidget {
  final TMDBApi tmdbApi;

  MovieHome({required this.tmdbApi});

  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  List<dynamic> _movies = [];
  bool _isLoading = false;
  String _errorMessage = '';

  void _searchMovies(String query) async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });
    try {
      final results = await widget.tmdbApi.searchMovies(query);
      setState(() {
        _movies = results;
      });
    } catch (error) {
      setState(() {
        _errorMessage = 'Error searching for movies: $error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to handle movie selection
  void _selectMovie(dynamic movie) {
    Navigator.pop(context, movie); // Return selected movie to FirstSlideScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select a Movie")),
      body: Column(
        children: [
          CustomSearchBar(onSearch: _searchMovies),
          if (_isLoading) CircularProgressIndicator(),
          if (_errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_errorMessage, style: TextStyle(color: Colors.red)),
            ),
          Expanded(
            child: MovieList(
              movies: _movies,
              onMovieTap: _selectMovie, // Pass callback to handle movie tap
            ),
          ),
        ],
      ),
    );
  }
}