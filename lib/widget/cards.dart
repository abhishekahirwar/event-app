import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Cards extends StatelessWidget {
  final Map item;
  const Cards({super.key, required this.item});

  String formatDateTime(String dateTimeString) {
    final inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ssZZZZZ");
    final outputFormat = DateFormat("E, MMM d • h:mm a");
    final dateTime = inputFormat.parse(dateTimeString, true);
    return outputFormat.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 4,
                ),
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.3,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      item['banner_image'],
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                // height: 100,
                padding: const EdgeInsets.only(top: 10, bottom: 5),

                child: Text(
                  formatDateTime(item['date_time']),
                  style: const TextStyle(
                    color: Color(0xFF5668FF),
                    fontSize: 13,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  // softWrap: true,
                ),
              ),
              // const SizedBox(height: 10),
              Container(
                // width: 206,
                child: Text(
                  item['title'],
                  style: const TextStyle(
                    color: Color(0xFF110C26),
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                    height: 25,
                    child: Icon(
                      Icons.location_on,
                      color: Color.fromRGBO(176, 177, 188, 1),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    // padding:
                    // const EdgeInsets.only(top: 10, bottom: 5),
                    child: Text(
                      "${item['venue_name']} • ${item['venue_city']}, ${item['venue_country']}",
                      style: const TextStyle(
                        color: Color(0xFF747688),
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
