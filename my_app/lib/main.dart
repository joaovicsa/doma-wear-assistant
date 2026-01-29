import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        brightness: Brightness
            .dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      home: const WearAudioPage(),
    );
  }
}

class WearAudioPage extends StatefulWidget {
  const WearAudioPage({super.key});

  @override
  State<WearAudioPage> createState() => _WearAudioPageState();
}

class _WearAudioPageState extends State<WearAudioPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playAlert() async {
    // Alerta de segurança
    await _audioPlayer.play(AssetSource('sounds/relaxing-guitar-loop.mp3'));
  }

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(

          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícone de Localização
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, size: 14, color: Colors.grey),
                  SizedBox(width: 4),
                  Text(
                    "DOMA - UNIDADE 1",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Texto Principal
              const Text(
                "Assistente",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              GestureDetector(
                onTap: _playAlert,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.orange, width: 2),
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 40,
                    color: Colors.orange,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Legenda Inferior (Acessibilidade)
              const Text(
                "Tocar Alerta",
                style: TextStyle(fontSize: 10, color: Colors.orangeAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
