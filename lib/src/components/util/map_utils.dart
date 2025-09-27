class MapUtils {
  static dynamic getPathValue(Map<dynamic, dynamic>? map, List<dynamic> keys) {
    Map<dynamic, dynamic>? cloneValues = map;
    for (int i = 0; i < keys.length; i++) {
      if (i < keys.length - 1) {
        if (cloneValues![keys.elementAt(i)] == null) {
          return null;
        } else {
          cloneValues = cloneValues[keys.elementAt(i)];
        }
      } else {
        return cloneValues![keys.elementAt(i)];
      }
    }
  }

  static Map<dynamic, dynamic> setPathValue(
    Map<dynamic, dynamic>? map,
    List<dynamic> keys,
    dynamic value,
  ) {
    dynamic cloneMap = map;
    dynamic current = cloneMap;

    for(int i=0;i<keys.length-1;i++){
      final key = keys.elementAt(i);
      current = current[key];
      current ??= (keys[i+1] is String)? {}:[];
    }
    current[keys.last] = value;
    return cloneMap;
  }

  /// 将Map转换为扁平化Map
  static Map<String, dynamic> flattenMap(Map<dynamic, dynamic> map) {
    Map<String, dynamic> result = {};

    void loopMap(List<String> upKeys, Map<dynamic, dynamic> currentMap) {
      for (final MapEntry<dynamic, dynamic> entry in currentMap.entries) {
        String key = entry.key.toString();
        List<String> currentKeys = [...upKeys, key];
        result[currentKeys.join('.')] = entry.value;
        if (entry.value is Map) {
          loopMap(currentKeys, entry.value);
        }
      }
    }

    loopMap([], map);
    return result;
  }
}
