import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _filterDistance = prefs.getDouble('ff_filterDistance') ?? _filterDistance;
    });
    _safeInit(() {
      _filterSelection =
          prefs.getString('ff_filterSelection') ?? _filterSelection;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  double _filterDistance = 5.0;
  double get filterDistance => _filterDistance;
  set filterDistance(double value) {
    _filterDistance = value;
    prefs.setDouble('ff_filterDistance', value);
  }

  String _filterSelection = 'Most Recent';
  String get filterSelection => _filterSelection;
  set filterSelection(String value) {
    _filterSelection = value;
    prefs.setString('ff_filterSelection', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
