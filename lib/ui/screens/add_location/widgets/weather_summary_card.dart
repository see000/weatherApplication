import 'package:flutter/material.dart';

class WeatherSummaryCard extends StatelessWidget {
  const WeatherSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: const Color(0xB3AAA5A5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Country',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    shadows: <Shadow>[
                      const Shadow(),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text('Weather state'),
                SizedBox(height: 22),
                Text('Humidity  50%'),
                SizedBox(height: 5),
                Text('Wind  15km/h'),
              ],
            ),
            Column(
              children: const [
                Image(
                  image: AssetImage('assets/images/weather_icons/PartlyCloudyDay.png'),
                  width: 20,
                  height: 20,
                ),
                Text('33\u2109'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
