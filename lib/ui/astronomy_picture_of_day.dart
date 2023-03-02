import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nasa_apis/entity/astronomy_picture_of_day.dart';
import 'package:nasa_apis/services/api.dart';
import 'package:nasa_apis/utils/screen_type.dart';

class ApodWidget extends StatefulWidget {
  const ApodWidget({super.key});

  @override
  State<ApodWidget> createState() => _ApodWidget();
}

class _ApodWidget extends State<ApodWidget> {
  late Future<AstronomyPictureOfDay> apod;

  @override
  void initState() {
    super.initState();
    apod = ApiService().fetchApod();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.shortestSide;
    final int columns =
        min((screenSize / ScreenType.handset.minWidth!).floor(), 2);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisSize: MainAxisSize.min,
      verticalDirection: VerticalDirection.up,
      children: [
        FutureBuilder<AstronomyPictureOfDay>(
          future: apod,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                width: width / columns,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: height / 6,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(snapshot.data!.url)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Text(snapshot.data!.explanation),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        )
      ],
    );
  }
}
