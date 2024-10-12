part of netflix;

class SummaryState extends State<Summary> {
  void goTo(String type) {
    Navigator.pushNamed(
      context,
      Routes.filter,
      arguments: {'type': type},
    );
  }

  void goToDetail(Result item, int match) {
    Navigator.pushNamed(
      context,
      Routes.detail,
      arguments: {'match': match, 'show': item},
    );
  }

  void showTrailer() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]).then((_) {
      Navigator.pushNamed(
        context,
        Routes.video,
        arguments: {'title': 'Unforgettable'},
      );
    });
  }

  List<Widget> renderMainGenres() {
    if (tvShow['details']['genres'] == null) {
      return [];
    }
    List<Widget> genres = List.from(tvShow['details']['genres'].map((g) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          g,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 12.0,
          ),
        ),
      );
    }).toList());
    return genres;
  }

  Widget renderTitle(String tag, String text) {
    return Hero(
      tag: tag,
      child: TextButton(
        onPressed: () => goTo(tag),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final Result show = Result.fromJson(tvShow);
    bloc.fetchAllMovies();
    return StreamBuilder(
      stream: bloc.allMovies,
      builder: (context, AsyncSnapshot<List<ItemModel>> snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                primary: true,
                expandedHeight: screenSize.height * 0.65,
                backgroundColor: Colors.black,
                leading: Image.asset('assets/images/netflix_icon.png'),
                titleSpacing: 20.0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Left side is empty now that renderTitle is removed
                    const Spacer(),
                    // Right side: Add Login button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to login page or perform login action
                        Navigator.pushNamed(context, Routes.login);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(
                            0, 244, 67, 54), // Netflix red color
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: Text('Login'),
                    ),
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.network(show.image, fit: BoxFit.cover),
                        DecoratedBox(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              stops: [0.1, 0.6, 1.0],
                              colors: [
                                Colors.black54,
                                Colors.transparent,
                                Colors.black
                              ],
                            ),
                          ),
                          child: SizedBox(
                            height: 40.0,
                            width: screenSize.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          width: 3.0,
                                          color:
                                              Color.fromRGBO(185, 3, 12, 1.0),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      tvShow['name']?.replaceAll(' ', '\n') ??
                                          '',
                                      maxLines: 3,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        height: 0.65,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: renderMainGenres(),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                        ),
                                        child: const Column(
                                          children: <Widget>[
                                            Icon(Icons.add),
                                            Text(
                                              'My list',
                                              style: TextStyle(
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                        onPressed: () => print('My list'),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.black,
                                          backgroundColor: Colors.white,
                                        ),
                                        onPressed: showTrailer,
                                        child: const Row(
                                          children: <Widget>[
                                            Icon(Icons.play_arrow),
                                            Text(
                                              'Watch',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                        ),
                                        child: const Column(
                                          children: <Widget>[
                                            Icon(Icons.info_outline),
                                            Text(
                                              'Info',
                                              style: TextStyle(
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ],
                                        ),
                                        onPressed: () => goToDetail(show, 99),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ShowsList(
                    items: snapshot.data![index].results,
                    onTap: goToDetail,
                    title: snapshot.data![index].title,
                  ),
                  childCount: snapshot.data?.length ?? 0,
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return const Center(
            child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Color.fromRGBO(219, 0, 0, 1.0)),
        ));
      },
    );
  }
}
