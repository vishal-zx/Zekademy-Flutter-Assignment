import 'package:http/http.dart' as http;
import 'package:zekademy/models/person.dart';

Future<List<Person>> getPeople() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (response.statusCode == 200) {
    return Person.listFromJson(response.body);
  } else {
    throw Exception('Failed to load people');
  }
}