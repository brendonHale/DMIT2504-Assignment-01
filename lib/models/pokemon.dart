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

  String _name;
  int _id;
  double _height;
  double _weight;
  int _baseExperience;
  List<String> _types;
  DateTime _captureDate;

  Pokemon({
    required this._name,
    required this._id,
    required this._height,
    required this._weight,
    required this._baseExperience,
    required this._types,
    required this._captureDate
  });

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
    if (value < 0) {
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
      if (!_validPokemonTypes.contains(type)) {
        throw Exception('Invalid Pokemon type: <$type>');
      }
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