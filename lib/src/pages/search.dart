import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _topSearchedItems = [
    'Stranger Things',
    'The Crown',
    'Breaking Bad',
    'Money Heist',
    'Lucifer'
  ]; // Example list of top searched items
  List<String> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _searchResults.clear(); // Show top searches when input is cleared
      } else {
        _searchResults = _topSearchedItems
            .where((item) => item.toLowerCase().contains(query))
            .toList(); // Filter top searched items based on input
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search for a show or movie',
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ),
      body: _buildSearchResults(),
    );
  }

  Widget _buildSearchResults() {
    List<String> itemsToDisplay =
        _searchController.text.isEmpty ? _topSearchedItems : _searchResults;

    if (itemsToDisplay.isEmpty) {
      return const Center(
        child: Text(
          'No results found',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: itemsToDisplay.length + 1, // +1 for the "Top Searches" heading
      itemBuilder: (context, index) {
        if (_searchController.text.isEmpty && index == 0) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Top Searches',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }

        final itemIndex = _searchController.text.isEmpty ? index - 1 : index;

        return ListTile(
          title: Text(
            itemsToDisplay[itemIndex],
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {
            // Action when item is tapped (e.g., navigate to show details)
          },
        );
      },
    );
  }
}
