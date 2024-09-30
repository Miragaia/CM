import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:workout/workout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wear OS Heart Rate Monitor',
      theme: ThemeData.dark(),
      home: const HeartRateMonitor(),
    );
  }
}

class HeartRateMonitor extends StatefulWidget {
  const HeartRateMonitor({Key? key}) : super(key: key);

  @override
  _HeartRateMonitorState createState() => _HeartRateMonitorState();
}

class _HeartRateMonitorState extends State<HeartRateMonitor> {
  final workout = Workout();
  double heartRate = 0;
  late MqttServerClient client;

  @override
  void initState() {
    super.initState();
    initializeMqttClient();
    startWorkoutListener();
  }

  Future<void> initializeMqttClient() async {
    client = MqttServerClient('broker.emqx.io', 'wear_os_heart_rate');
    client.logging(on: true);

    try {
      await client.connect();
      print('Connected to the MQTT broker');
    } catch (e) {
      print('Exception: $e');
      client.disconnect();
    }
  }

  void startWorkoutListener() {
    workout
        .start(
      exerciseType: ExerciseType.walking,
      features: [WorkoutFeature.heartRate],
      enableGps: false,
    )
        .then((result) {
      if (result.unsupportedFeatures.isEmpty) {
        workout.stream.listen((event) {
          if (event.feature == WorkoutFeature.heartRate) {
            setState(() {
              heartRate = event.value;
            });
            publishHeartRate();
          }
        });
      }
    }).catchError((error) {
      print('Error starting workout: $error');
    });
  }

  void publishHeartRate() {
    final builder = MqttClientPayloadBuilder();
    builder.addString('Heart Rate: ${heartRate.round()} bpm');
    client.publishMessage('sensor/data', MqttQos.atLeastOnce, builder.payload!);
    print('Heart rate data sent via MQTT');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Heart Rate: ${heartRate.round()} bpm',
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }

  @override
  void dispose() {
    workout.stop();
    client.disconnect();
    super.dispose();
  }
}
