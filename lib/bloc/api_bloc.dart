import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiBloc {
  final _apiFetcher = PublishSubject<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get api => _apiFetcher.stream;

  fetchApiData() async {
    final response = await http.get(Uri.parse(
        "https://api.github.com/search/users?q=followers%3A%3E%3D1000&ref=searchresults&s=followers&type=Users"));
    final data = jsonDecode(response.body);
    _apiFetcher.sink.add(data);
  }

  dispose() {
    _apiFetcher.close();
  }
}
