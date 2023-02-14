import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_last/presentation.dart';

// ignore: must_be_immutable
class MySearchDelegate extends SearchDelegate {
  MyHomePage myHomePage = MyHomePage();
  List<String> searchResults = [
    "Elazig",
    "London",
    "New York",
    "Paris",
    "Tokyo",
    "Dubai",
    "Singapore",
    "Bangkok",
    "Istanbul",
    "Seoul",
    "Shanghai",
    "Hong Kong",
    "Moscow",
    "Beijing",
    "Rome",
    "Barcelona",
    "Munich",
    "Vienna",
    "Amsterdam",
    "Madrid",
    "Berlin",
    "Osaka",
    "Milan",
    "Sydney",
    "Los Angeles",
    "Toronto",
    "Mexico City",
    "São Paulo",
    "Jakarta",
    "Mumbai",
    "Kuala Lumpur",
    "St. Petersburg",
    "Hanoi",
    "Manila",
    "Ho Chi Minh City",
    "Miami",
    "Prague",
    "Budapest",
    "Athens",
    "Cairo",
    "Warsaw",
    "Lisbon",
    "Rio de Janeiro",
    "Brussels",
    "Stockholm",
    "Zurich",
    "Oslo",
    "Geneva",
    "Copenhagen",
    "Helsinki",
    "Bratislava",
    "Ljubljana",
    "Bucharest",
    "Santiago",
    "Guangzhou",
    "Melbourne",
    "Perth",
    "Dublin",
    "San Francisco",
    "Chicago",
    "Houston",
    "Washington D.C.",
    "Boston",
    "Dallas",
    "Philadelphia",
    "Atlanta",
    "Montreal",
    "Vancouver",
    "Seattle",
    "Calgary",
    "Edmonton",
    "Ottawa",
    "Minneapolis",
    "Detroit",
    "St. Louis",
    "Kansas City",
    "Denver",
    "San Diego",
    "Phoenix",
    "Las Vegas",
    "Austin",
    "Orlando",
    "Tampa",
    "Charlotte",
    "Pittsburgh",
    "Cleveland",
    "Raleigh",
    "Indianapolis",
    "Columbus",
    "Nashville",
    "Milwaukee",
    "Portland",
    "Sacramento",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              }
              query = "";
            },
            icon: const Icon(Icons.clear))
      ];
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResults) {
      final result = searchResults.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            myHomePage.stateClass.cityApi(suggestion);
           
            close(context, null);
          },
        );
      },
    );
  }
}
