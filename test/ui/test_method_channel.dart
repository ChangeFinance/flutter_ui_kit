import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

final _log = <MethodCall>[];
final _responses = <MethodCallStubbing, dynamic>{};

void setUpTestMethodChannel(String methodChannel,
    [MethodCodec codec = const StandardMethodCodec()]) {
  debugPrint('Setting up test method channel $methodChannel');
  final channel = MethodChannel(methodChannel, codec);
  channel.setMockMethodCallHandler((methodCall) async {
    _log.add(methodCall);
    final matchingStubbing = _responses.keys
        .firstWhere((s) => s.matches(methodCall), orElse: () => null);
    if (matchingStubbing != null) {
      return _responses[matchingStubbing];
    }
  });
  addTearDown(() {
    debugPrint('Tearing down test method channel $methodChannel');
    _log.clear();
    _responses.clear();
  });
}

class MethodCallStubbing {
  final Matcher nameMatcher;
  final Matcher argMatcher;

  const MethodCallStubbing(this.nameMatcher, this.argMatcher);

  void thenReturn(dynamic answer) {
    _responses[this] = answer;
  }

  bool matches(MethodCall methodCall) {
    return nameMatcher.matches(methodCall.method, null) &&
        argMatcher.matches(methodCall.arguments, null);
  }
}

MethodCallStubbing whenMethodCall(Matcher nameMatcher, Matcher argMatcher) {
  return MethodCallStubbing(nameMatcher, argMatcher);
}

void expectMethodCall(String name, {Map<String, Object> arguments}) {
  final methodCall = _log.firstWhere((call) => call.method == name, orElse: () {
    fail('No call found for $name, all calls $_log');
  });

  expect(
    methodCall,
    isMethodCall(name, arguments: arguments),
  );
}
