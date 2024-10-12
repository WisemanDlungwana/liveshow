part of netflix;

typedef VideoWidgetBuilder = Widget Function(
    BuildContext context, VideoPlayerController controller);

class PlayerLifeCycle extends StatefulWidget {
  final VideoPlayerController controller;
  final VideoWidgetBuilder childBuilder;

  const PlayerLifeCycle({
    required this.controller,
    required this.childBuilder,
    super.key,
  });

  @override
  PlayerLifeCycleState createState() => PlayerLifeCycleState();
}
