// lib/main.dart
import 'package:flutter/material.dart';
import 'config/app_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.instance;

    return MaterialApp(
      title: config.appName,
      debugShowCheckedModeBanner: config.showDebugBanner,
      theme: ThemeData(
        primarySwatch: _getThemeColor(),
      ),
      home: const HomePage(),
    );
  }

  MaterialColor _getThemeColor() {
    final config = AppConfig.instance;
    switch (config.environment) {
      case Environment.dev:
        return Colors.green;
      case Environment.staging:
        return Colors.orange;
      case Environment.prod:
        return Colors.blue;
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text(config.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Environment', config.environment.name.toUpperCase()),
            _buildInfoRow('App Name', config.appName),
            _buildInfoRow('API URL', config.apiBaseUrl),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _makeApiCall(context),
              child: const Text('Test API Call'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  void _makeApiCall(BuildContext context) {
    final config = AppConfig.instance;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Calling ${config.apiBaseUrl}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
