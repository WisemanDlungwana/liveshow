part of netflix;

class Routes {
  static String root = '/';
  static String summary = '/summary';
  static String detail = '/detail';
  static String filter = '/filter';
  static String video = '/trailer';
  static const String login = '/login';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        print('ROUTE WAS NOT FOUND !!!');
        return null;
      },
    );
    router.define(root, handler: rootHandler);
    router.define(summary, handler: summaryRouteHandler);
    router.define(detail, handler: detailRouteHandler);
    router.define(filter, handler: filterRouteHandler);
    router.define(video, handler: trailerRouteHandler);
    router.define(login, handler: loginRouteHandler);
  }
}
