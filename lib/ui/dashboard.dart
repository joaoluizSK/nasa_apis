import 'package:flutter/material.dart';
import 'package:nasa_apis/ui/astronomy_picture_of_day.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const <Widget>[
        ApodWidget(),
      ],
    );
  }
}
