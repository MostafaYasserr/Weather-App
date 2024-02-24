import 'package:flutter/material.dart';

import '../pages/search_page.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            // color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchPage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              // color: Colors.white,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          textAlign: TextAlign.center,
          'there is no weather 😔 start searching now 🔍',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
