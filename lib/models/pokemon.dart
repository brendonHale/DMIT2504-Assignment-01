class Pokemon {

  static const List<String> _validPokemonTypes = [
    "normal",
    "fire",
    "water",
    "electric",
    "grass",
    "ice",
    "fighting",
    "poison",
    "ground",
    "flying",
    "psychic",
    "bug",
    "rock",
    "ghost",
    "dragon",
    "dark",
    "steel",
    "fairy"
  ];

  late String _name;
  late int _id;
  late double _height;
  late double _weight;
  late int _baseExperience;
  late List<String> _types;
  late DateTime _captureDate;

  Pokemon({
    required String name,
    required int id,
    required double height,
    required double weight,
    required int baseExperience,
    required List<String> types,
    required DateTime captureDate,
    }) {
      this.name = name;
      this.id = id;
      this.height = height;
      this.weight = weight;
      this.baseExperience = baseExperience;
      this.types = types;
      this.captureDate = captureDate;
  }

  factory Pokemon.fromPokeApiData(Map<String, dynamic> json) => Pokemon(
    name: json['name'] as String,
    id: json['id'] as int,
    height: json['height'] / 10 as double,
    weight: json['weight'] / 10 as double,
    baseExperience: json['base_experience'] as int,
    types: (json['types'] as List<dynamic>)
      .map((type) => type['type']['name'] as String)
      .toList(),
    captureDate: DateTime.now()
  );

  void _validatePokemonType (String type) {
    if (!_validPokemonTypes.contains(type)) {
      throw Exception('Invalid Pokemon type: $type');
    }
  }

  @override
  String toString() {
    return "Pokemon: $_name (#$_id), Type(s): $_types, Height: ${_height}m, Weight: ${_weight}kg, Base Experience: $_baseExperience, Captured: ${_captureDate.toString()}";
  }

  String get name {
    return _name;
  }

  set name(String value) {
    if (value.trim().isEmpty) {
      throw Exception('Pokemon name cannot be empty');
    }

    _name = value;
  }

  int get id {
    return _id;
  }

  set id(int value) {
    if (value <= 0) {
      throw Exception('Pokemon ID must be positive');
    }

    _id = value;
  }

  double get height {
    return _height;
  }

  set height(double value) {
    if (value < 0.1 || value > 20.0) {
      throw Exception('Pokemon height must be between 0.1 and 20.0 meters');
    }

    _height = value;
  }

  double get weight {
    return _weight;
  }

  set weight(double value) {
    if (value < 0.1 || value > 1000.0) {
      throw Exception('Pokemon weight must be between 0.1 and 1000.0 kilograms');
    }

    _weight = value;
  }

  int get baseExperience {
    return _baseExperience;
  }

  set baseExperience(int value ) {
    if (value < 1 || value > 1000) {
      throw Exception('Base experience must be between 1 and 1000');
    }

    _baseExperience = value;
  }

  List<String> get types {
    return _types;
  }

  set types(List<String> value) {
    if (value.isEmpty || value.length > 2) {
      throw Exception('Pokemon must have between 1 and 2 types');
    }

    for (String type in value) {
      _validatePokemonType(type);
    }

    _types = value;
  }

  DateTime get captureDate {
    return _captureDate;
  }

  set captureDate(DateTime value) {
    if (value.isAfter(DateTime.now())) {
      throw Exception('Capture date cannot be in the future');
    }

    _captureDate = value;
  }
}