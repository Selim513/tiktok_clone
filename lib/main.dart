import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok_clone/core/utils/app_route.dart';
import 'package:tiktok_clone/core/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocatorSetup();
  await Supabase.initialize(
    url: 'https://sgulxgoevpmygnebscao.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNndWx4Z29ldnBteWduZWJzY2FvIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0NzE1MzQ2OSwiZXhwIjoyMDYyNzI5NDY5fQ.GvgBH6K84Yaz86_TcRkGm1UFTYybADkS_lF5vPrLvm0',
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
