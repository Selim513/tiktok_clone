import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://sgulxgoevpmygnebscao.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNndWx4Z29ldnBteWduZWJzY2FvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDcxNTM0NjksImV4cCI6MjA2MjcyOTQ2OX0.Dk0P9ewFDG8UUtmDMid68bV8TVbWMV1SZWieTemJiYQ',
  );

  runApp(const MainApp());
  //-------------
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(),
      debugShowCheckedModeBanner: false,
      // home: CustomBottomNavBar(),
      routerConfig: AppRouter.router,
    );
  }
}
