import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'dart:async';
// we import our plugin
import 'package:navigation_with_mapbox/navigation_with_mapbox.dart';

class TurnByTurn extends StatefulWidget {
  @override
  _TurnByTurnState createState() => _TurnByTurnState();
}

class _TurnByTurnState extends State<TurnByTurn> {
  // Only android
  final _navigationWithMapboxPlugin = NavigationWithMapbox();
  // Variable for Navigation Map Options
  MapboxOptions? _options;
  // Variables Stream to listen for events
  late Stream<int> listenEvents;
  late StreamSubscription _statusViewSubscription;
  // Control variable for map widget
  bool _controlView = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    // we instantiate the stream getStateMapboxView IOS
    listenEvents = MapboxNavigationView.getStateMapboxView;
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Flexible(
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: io.Platform.isAndroid
                                ? () async {
                                    // start navigation
                                    await _navigationWithMapboxPlugin
                                        .startNavigation(
                                            // origin refers to the user's starting point at the time of starting the navigation
                                            origin: WayPoint(
                                                latitude: 4.824167,
                                                longitude: 7.033611),
                                            // destination refers to the end point or goal for the user at the time of starting the navigation
                                            destination: WayPoint(
                                                latitude: 4.824167,
                                                longitude: 7.023611),
                                            // if we enable this option we can choose a destination with a sustained tap
                                            setDestinationWithLongTap: true,
                                            // if we enable this option we will activate the simulation of the route
                                            simulateRoute: true,
                                            // if we enable this option we can see alternative routes when starting the navigation map ONLY ANDROID
                                            // optional, default: false
                                            alternativeRoute: true,
                                            // the style or theme with which the navigation map will be loaded
                                            // optional, default: streets, others: dark, light, traffic_day, traffic_night, satellite, satellite_streets, outdoors
                                            style: 'traffic_day',
                                            language: 'en',
                                            // refers to the navigation mode, the route and time will be calculated depending on this
                                            // optional, default: driving, others: walking, cycling
                                            profile: 'driving',
                                            // unit of measure in which the navigation assistant will speak to us
                                            // optional, default: metric
                                            voiceUnits: 'imperial',
                                            // optional, message that will be displayed when starting the navigation map ONLY ANDROID
                                            msg: 'Welcome');
                                  }
                                : null,
                            child: const Text('Start Navigation Android'),
                          ),
                        ],
                      ),
                    ),
                    // When the condition is met we show the navigation map with mapbox
                    if (_controlView)
                      MapboxNavigationView(mapboxOptions: _options!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // function that listens to the state of the map
}
