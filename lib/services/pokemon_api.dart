import 'package:http/http.dart' as http;
import 'dart:convert';

const String pokemonEndpoint = 'https://pokeapi.co/api/v2/pokemon';

Future<dynamic> getPokemonByName({required String pokemonName}) async {
  final uri = Uri.parse('$pokemonEndpoint/${Uri.encodeComponent(pokemonName)}');

  final http.Response response;

  try {
    response = await http.get(uri);
  } on Exception catch (e) {
    throw Exception('There was a problem with the request: ${e}');
  }

  if (response.statusCode != 200) {
    throw Exception(
      'There was a problem with the request: status ${response.statusCode} received'
    );
  }

  return jsonDecode(response.body);
}

