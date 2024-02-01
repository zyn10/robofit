import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

import 'package:robofit/home/home.dart';
import 'package:robofit/provider/user_provider.dart';
import 'package:robofit/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: '',
        appId: '',
        messagingSenderId: '',
        projectId: '',
        storageBucket: '',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => UserProvider(),
            ),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Robofit',
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return const Home();
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  );
                }
                return const SplashScreen();
              },
            ),
          ),
        );
      },
    );
  }
}
