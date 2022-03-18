/// 入力したマップの各キーの値を調べて、
/// null のものはエントリーごと除外したしたマップを返す。
Map<String, dynamic> removeNullValueMapEntries(Map<String, dynamic> map) {
  final nonNullValueMap = <String, dynamic>{};
  map.entries.map((e) {
    if (e.value != null) {
      nonNullValueMap[e.key] = e.value;
    }
  });
  return nonNullValueMap;
}
