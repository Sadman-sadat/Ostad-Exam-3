class Weather {
  Weather({
    required String city,
    required num temperature,
    required String condition,
    required num humidity,
    required num windSpeed,
  })   : _city = city,
        _temperature = temperature,
        _condition = condition,
        _humidity = humidity,
        _windSpeed = windSpeed;

  Weather.fromJson(dynamic json) {
    _city = json['city'];
    _temperature = json['temperature'];
    _condition = json['condition'];
    _humidity = json['humidity'];
    _windSpeed = json['windSpeed'];
  }

  late String _city;
  late num _temperature;
  late String _condition;
  late num _humidity;
  late num _windSpeed;

  Weather copyWith({
    String? city,
    num? temperature,
    String? condition,
    num? humidity,
    num? windSpeed,
  }) =>
      Weather(
        city: city ?? _city,
        temperature: temperature ?? _temperature,
        condition: condition ?? _condition,
        humidity: humidity ?? _humidity,
        windSpeed: windSpeed ?? _windSpeed,
      );

  String get city => _city;
  num get temperature => _temperature;
  String get condition => _condition;
  num get humidity => _humidity;
  num get windSpeed => _windSpeed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    map['temperature'] = _temperature;
    map['condition'] = _condition;
    map['humidity'] = _humidity;
    map['windSpeed'] = _windSpeed;
    return map;
  }
}
