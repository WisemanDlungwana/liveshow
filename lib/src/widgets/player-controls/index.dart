part of netflix;

class PlayerControl extends StatefulWidget {
  final VideoPlayerController controller;
  final String title;
  final bool visible;

  const PlayerControl({
    required this.controller,
    this.visible = false,
    this.title = '',
    super.key,
  });

  @override
  PlayerControlState createState() => PlayerControlState();
}
