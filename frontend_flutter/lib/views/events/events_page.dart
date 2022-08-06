import 'package:flutter/material.dart';
import 'package:frontend_flutter/model/events/events_model.dart';
import 'package:frontend_flutter/services/events/events_repository.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  EventsRepository eventsRepository = EventsRepository();
  List<Events>? listEvents = [];
  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  loadEvents() async {
    listEvents = await eventsRepository.getEvents();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.05,
                top: size.height * 0.04,
                right: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "UpComing Events",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.02),
                  child: SizedBox(
                    height: size.height * 0.3,
                    width: size.width * 0.9,
                    child: (listEvents!.isEmpty)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listEvents!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              Events events = listEvents![index];
                              return Container(
                                margin:
                                    EdgeInsets.only(right: size.width * 0.05),
                                height: size.height * 0.28,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    gradient: const LinearGradient(
                                        colors: [
                                          Colors.deepOrangeAccent,
                                          Colors.purple,
                                          Colors.deepPurpleAccent
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.05),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.01),
                                        child: Text(
                                          events.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.01),
                                        child: Text(
                                          events.location,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.01),
                                        child: SizedBox(
                                          width: size.width * 0.8,
                                          child: Text(
                                            events.description,
                                            textAlign: TextAlign.start,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.01),
                                        child: Text(
                                          "Event-Type:${events.eventType}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.01),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            onTap: () async {
                                              if (await canLaunchUrl(
                                                  Uri.parse(events.formLink))) {
                                                await launchUrlString(
                                                    events.formLink,
                                                    mode: LaunchMode
                                                        .externalApplication);
                                              }
                                            },
                                            child: Ink(
                                              height: size.height * 0.06,
                                              width: size.width * 0.7,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0)),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    "Interested",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline5!
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.03),
                  child: Text(
                    "Other Events",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                if (listEvents!.isEmpty) ...[
                  const CircularProgressIndicator()
                ] else ...[
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listEvents!.length,
                    itemBuilder: ((context, index) {
                      Events events = listEvents![index];
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.03),
                        child: Container(
                          height: size.height * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(57, 0, 0, 0),
                                  blurRadius: 5.0,
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.01),
                                child: Text(
                                  events.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.01),
                                child: Text(events.location),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.01),
                                child: SizedBox(
                                  width: size.width * 0.8,
                                  child: Text(
                                    events.description,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.01),
                                child: Text(
                                  "Event-Type:${events.eventType}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.01),
                                child: Material(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12.0),
                                    onTap: () async{
                                      if (await canLaunchUrl(
                                                  Uri.parse(events.formLink))) {
                                                await launchUrlString(
                                                    events.formLink,
                                                    mode: LaunchMode
                                                        .externalApplication);
                                              }
                                    },
                                    child: Ink(
                                      height: size.height * 0.06,
                                      width: size.width * 0.7,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Interested",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
