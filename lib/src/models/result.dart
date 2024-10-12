part of netflix;

class Result {
  int id;
  final String _name;
  final String _image;
  final List<String> _genres;
  final List<String> _cast;
  final List<Episode> _episodes;
  final List<int> _seasons = [];
  final DateTime _date;
  final String _description;

  Result.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        _name = parsedJson['name'],
        _image = parsedJson['image'],
        _genres = List<String>.from(parsedJson['details']['genres']),
        _cast = List<String>.from(parsedJson['details']['cast'].map((cast) => cast['person']['name'].toString())),
        _date = parsedJson['year'] != null
            ? DateTime.parse(parsedJson['year'].toString())
            : DateTime.now(),
        _description = parsedJson['details']['description'].replaceAll(RegExp(r"<[^>]*>"), ''),
        _episodes = List<Episode>.from(parsedJson['details']['episodes'].map((e) => Episode.fromJson(e))) {
    for (var s in List.from(parsedJson['details']['episodes'])) {
      int seasonNumber = int.parse(s['season'].toString());
      if (!_seasons.contains(seasonNumber)) {
        _seasons.add(seasonNumber);
      }
    }
  }

  String get name => _name;
  String get image => _image;
  List<String> get genres => _genres;
  List<String> get cast => _cast;
  DateTime get date => _date;
  String get description => _description;
  List<Episode> get episodes => _episodes;
  List<int> get seasons => _seasons;
}
