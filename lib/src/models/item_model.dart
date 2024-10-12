part of netflix;

class ItemModel {
  final String _title;
  final List<Result> _results;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
      : _title = parsedJson['title'],
        _results = List<Result>.from(
          parsedJson['items'].map(
            (r) => Result.fromJson(r),
          ),
        );

  List<Result> get results => _results;
  String get title => _title;
}
