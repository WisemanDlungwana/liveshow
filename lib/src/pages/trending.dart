import 'package:flutter/material.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  List<Map<String, dynamic>> trendingMovies = [
    {
      "id": 1,
      "name": "TV Show One",
      "image": "assets/images/shows/show1.jpg",
      "details": {
        "genres": ["Drama", "Thriller"],
        "cast": [
          {
            "person": {"name": "Actor One"}
          },
          {
            "person": {"name": "Actor Two"}
          }
        ],
        "year": "2022-05-15",
        "description": "<p>Thrilling TV show description</p>",
        "episodes": [
          {
            "number": 1,
            "season": 1,
            "name": "Episode 1",
            "summary": "<p>Episode 1 summary</p>",
            "image": {"medium": "assets/images/shows/show1.jpg"},
            "airtime": "10:00"
          },
          {
            "number": 2,
            "season": 1,
            "name": "Episode 2",
            "summary": "<p>Episode 2 summary</p>",
            "image": {"medium": "assets/images/shows/show1.jpg"},
            "airtime": "11:00"
          }
        ]
      }
    },
    {
      "id": 2,
      "name": "TV Show Two",
      "image": "assets/images/shows/show2.jpg",
      "details": {
        "genres": ["Action", "Adventure"],
        "cast": [
          {
            "person": {"name": "Actor Three"}
          },
          {
            "person": {"name": "Actor Four"}
          }
        ],
        "year": "2021-07-20",
        "description": "<p>Action-packed TV show description</p>",
        "episodes": [
          {
            "number": 1,
            "season": 1,
            "name": "Episode 1",
            "summary": "<p>Episode 1 summary</p>",
            "image": {"medium": "assets/images/shows/show2.jpg"},
            "airtime": "09:00"
          },
          {
            "number": 2,
            "season": 1,
            "name": "Episode 2",
            "summary": "<p>Episode 2 summary</p>",
            "image": {"medium": "assets/images/shows/show2.jpg"},
            "airtime": "10:00"
          }
        ]
      }
    }
  ]; // Mock data for trending shows

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Trending'),
        backgroundColor: Colors.black,
      ),
      body: _buildTrendingList(),
    );
  }

  Widget _buildTrendingList() {
    return ListView.builder(
      itemCount: trendingMovies.length,
      itemBuilder: (context, index) {
        var show = trendingMovies[index];
        var showName = show["name"];
        var showImage = show["image"];
        var genres = show["details"]["genres"].join(", ");

        return ListTile(
          leading: Image.asset(
            showImage,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(
            showName,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          subtitle: Text(
            genres,
            style: const TextStyle(color: Colors.white70),
          ),
          onTap: () {
            // Navigate to the MovieDetailPage with full details
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailPage(movieData: show),
              ),
            );
          },
        );
      },
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  final Map<String, dynamic> movieData;

  const MovieDetailPage({Key? key, required this.movieData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieName = movieData["name"];
    var description = movieData["details"]["description"];
    var genres = movieData["details"]["genres"].join(", ");
    var cast = movieData["details"]["cast"]
        .map((castMember) => castMember["person"]["name"])
        .join(", ");
    var episodes = movieData["details"]["episodes"];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movieName),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(
              movieData["image"],
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              movieName,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              genres,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Cast: $cast",
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Description:",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              description.replaceAll("<p>", "").replaceAll("</p>", ""),
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Episodes:",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            ...episodes.map<Widget>((episode) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(
                  episode["image"]["medium"],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  episode["name"],
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  episode["summary"]
                      .replaceAll("<p>", "")
                      .replaceAll("</p>", ""),
                  style: const TextStyle(color: Colors.white70),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
