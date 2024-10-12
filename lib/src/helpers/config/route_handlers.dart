part of netflix;

var rootHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const Home(
      title: '',
    );
  },
);

var summaryRouteHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return const Summary();
  },
);

final Handler loginRouteHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return LoginPage(); // Replace this with the actual login page widget
  },
);

var detailRouteHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    final object =
        ModalRoute.of(context!)?.settings.arguments as Map<String, dynamic>?;
    return TvShow(match: object?['match'], item: object?['show']);
  },
);

var trailerRouteHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    final object =
        ModalRoute.of(context!)?.settings.arguments as Map<String, dynamic>?;
    return Video(title: object?['title'] ?? '');
  },
);

var filterRouteHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    final object =
        ModalRoute.of(context!)?.settings.arguments as Map<String, dynamic>?;
    return Filter(
      title: object?['title'] ?? '',
      type: object?['type'] ?? '',
    );
  },
);
