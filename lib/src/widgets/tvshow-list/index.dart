part of netflix;

class ShowsList extends StatelessWidget {
  final ScrollController controller = ScrollController();
  final String title;
  final List<Result> items;
  final Function onTap;

  ShowsList({
    super.key,
    required this.title,
    required this.items,
    required this.onTap,
  });

  List<Widget> renderItems() {
    return items.map((item) {
      return InkWell(
        onTap: () => onTap(item, 99),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2.5),
          width: 120.0,
          height: 140.0,
          child: _buildImage(item.image),
        ),
      );
    }).toList();
  }

  // Helper method to differentiate between asset and network images
  Widget _buildImage(String imagePath) {
    if (imagePath.startsWith('http')) {
      // If it's a network image
      return Image.network(imagePath, fit: BoxFit.cover);
    } else {
      // Otherwise assume it's an asset image
      return Image.asset(imagePath, fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white),
          ),
          SingleChildScrollView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: renderItems(),
            ),
          ),
        ],
      ),
    );
  }
}
