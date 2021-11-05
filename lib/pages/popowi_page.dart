import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/providers/popowi_provider.dart';

class PopowiPage extends StatelessWidget {
  const PopowiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AudioCache audioCache = AudioCache();
    AudioPlayer audioPlayer = AudioPlayer();

    return SafeArea(
      child: ChangeNotifierProvider<PopowiProvider>(
        create: (context) => PopowiProvider(),
        builder: (context, _) {
          debugPrint('rebuild');
          return Scaffold(
            backgroundColor: Colors.red,
            body: Listener(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    Consumer<PopowiProvider>(
                      builder: (context, popowiState, _) => Text(
                        "Score: ${popowiState.score}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Consumer<PopowiProvider>(
                        builder: (context, popowiState, _) => Image.network(
                          popowiState.isShock
                              ? "https://i.postimg.cc/dZ1ScRZW/u.png"
                              : "https://i.postimg.cc/JhTM6rh9/u.png",
                          width: MediaQuery.of(context).size.width - 64,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              onPointerDown: (event) {
                context.read<PopowiProvider>().toggle();
                context.read<PopowiProvider>().increment();

                audioPlayer.stop();
                audioCache
                    .play("audio/kaget.wav")
                    .then((value) => audioPlayer = value);
              },
              onPointerUp: (event) {
                context.read<PopowiProvider>().toggle();
              },
            ),
          );
        },
      ),
    );
  }
}
