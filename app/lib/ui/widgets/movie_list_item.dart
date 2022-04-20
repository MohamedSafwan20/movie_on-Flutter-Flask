import 'package:flutter/material.dart';
import 'package:movie_on/config/colors.dart';

class MovieListItem extends StatefulWidget {
  const MovieListItem({Key? key}) : super(key: key);

  @override
  State<MovieListItem> createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Stack(
        children: [
          // Container(
          //   width: 50,
          //   height: 50,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: Colors.red
          //   ),
          // ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 340,
              height: 200,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          "https://picsum.photos/200/300",
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "MOvie title sdfs df df sdf ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.visibility_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                label: Text(
                                  "WATCH",
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: SECONDARY_COLOR,
                                ),
                              ),
                            ),
                          )
                        ],
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
        ],
      ),
    );
  }
}
