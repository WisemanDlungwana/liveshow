import 'package:flutter/material.dart';

class DownloadedContentPage extends StatefulWidget {
  @override
  _DownloadedContentPageState createState() => _DownloadedContentPageState();
}

class _DownloadedContentPageState extends State<DownloadedContentPage> {
  List<Map<String, dynamic>> downloadedContent = [
    {
      "id": 1,
      "name": "Movie One",
      "image": "assets/images/movies/movie1.jpg",
      "genres": ["Action", "Thriller"],
      "year": 2021,
      "type": "Movie"
    },
    {
      "id": 2,
      "name": "TV Show One",
      "image": "assets/images/shows/show1.jpg",
      "genres": ["Drama", "Thriller"],
      "year": 2022,
      "type": "TV Show"
    },
    {
      "id": 3,
      "name": "Movie Two",
      "image": "assets/images/movies/movie2.jpg",
      "genres": ["Adventure", "Action"],
      "year": 2020,
      "type": "Movie"
    },
    {
      "id": 4,
      "name": "TV Show Two",
      "image": "assets/images/shows/show2.jpg",
      "genres": ["Comedy"],
      "year": 2023,
      "type": "TV Show"
    },
  ]; // Mock data for downloaded content

  List<Map<String, dynamic>> filteredContent = [];
  String selectedGenre = "All";
  String selectedType = "All";

  @override
  void initState() {
    super.initState();
    filteredContent = downloadedContent; // Initialize with all content
  }

  void filterContent() {
    setState(() {
      filteredContent = downloadedContent.where((item) {
        bool matchesGenre =
            selectedGenre == "All" || item["genres"].contains(selectedGenre);
        bool matchesType =
            selectedType == "All" || item["type"] == selectedType;
        return matchesGenre && matchesType;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Downloaded Content'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          _buildFilterOptions(),
          Expanded(child: _buildContentList()),
        ],
      ),
    );
  }

  Widget _buildFilterOptions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              value: selectedGenre,
              dropdownColor: Colors.black,
              style: const TextStyle(color: Colors.white),
              items: [
                "All",
                "Action",
                "Thriller",
                "Drama",
                "Adventure",
                "Comedy"
              ].map((String genre) {
                return DropdownMenuItem<String>(
                  value: genre,
                  child: Text(genre),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedGenre = newValue!;
                  filterContent();
                });
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: DropdownButton<String>(
              value: selectedType,
              dropdownColor: Colors.black,
              style: const TextStyle(color: Colors.white),
              items: ["All", "Movie", "TV Show"].map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedType = newValue!;
                  filterContent();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentList() {
    if (filteredContent.isEmpty) {
      return const Center(
        child: Text(
          'No content available',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredContent.length,
      itemBuilder: (context, index) {
        var content = filteredContent[index];
        return ListTile(
          leading: Image.asset(
            content["image"],
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(
            content["name"],
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            content["type"] + " - " + content["genres"].join(", "),
            style: const TextStyle(color: Colors.white70),
          ),
        );
      },
    );
  }
}
