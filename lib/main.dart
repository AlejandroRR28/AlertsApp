import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Lista de sonidos de emergencia (debes agregar los archivos en assets/audio/)
  final List<Map<String, String>> emergencySounds = [
    {'label': 'Capital de Bangladesh', 'file': 'capitalbangladesh.mp3'},
    {'label': 'Grito', 'file': 'conchetumare.mp3'},
    {'label': 'Frase Extranjera', 'file': 'venecofrase.mp3'},
    {'label': 'Gracias Dios', 'file': 'quebendicion.mp3'},
  ];

  void _playSound(String fileName) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource('audio/$fileName'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 136, 1),
        title: Text('SOUNDS BY ALEJANDRO'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 32),
            const Text(
              'SONIDOS EPICOS',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // <-- 2 columnas
                mainAxisSpacing: 12, // espacio vertical entre botones
                crossAxisSpacing: 12, // espacio horizontal entre botones
                padding: const EdgeInsets.all(20),
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // <-- cuadrados
                      ),
                    ),
                    onPressed: () {
                      // aquí va tu sonido
                    },
                    child: const Text('Capital de Bangladesh'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      // sonido 2
                    },
                    child: const Text('Grito'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      // sonido 3
                    },
                    child: const Text('Frase Extranjera'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      // sonido 4
                    },
                    child: const Text('Gracias Dios'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
