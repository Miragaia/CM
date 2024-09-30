import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_client/mqtt_client.dart';

class MqttService {
  late MqttServerClient client;
  final StreamController<String> _heartRateUpdateController = StreamController<String>.broadcast();

  Stream<String> get heartRateUpdates => _heartRateUpdateController.stream;

  Future<int?> getCurrentUserId() async {
    const storage = FlutterSecureStorage();
    String? userIdStr = await storage.read(key: 'id');
    if (userIdStr != null) {
      return int.parse(userIdStr);
    }
    return null;
  }

  Future<void> initializeMqttClient() async {
    client = MqttServerClient('broker.emqx.io', 'flutter_client_android');
    client.logging(on: true);

    // Configure callbacks
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;

    try {
      await client.connect();
      print('MQTT: Conectado com sucesso ao broker.');
    } catch (e) {
      print('MQTT: Exception na conexão - $e');
      client.disconnect();
    }

    // Subscribe to the topic
    const topic = 'sensor/data';
    client.subscribe(topic, MqttQos.atLeastOnce);

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      final String payload =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print('MQTT: Mensagem recebida - $payload');
      _handleHeartRateData(payload);
    });
  }

  void _handleHeartRateData(String payload) {
    final parts = payload.split(', ');
    final heartRate = parts[0].split(': ')[1]; // Only extract the heart rate

    print("Heart Rate: $heartRate");

    // Add the heart rate data to the stream
    _heartRateUpdateController.add(heartRate);
  }

  void onConnected() {
    print('Connected to MQTT broker.');
  }

  void onDisconnected() {
    print('Disconnected from MQTT broker.');
  }
}
