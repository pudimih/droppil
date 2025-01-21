import 'package:flutter/material.dart';

import 'chartMonitoring_state.dart';

class ChartPage extends StatefulWidget {
  final List<Map<String, String>> monitoredSymptoms;

  const ChartPage({super.key, required this.monitoredSymptoms});

  @override
  ChartPageState createState() => ChartPageState();
}
