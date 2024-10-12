import 'package:flutter/material.dart';

class SlidingMenu extends StatefulWidget {
  final double maxSlide;
  final VoidCallback onMenuClose;

  const SlidingMenu({
    Key? key,
    this.maxSlide = 200,
    required this.onMenuClose,
  }) : super(key: key);

  @override
  SlidingMenuState createState() => SlidingMenuState(); // Make this public
}

class SlidingMenuState extends State<SlidingMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation =
        Tween<double>(begin: 0, end: widget.maxSlide).animate(_controller);
  }

  void toggleMenu() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse().then((_) {
        widget.onMenuClose(); // Notify when the menu is closed
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value - widget.maxSlide, 0),
          child: _buildMenu(),
        );
      },
    );
  }

  Widget _buildMenu() {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: widget.maxSlide,
        child: Material(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const Icon(Icons.home, color: Colors.white),
                title:
                    const Text('Home', style: TextStyle(color: Colors.white)),
                onTap: () {
                  toggleMenu();
                },
              ),
              ListTile(
                leading: const Icon(Icons.search, color: Colors.white),
                title:
                    const Text('Search', style: TextStyle(color: Colors.white)),
                onTap: () {
                  toggleMenu();
                },
              ),
              ListTile(
                leading: const Icon(Icons.trending_up, color: Colors.white),
                title: const Text('Trending',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  _controller.reverse();
                },
              ),
              ListTile(
                leading: const Icon(Icons.download, color: Colors.white),
                title: const Text('Downloads',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  _controller.reverse();
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text('Settings',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  _controller.reverse();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
