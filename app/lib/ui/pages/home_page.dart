import 'package:flutter/material.dart';
import 'package:movie_on/config/colors.dart';
import 'package:movie_on/ui/widgets/movie_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.0, vertical: 40),
                child: Text(
                  "Browse Movies",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              width: 320,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: PRIMARY_VARIANT_COLOR,
                  offset: Offset(
                    0.1,
                    0.1,
                  ),
                  blurRadius: 0,
                  spreadRadius: 2,
                ), //BoxShadow
                BoxShadow(
                  color: PRIMARY_COLOR,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ]),
              child: TextField(
                cursorColor: TEXT_COLOR,
                decoration: InputDecoration(
                  fillColor: PRIMARY_VARIANT_COLOR,
                  filled: true,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: TEXT_COLOR,
                    ),
                    onPressed: () {},
                    splashRadius: 0.1,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.0, color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.0, color: Colors.transparent),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 34.0, vertical: 40),
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "Latest ",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: "Movies",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w300)),
                ])),
              ),
            ),
            const MovieList()
          ],
        ),
      ),
    );
  }
}
