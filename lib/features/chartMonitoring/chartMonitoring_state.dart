import 'package:dropill_project/features/monitoring/monitoring_page.dart';
import 'package:flutter/material.dart';

import 'chartMonitoring_controller.dart';

class ChartPageState extends State<chartMonitorigPage> {
  late final ChartPageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ChartPageController();
    // Inicialize qualquer lógica do controlador aqui
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráfico de Monitoramentos'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Aqui você pode adicionar seu gráfico'),
        ),
      ),
    );
  }
}
