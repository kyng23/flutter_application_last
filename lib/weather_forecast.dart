class WeatherForecast {
  final product;
  final List dataseries;

  final timepoint;
  final cloudcover;
  final seeing;
  final transparency;
  final lifted_index;
  final rh2m;
  final wind10m;
  final direction;
  final speed;
  final temp2m;
  final prec_type;

  WeatherForecast(
      {required this.product,
      required this.dataseries,
      required this.timepoint,
      required this.cloudcover,
      required this.seeing,
      required this.transparency,
      required this.lifted_index,
      required this.rh2m,
      required this.wind10m,
      required this.direction,
      required this.speed,
      required this.temp2m,
      required this.prec_type});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
/*
Data series listesinin içinde 24 tane item  var burada örnek için her işlemi birinci itemden yaptım 
 */

    return WeatherForecast(
        product: json["product"],
        dataseries: json["dataseries"],
        timepoint: json["dataseries"][0]["timepoint"],
        cloudcover: json["dataseries"][0]["cloudcover"],
        seeing: json["dataseries"][0]["seeing"],
        transparency: json["dataseries"][0]["transparency"],
        lifted_index: json["dataseries"][0]["lifted_index"],
        rh2m: json["dataseries"][0]["rh2m"],
        wind10m: json["dataseries"][0]["wind10m"],
        direction: json["dataseries"][0]["wind10m"]["direction"],
        speed: json["dataseries"][0]["wind10m"]["speed"],
        temp2m: json["dataseries"][0]["temp2m"],
        prec_type: json["dataseries"][0]["prec_type"]);
  }
}
