import 'package:bend_reality/src/ui/hand_held/app.dart';
import 'package:bend_reality/src/ui/wear/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: App()));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.width < 300){
      return const WearApp();
    }
    return const HandHeldApp();
  }
}