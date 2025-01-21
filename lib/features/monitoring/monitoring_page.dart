import 'package:flutter/material.dart';

class MonitoringPage extends StatefulWidget {
  const MonitoringPage({super.key});

  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  bool _isAddingSymptom = false; // Controla se o formulário está visível
  String _selectedSymptom = ''; // Guarda o sintoma selecionado
  String _dateTime = ''; // Guarda a data e hora do monitoramento
  final List<Map<String, String>> _monitoredSymptoms = []; // Lista para armazenar os sintomas monitorados

  @override
  void initState() {
    super.initState();
    // Inicializa a data e hora
    final now = DateTime.now();
    _dateTime = '${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}';
  }

  void _toggleForm() {
    setState(() {
      _isAddingSymptom = !_isAddingSymptom;
    });
  }

  void _addSymptom(String symptom) {
    final now = DateTime.now();
    final formattedDateTime = '${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}';
    setState(() {
      _monitoredSymptoms.insert(0, { // Adiciona o novo sintoma no topo da lista
        'symptom': symptom,
        'dateTime': formattedDateTime,
      });
      _selectedSymptom = symptom;
      _dateTime = formattedDateTime;
      _isAddingSymptom = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> symptoms = [
      'Dor de Cabeça',
      'Febre',
      'Cansaço',
      'Náusea',
      'Tosse',
      'Dor Abdominal',
      'Falta de Ar',
      'Tontura'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Monitoramentos',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: Colors.blue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (_isAddingSymptom) ...[
              const Text(
                'Como você está se sentindo agora?',
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 1, 94, 170)),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: symptoms.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        _addSymptom(symptoms[index]);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(150, 100),
                      ),
                      child: Text(
                        symptoms[index],
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _toggleForm,
                child: const Text(
                  'Cancelar',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ] else ...[
              if (_monitoredSymptoms.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: _monitoredSymptoms.length,
                    itemBuilder: (context, index) {
                      final item = _monitoredSymptoms[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sintoma: ${item['symptom']}',
                              style: const TextStyle(fontSize: 18, color: Colors.blue),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Monitorado em: ${item['dateTime']}',
                              style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 16),
              FloatingActionButton(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                onPressed: _toggleForm,
                child: const Icon(Icons.add),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
