import 'package:flutter/material.dart';
import 'package:movie_on/config/colors.dart';
import 'package:movie_on/config/routes.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({Key? key, required this.name, required this.image})
      : super(key: key);

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 340,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            image,
                          )),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 25),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minHeight: 150),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Container(
                                  height: 30,
                                  margin: const EdgeInsets.only(top: 20),
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, MOVIE_DETAILS_ROUTE);
                                    },
                                    icon: const Icon(
                                      Icons.visibility_outlined,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    label: const Text(
                                      "WATCH",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: SECONDARY_COLOR,
                                        shape: const StadiumBorder()),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: PRIMARY_VARIANT_COLOR),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 50,
              height: 50,
              transform: Matrix4.translationValues(0.0, -35.0, 0.0),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: PRIMARY_COLOR),
            ),
          ),
        ],
      ),
    );
  }
}
