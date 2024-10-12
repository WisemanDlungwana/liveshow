part of '../../../app.dart';

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BottomNavBar(
      pages: <Widget>[
        const Summary(), // The content for the Home tab
        SearchWidget(), // The content for the Search tab
        TrendingPage(), // The content for the Trending tab
        DownloadedContentPage(), // The content for the Downloads tab
        SlidingMenu(
          onMenuClose: () {
            // Define what should happen when the menu is closed
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_) => const Home(
                      title: '',
                    )));
          },
        ), // The content for the Menu tab
      ],
    );
  }
}
