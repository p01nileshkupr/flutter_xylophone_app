import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Play a sound file..
void playSound(String soundName) async {
  final player = AudioPlayer();
  await player.play(AssetSource(soundName));

  if (kDebugMode) {
    print('$soundName is played.');
  }
}

//List of MaterialColor
List<MaterialColor> colors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.teal,
  Colors.blue,
  Colors.purple
];

// Create Material buttons list
List<Widget> generateButtons() {
  List<Widget> list = [];
  int i = 1;

  while (i < colors.length + 1) {
    list.add(buildExpandedWidget(i));
    i++;
  }
  return list;
}

// Create Expanded widget with MaterialButton
Expanded buildExpandedWidget(int index) {
  return Expanded(
    child: MaterialButton(
      color: colors.elementAt(index - 1),
      onPressed: () {
        playSound('note$index.wav');
      },
    ),
  );
}

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone Project',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Text('Xylophone'),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: generateButtons(),
          ),
        ),
      ),
    );
  }
}
