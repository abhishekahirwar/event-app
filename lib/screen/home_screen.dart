import 'dart:convert';

import 'package:event_app/screen/event_details.dart';
import 'package:event_app/screen/search_screen.dart';
import 'package:event_app/widget/cards.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<dynamic> data1 = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const url =
        'https://sde-007.api.assignment.theinternetfolks.works/v1/event';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final data = jsonData['content']['data'];

      setState(() {
        data1 = data;
      });
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Events',
          style: TextStyle(
            color: Color(0xFF110C26),
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.search)),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Icon(Icons.more_vert),
              ),
            ],
          ),
        ],
        elevation: 0,
      ),
      body: data1.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data1.length,
              itemBuilder: (context, index) {
                final item = data1[index];
                final detailData = item;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EventDetailsScreen(data: detailData),
                      ),
                    );
                  },
                  // Home Screen Cards
                  child: Cards(item: item),
                );
              },
            ),
    );
  }
}
