import 'dart:io';

import 'package:shelf_plus/shelf_plus.dart';

void main() => shelfRun(init);

Handler init() {
  var app = Router().plus;

  app.get('/text', () => 'a text');

  app.get('/binary', () => File('data.zip').openRead());

  app.get('/json', () => {'name': 'John', 'age': 42});

  app.get('/class', () => Person('Theo'));

  app.get('/handler', () => typeByExtension('html') >> '<h1>Hello</h1>');

  app.get('/file', () => File('thesis.pdf'));

  return app;
}

class Person {
  final String name;

  Person(this.name);

  // can be generated by tools (i.e. json_serializable package)
  Map<String, dynamic> toJson() => {'name': name};
}