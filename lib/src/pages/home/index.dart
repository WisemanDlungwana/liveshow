part of '../../../app.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title})
      : super(key: key); // Use Key? and required
  final String title;

  @override
  HomeState createState() => HomeState();
}
