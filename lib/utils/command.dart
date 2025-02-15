import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:client/utils/results.dart';

typedef CommandAction0<T> = Future<Result<T>> Function();

abstract class Command<T> extends ChangeNotifier {
  bool _running = false;
  bool get running => _running;

  Result<T>? _result;
  bool get error => _result is Error;
  bool get completed => _result is Ok;
  Result<T>? get result => _result;

  void clearResult() {
    _result = null;
    notifyListeners();
  }

  Future<void> _execute(CommandAction0<T> action) async {
    if (_running) return;
    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class Command0<T> extends Command<T> {
  Command0(this._action);
  final CommandAction0<T> _action;

  Future<void> execute() async {
    await _execute(_action);
  }
}
