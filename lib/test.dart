import 'package:supabase_flutter/supabase_flutter.dart';

void testSupabase() async {
  final response = await Supabase.instance.client
      .from('Fruit')
      .select()
      .limit(1);
  print(response);
}