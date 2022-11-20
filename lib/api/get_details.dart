import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zekademy/models/person.dart';

Future<Person> getDetails(id) async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));
  if (response.statusCode == 200) {
    return Person.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load people');
  }
}