import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key, required this.data});
  final Map data;

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  String formatDateTime(String dateTimeString) {
    final inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ssZZZZZ");
    final outputFormat = DateFormat("d MMMM, y");
    final dateTime = inputFormat.parse(dateTimeString, true);
    return outputFormat.format(dateTime);
  }

  String formatDateTimeDay(String dateTimeString) {
    final inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ssZZZZZ");
    final outputFormat = DateFormat("EEEE, h:mm a - 10:00 a");
    final dateTime = inputFormat.parse(dateTimeString, true);
    return outputFormat.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(200.0), // Adjust the height as needed
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.data['banner_image'],
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            AppBar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              title: const Text(
                'Event Details',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              actions: const [
                Icon(Icons.bookmark),
              ],
              elevation: 0,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 24,
            ),
            child: Text(
              widget.data['title'],
              style: const TextStyle(
                color: Color(0xFF110C26),
                fontSize: 35,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
              maxLines: 2,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 22),
                width: 54,
                height: 51.68,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.data['organiser_icon'],
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data['organiser_name'],
                    style: const TextStyle(
                      color: Color(0xFF0D0C26),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      // height: 0.11,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Organizer',
                    style: TextStyle(
                      color: Color(0xFF6F6D8F),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                opacity: 0.20,
                child: Container(
                  margin: const EdgeInsets.only(left: 22),
                  width: 54,
                  height: 51.68,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5668FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.calendar_month_outlined,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatDateTime(widget.data['date_time']),
                    style: const TextStyle(
                      color: Color(0xFF0D0C26),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      // height: 0.11,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    formatDateTimeDay(widget.data['date_time']),
                    style: const TextStyle(
                      color: Color(0xFF6F6D8F),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                opacity: 0.20,
                child: Container(
                  margin: const EdgeInsets.only(left: 22),
                  width: 54,
                  height: 51.68,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5668FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.location_on,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      widget.data['venue_name'],
                      style: const TextStyle(
                        color: Color(0xFF0D0C26),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        // height: 0.11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      "${widget.data['venue_name']} ${widget.data['venue_city']}, ${widget.data['venue_country']}",
                      style: const TextStyle(
                        color: Color(0xFF6F6D8F),
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        // height: 0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Opacity(
                  opacity: 0.84,
                  child: Text(
                    'About Event',
                    style: TextStyle(
                      color: Color(0xFF110C26),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width * 0.,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.data['description'],
                  style: const TextStyle(
                    color: Color(0xFF110C26),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width * 0.7,
              color: Colors.transparent,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {},
                child: const Center(
                  child: Text(
                    'Book Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
