class InsightWeather {
  final List<SolInformation> week;

  const InsightWeather({
    required this.week,
  });

  factory InsightWeather.fromJson(Map<String, dynamic> json) {
    print(json['sol_keys']);

    return const InsightWeather(
      week: [],
    );
  }
}

class SolInformation {
  final String key;
  final String minTemperature;
  final String maxTemperature;

  const SolInformation(
      {required this.key,
      required this.minTemperature,
      required this.maxTemperature});
}
