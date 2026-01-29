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
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      theme: ThemeData(
        brightness: Brightness
            .dark, // Smartwatches usam fundo preto para economizar bateria
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
    // Alerta de segurança conforme o roteiro da empresa Doma
    await _audioPlayer.play(AssetSource('sounds/relaxing-guitar-loop.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    // Pegamos o tamanho da tela para garantir que o conteúdo caiba no círculo
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          // Garante que o conteúdo não encoste nas bordas físicas do relógio
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícone de Localização/Status (como na sua imagem)
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

              // Texto Principal (Destaque)
              const Text(
                "Assistente",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              // Botão de Ação Circular e Grande (Ideal para Wear OS)
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
