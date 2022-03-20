import 'package:cloud_firestore/cloud_firestore.dart';

/// 入力したマップの各キーの値を調べて、
/// null のものはエントリーごと除外したマップを返す。
Map<String, dynamic> removeNullValueMapEntries(Map<String, dynamic> m) {
  final nonNullValueMap = <String, dynamic>{};
  m.forEach((key, dynamic value) {
    if (value != null) {
      nonNullValueMap.update(key, (dynamic value) => value);
    }
  });
  return nonNullValueMap;
}

/// 入力したマップの各キーの値を調べて、
/// null のものはエントリーごと除外した上で
/// 'updatedAt': FieldValue.serverTimestamp() のキーバリューを付加したマップを返す。
Map<String, dynamic> processMapToUpdateFirestoreDoc(
  Map<String, dynamic> m, [
  String updateAtFieldName = 'updatedAt',
]) {
  final nonNullValueMap = <String, dynamic>{};
  m.forEach((key, dynamic value) {
    nonNullValueMap[key] = value;
  });
  nonNullValueMap[updateAtFieldName] = FieldValue.serverTimestamp();
  return nonNullValueMap;
}
