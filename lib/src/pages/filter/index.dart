part of netflix;

class Filter extends StatefulWidget {
  final String title;
  final String type;

  const Filter({
    super.key,
    required this.title,
    required this.type,
  });

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('Filter type: ${widget.type}'),
      ),
    );
  }
}
