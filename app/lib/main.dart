import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_on/config/colors.dart';
import 'package:movie_on/ui/router.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: TEXT_COLOR,
                displayColor: TEXT_COLOR,
              )),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
