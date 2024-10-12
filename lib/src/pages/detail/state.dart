part of netflix;

class TvShowState extends State<TvShow> {
  var currentSeason = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<Episode> seasonEpisodes = widget.item.episodes
        .where((Episode e) => e.season == currentSeason)
        .toList();
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            primary: true,
            expandedHeight: 430.0,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                child: Stack(
                  fit: StackFit.loose,
                  children: <Widget>[
                    Container(
                      width: screenSize.width,
                      height: 220,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            widget.item.image,
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 64.0,
                          width: 64.0,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32.0),
                                ),
                              ),
                              side: const BorderSide(color: Colors.white),
                              backgroundColor:
                                  const Color.fromRGBO(0, 0, 0, 0.3),
                            ),
                            onPressed: () => print('play'),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 48.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width,
                      height: 220,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            stops: [0.1, 0.4, 1.0],
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                              Colors.black
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.item.name,
                                maxLines: 3,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 220,
                      child: Container(
                        padding: const EdgeInsets.only(left: 8.0, right: 30.0),
                        width: screenSize.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '${widget.match}% Views',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Color.fromRGBO(0, 255, 0, 0.8),
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              widget.item.date.year.toString(),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.3),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                              ),
                            ),
                            const Text(
                              '16 +',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.3),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              '${widget.item.seasons.length} Seasons',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.3),
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 240,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: screenSize.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                child: Text(
                                  widget.item.description,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.8),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                child: RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    style: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.3),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.0,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: 'Starring by: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                          text: widget.item.cast.join(', ')),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                children: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white70,
                                    ),
                                    onPressed: () => print('My List'),
                                    child: const SizedBox(
                                      height: 50.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Icon(
                                            Icons.add,
                                            size: 32.0,
                                          ),
                                          Text(
                                            'My List',
                                            style: TextStyle(fontSize: 10.0),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white70,
                                    ),
                                    onPressed: () => print('Likes'),
                                    child: const SizedBox(
                                      height: 50.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Icon(
                                            Icons.thumb_up,
                                            size: 24.0,
                                          ),
                                          Text(
                                            'Likes',
                                            style: TextStyle(fontSize: 10.0),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white70,
                                    ),
                                    onPressed: () => print('Share'),
                                    child: const SizedBox(
                                      height: 50.0,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Icon(
                                            Icons.share,
                                            size: 20.0,
                                          ),
                                          Text(
                                            'Share',
                                            style: TextStyle(fontSize: 10.0),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                child: const Text(
                                  'EPISODES',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 0.8),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0.0),
                              ),
                              onPressed: widget.item.seasons.length > 1
                                  ? () => print('Next Season')
                                  : null,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Season $currentSeason',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.6),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  if (widget.item.seasons.length > 1)
                                    const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.6),
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Check if there are episodes in the current season
          if (seasonEpisodes.isNotEmpty) ...[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            width: 150.0,
                            height: 90.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(seasonEpisodes[index]
                                    .image), // Assuming the image is local
                              ),
                            ),
                            child: Center(
                              child: SizedBox(
                                height: 32.0,
                                width: 32.0,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(32.0),
                                      ),
                                    ),
                                    side: const BorderSide(color: Colors.white),
                                    backgroundColor:
                                        const Color.fromRGBO(0, 0, 0, 0.3),
                                  ),
                                  onPressed: () => print('play'),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${index + 1}. ${seasonEpisodes[index].name}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(255, 255, 255, 0.8),
                                ),
                              ),
                              Text(
                                '${seasonEpisodes[index].duration}m',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Color.fromRGBO(255, 255, 255, 0.3),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        seasonEpisodes[index].summary,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Color.fromRGBO(255, 255, 255, 0.3),
                        ),
                      )
                    ],
                  ),
                ),
                childCount: seasonEpisodes.length,
              ),
            ),
          ] else ...[
            // Show this Sliver if there are no episodes in the current season
            const SliverFillRemaining(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'No episodes available for this show',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
