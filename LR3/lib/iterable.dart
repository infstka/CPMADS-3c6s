import 'entity.dart';

class ShopWorker1 implements Iterable<Assistant>{
  List<Assistant> assistants_ = [];

  ShopWorker1(List<Assistant> assistants) {
    assistants_ = assistants;
  }

  @override
  Iterator<Assistant> get iterator {
    return assistants_.iterator;
  }

  @override
  Iterable<Assistant> take(int count) {
    var hired = 0;
    var hiredAssistants = <Assistant>[];
    for (var assistant in assistants_) {
      if (hired == count) {
        break;
      }
      hiredAssistants.add(assistant);
      hired++;
    }
    return hiredAssistants;
  }


  @override
  bool any(bool Function(Assistant element) test) {
    // TODO: implement any
    throw UnimplementedError();
  }

  @override
  Iterable<R> cast<R>() {
    // TODO: implement cast
    throw UnimplementedError();
  }

  @override
  bool contains(Object? element) {
    // TODO: implement contains
    throw UnimplementedError();
  }

  @override
  Assistant elementAt(int index) {
    // TODO: implement elementAt
    throw UnimplementedError();
  }

  @override
  bool every(bool Function(Assistant element) test) {
    // TODO: implement every
    throw UnimplementedError();
  }

  @override
  Iterable<T> expand<T>(Iterable<T> Function(Assistant element) toElements) {
    // TODO: implement expand
    throw UnimplementedError();
  }



  @override
  Assistant firstWhere(bool Function(Assistant element) test, {Assistant Function()? orElse}) {
    // TODO: implement firstWhere
    throw UnimplementedError();
  }

  @override
  T fold<T>(T initialValue, T Function(T previousValue, Assistant element) combine) {
    // TODO: implement fold
    throw UnimplementedError();
  }

  @override
  Iterable<Assistant> followedBy(Iterable<Assistant> other) {
    // TODO: implement followedBy
    throw UnimplementedError();
  }

  @override
  void forEach(void Function(Assistant element) action) {
    // TODO: implement forEach
  }

  @override
  // TODO: implement isEmpty
  bool get isEmpty => throw UnimplementedError();

  @override
  // TODO: implement isNotEmpty
  bool get isNotEmpty => throw UnimplementedError();



  @override
  String join([String separator = ""]) {
    // TODO: implement join
    throw UnimplementedError();
  }

  @override
  // TODO: implement last
  Assistant get last => throw UnimplementedError();

  @override
  Assistant lastWhere(bool Function(Assistant element) test, {Assistant Function()? orElse}) {
    // TODO: implement lastWhere
    throw UnimplementedError();
  }

  @override
  // TODO: implement length
  int get length => throw UnimplementedError();

  @override
  Iterable<T> map<T>(T Function(Assistant e) toElement) {
    // TODO: implement map
    throw UnimplementedError();
  }

  @override
  Assistant reduce(Assistant Function(Assistant value, Assistant element) combine) {
    // TODO: implement reduce
    throw UnimplementedError();
  }

  @override
  // TODO: implement single
  Assistant get single => throw UnimplementedError();

  @override
  Assistant singleWhere(bool Function(Assistant element) test, {Assistant Function()? orElse}) {
    // TODO: implement singleWhere
    throw UnimplementedError();
  }

  @override
  Iterable<Assistant> skip(int count) {
    // TODO: implement skip
    throw UnimplementedError();
  }

  @override
  Iterable<Assistant> skipWhile(bool Function(Assistant value) test) {
    // TODO: implement skipWhile
    throw UnimplementedError();
  }

  @override
  Iterable<Assistant> takeWhile(bool Function(Assistant value) test) {
    // TODO: implement takeWhile
    throw UnimplementedError();
  }

  @override
  List<Assistant> toList({bool growable = true}) {
    // TODO: implement toList
    throw UnimplementedError();
  }

  @override
  Set<Assistant> toSet() {
    // TODO: implement toSet
    throw UnimplementedError();
  }

  @override
  Iterable<Assistant> where(bool Function(Assistant element) test) {
    // TODO: implement where
    throw UnimplementedError();
  }

  @override
  Iterable<T> whereType<T>() {
    // TODO: implement whereType
    throw UnimplementedError();
  }

  @override
  // TODO: implement first
  Assistant get first => throw UnimplementedError();

}