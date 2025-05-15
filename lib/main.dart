import 'package:flutter/material.dart';
import 'package:laptrinhtbdd/test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'page_home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();

  await Supabase.initialize(
    url: "https://dvjhbfbupeeambvhmxso.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR2amhiZmJ1cGVlYW1idmhteHNvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYzNDg4MDQsImV4cCI6MjA2MTkyNDgwNH0.fkHOYGm2174QxAAC8K6BIXxarRyAZAX01Tu5uMxqw8A",
  );
  // testSupabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      // home: PageGridView(),
      home: const PageHome(),
    );
  }
}

