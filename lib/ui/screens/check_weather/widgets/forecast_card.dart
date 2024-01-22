import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/data/models/weather.dart';
import 'package:weather_application/utils/services/wmo_service.dart';

class ForcastCard extends StatefulWidget {
  const ForcastCard({super.key, required this.weatherForecast});
  final WeatherForecast weatherForecast;
  @override
  State<ForcastCard> createState() => _ForcastCardState();
}

class _ForcastCardState extends State<ForcastCard> {
  late String formattedDate;
  late String weatherIconPath;

  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat('EEE d').format(widget.weatherForecast.date);
    weatherIconPath = WMOService.getWeatherImage(widget.weatherForecast.weatherState);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: LayoutBuilder(builder: (context, constraints) {
            return Text(
              formattedDate,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white, fontSize: constraints.maxHeight),
            );
          })),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: LayoutBuilder(builder: (context, constraints) {
                double ratio = constraints.maxHeight / constraints.maxWidth;
                return AspectRatio(
                    aspectRatio: ratio,
                    child: Image.asset(
                      weatherIconPath,
                      fit: BoxFit.fill,
                      height: constraints.maxHeight,
                      width: constraints.maxWidth * 0.5,
                    ));
              }),
            ),
          ),
          Expanded(child: LayoutBuilder(builder: (context, constraints) {
            return Text(
              '${widget.weatherForecast.temperature} °C',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white, fontSize: constraints.maxHeight),
            );
          })),
          Expanded(child: LayoutBuilder(builder: (context, constraints) {
            return Text(
              '${widget.weatherForecast.windSpeed}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
            );
          })),
          Expanded(child: LayoutBuilder(builder: (context, constraints) {
            return Text(
              'km/h',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                  ),
            );
          }))
        ],
      ),
    );
  }
}
