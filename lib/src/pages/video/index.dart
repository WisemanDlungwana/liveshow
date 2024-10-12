part of netflix;

class Video extends StatefulWidget {
  final String title;

  const Video({
    super.key,
    required this.title,
  });

  @override
  VideoState createState() => VideoState();
}
