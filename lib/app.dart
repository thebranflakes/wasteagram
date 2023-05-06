import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'screens/share_location_screen.dart';
import 'screens/remote_data_screen.dart';
import 'screens/camera_screen.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Location Services',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: MainTabController());
  }
}

class MainTabController extends StatelessWidget {
  static const tabs = [
    Tab(icon: Icon(Icons.location_city), text: 'Location'),
    Tab(icon: Icon(Icons.cloud_circle_outlined), text: 'Cloud'),
    Tab(icon: Icon(Icons.camera), text: 'Camera')
  ];

  final screens = [ShareLocationScreen(), RemoteDataScreen(), CameraScreen()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: const Text('Location and Cloud'),
                bottom: const TabBar(tabs: tabs)),
            body: TabBarView(children: screens)));
  }
}
