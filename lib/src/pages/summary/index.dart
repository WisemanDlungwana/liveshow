part of netflix;

class Summary extends StatefulWidget {
  const Summary({super.key, this.title = ''});
  final String title;

  @override
  SummaryState createState() => SummaryState();
}
