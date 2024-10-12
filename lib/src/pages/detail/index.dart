part of '../../../app.dart';

class TvShow extends StatefulWidget {
  final int match;
  final Result item;

  const TvShow({
    super.key,
    required this.match,
    required this.item,
  });

  @override
  TvShowState createState() => TvShowState();
}
