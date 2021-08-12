// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedStore on _FeedStore, Store {
  final _$responseAtom = Atom(name: '_FeedStore.response');

  @override
  FeedResponse? get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(FeedResponse? value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  final _$errorAtom = Atom(name: '_FeedStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_FeedStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getFeedAsyncAction = AsyncAction('_FeedStore.getFeed');

  @override
  Future<dynamic> getFeed() {
    return _$getFeedAsyncAction.run(() => super.getFeed());
  }

  @override
  String toString() {
    return '''
response: ${response},
error: ${error},
isLoading: ${isLoading}
    ''';
  }
}
