import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_application/ui/screens/add_location/widgets/weather_summary_card.dart';
import 'package:weather_application/ui/screens/check_weather/check_weather_screen.dart';

import '../../../page_navigation.dart';

class SavedLocationsPage extends StatelessWidget {
  const SavedLocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SavedLocationsPageContent(),
        ),
      ),
    );
  }
}

class SavedLocationsPageContent extends StatefulWidget {
  const SavedLocationsPageContent({super.key});

  @override
  State<SavedLocationsPageContent> createState() => _SavedLocationsPageContentState();
}

class _SavedLocationsPageContentState extends State<SavedLocationsPageContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Saved Locations',
                  style: GoogleFonts.poppins().copyWith(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
                ),
              ),
              IconButton(
                onPressed: () {

                  navigateToPage(context, const CheckWeatherScreen());
                },
                icon: const Icon(
                  Icons.search,
                  size: 40,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const WeatherSummaryCard(),
        ],
      ),
    );
  }
}
