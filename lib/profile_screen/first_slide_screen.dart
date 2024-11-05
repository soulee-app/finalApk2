import 'package:flutter/material.dart';
import 'package:navbar/profile_screen/BooksApi/booksHome.dart';
import 'package:navbar/profile_screen/movieApi/movieHome.dart';
import 'package:navbar/profile_screen/spotify_Api/muisic_home.dart';
import 'package:navbar/profile_screen/spotify_Api/spotify_api.dart';
import 'package:navbar/profile_screen/movieApi/tmdb_api.dart';
import 'package:navbar/profile_screen/BooksApi/google_books_api.dart';
import 'package:navbar/profile_screen/widgets/Text_with_icon.dart';
import 'package:navbar/profile_screen/widgets/custom_switch_button.dart';
import 'package:navbar/profile_screen/widgets/custome_text_list.dart';
import 'package:navbar/profile_screen/widgets/heading_text.dart';

class FirstSlideScreen extends StatefulWidget {
  const FirstSlideScreen({super.key});

  @override
  State<FirstSlideScreen> createState() => _FirstSlideScreenState();
}

class _FirstSlideScreenState extends State<FirstSlideScreen> {
  final SpotifyApi spotifyApi = SpotifyApi();
  final TMDBApi tmdbApi = TMDBApi();
  final GoogleBooksApi googleBooksApi = GoogleBooksApi();

  String? selectedAlbumImageUrl;
  String? selectedMovieImageUrl;
  String? selectedBookImageUrl;

  String? selectedAlbumName;
  String? selectedMovieName;
  String? selectedBookName;

  String? selectedAlbumArtist;
  String? selectedBookAuthor;

  // Open MusicHome and select a song
  void _openMusicHome() async {
    final selectedSong = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MusicHome(spotifyApi: spotifyApi),
      ),
    );
    if (selectedSong != null) {
      setState(() {
        selectedAlbumImageUrl = selectedSong['album']['images'][0]['url'];
        selectedAlbumName = selectedSong['name'];
        selectedAlbumArtist = selectedSong['artists'][0]['name'];
      });
    }
  }

  // Open MovieHome and select a movie
  void _openMovieHome() async {
    final selectedMovie = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieHome(tmdbApi: tmdbApi),
      ),
    );
    if (selectedMovie != null) {
      setState(() {
        selectedMovieImageUrl = selectedMovie['poster_path'];
        selectedMovieName = selectedMovie['title'];
      });
    }
  }

  // Open BookHome and select a book
  void _openBookHome() async {
    final selectedBook = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookHome(googleBooksApi: googleBooksApi),
      ),
    );
    if (selectedBook != null) {
      setState(() {
        selectedBookImageUrl = selectedBook['imageLinks']?['thumbnail'];
        selectedBookName = selectedBook['title'];
        selectedBookAuthor = selectedBook['authors'] != null
            ? selectedBook['authors'][0]
            : 'Unknown Author';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> sampleTexts = [];

    final List<Map<String, dynamic>> items = [
      {
        'text': 'RAAT',
        'icon': const IconData(0xe559, fontFamily: 'MaterialIcons')
      },
      {'text': 'KIND', 'icon': Icons.favorite_outlined},
      {'text': 'DHAKA', 'icon': Icons.location_city_rounded},
      {'text': 'JAGA', 'icon': Icons.location_on},
      {'text': 'BRAC UNIVERSITY', 'icon': Icons.cast_for_education},
      {'text': 'CSE', 'icon': Icons.computer},
      {
        'text': 'BRAC',
        'icon': const IconData(0xe089, fontFamily: 'MaterialIcons')
      },
    ];

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '❝Mother of 3 Baby❞',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.center,
              children: items.map((item) {
                return TextWithIcon(
                  text: item['text'],
                  icon: item['icon'],
                );
              }).toList(),
            ),
            const CustomSwitchButton(),
            const HeadingText(text: 'LIFE MEMORIES'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMemoryBox(
                    label: selectedAlbumName ?? 'Music',
                    subLabel: selectedAlbumArtist,
                    imageUrl: selectedAlbumImageUrl,
                    icon: Icons.music_note,
                    onTap: _openMusicHome,
                  ),
                  _buildMemoryBox(
                    label: selectedMovieName ?? 'Movie',
                    imageUrl: selectedMovieImageUrl != null
                        ? 'https://image.tmdb.org/t/p/w500$selectedMovieImageUrl'
                        : null,
                    icon: Icons.movie,
                    onTap: _openMovieHome,
                  ),
                  _buildMemoryBox(
                    label: selectedBookName ?? 'Book',
                    subLabel: selectedBookAuthor,
                    imageUrl: selectedBookImageUrl,
                    icon: Icons.book,
                    onTap: _openBookHome,
                  ),
                ],
              ),
            ),
            CustomTextList(texts: sampleTexts),
          ],
        ),
      ),
    );
  }

  Widget _buildMemoryBox({
    required String label,
    String? subLabel,
    String? imageUrl,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 220, 63, 63)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: imageUrl != null
                  ? Image.network(imageUrl, fit: BoxFit.cover)
                  : Icon(icon,
                      size: 40, color: const Color.fromARGB(255, 221, 67, 67)),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            if (subLabel != null)
              Text(
                subLabel,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12, color: Color.fromARGB(255, 91, 79, 79)),
              ),
          ],
        ),
      ),
    );
  }
}
