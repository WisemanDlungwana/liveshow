part of netflix;

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = StreamController<List<ItemModel>>.broadcast();
  final _movieFetcher = StreamController<Result>.broadcast();

  Stream<List<ItemModel>> get allMovies => _moviesFetcher.stream;
  Stream<Result> get oneMovie => _movieFetcher.stream;

  fetchAllMovies() async {
    try {
      List<ItemModel> items = await _repository.fetchAllMovies();
      print('Movies fetched: ${items.length}');
      _moviesFetcher.sink.add(items);
    } catch (e) {
      print('Error fetching all movies: $e');
      _moviesFetcher.sink.addError('Failed to fetch movies');
    }
  }

  fetchOneMovie(int id) async {
    try {
      Result item = await _repository.fetchMovie(id);
      _movieFetcher.sink.add(item);
    } catch (e) {
      print('Error fetching movie $id: $e');
      _movieFetcher.sink.addError('Failed to fetch movie');
    }
  }

  dispose() {
    _moviesFetcher.close();
    _movieFetcher.close();
  }
}

final bloc = MoviesBloc();
