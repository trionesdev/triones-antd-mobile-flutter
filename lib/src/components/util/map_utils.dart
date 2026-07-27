class MapUtils {
  static dynamic getPathValue(Map<dynamic, dynamic?>? map,
      List<dynamic>? keys) {
    if (map == null || keys == null || keys.isEmpty) {
      return null;
    }
    dynamic cloneValues = map;
    for (int i = 0; i < keys.length - 1; i++) {
      final key = keys.elementAt(i);
      if (cloneValues is Map) {
        cloneValues = cloneValues[key];
      } else if (cloneValues is List && key is int) {
        if (key < 0 || key >= cloneValues.length) {
          return null;
        }
        cloneValues = cloneValues[key];
      } else {
        return null;
      }
      if (cloneValues == null) {
        return null;
      }
    }
    final lastKey = keys.last;
    if (cloneValues is Map) {
      return cloneValues[lastKey];
    }
    if (cloneValues is List && lastKey is int) {
      if (lastKey < 0 || lastKey >= cloneValues.length) {
        return null;
      }
      return cloneValues[lastKey];
    }
    return null;
  }

  static Map<dynamic, dynamic?> setPathValue(
    Map<dynamic, dynamic>? map,
    List<dynamic> keys,
    dynamic value,
  ) {
    if (map == null || keys.isEmpty) {
      return map ?? {};
    }
    dynamic current = map;

    for (int i = 0; i < keys.length - 1; i++) {
      final key = keys[i];
      final nextKey = keys[i + 1];
      final nextContainer =
          (nextKey is int) ? <dynamic>[] : <dynamic, dynamic>{};

      if (current is Map) {
        dynamic next = current[key];
        if (next == null) {
          next = nextContainer;
          current[key] = next;
        }
        current = next;
      } else if (current is List && key is int) {
        while (current.length <= key) {
          current.add(null);
        }
        dynamic next = current[key];
        if (next == null) {
          next = nextContainer;
          current[key] = next;
        }
        current = next;
      } else {
        return map;
      }
    }

    final lastKey = keys.last;
    if (current is Map) {
      current[lastKey] = value;
    } else if (current is List && lastKey is int) {
      while (current.length <= lastKey) {
        current.add(null);
      }
      current[lastKey] = value;
    }
    return map;
  }

  /// 将Map转换为扁平化Map
  static Map<String, dynamic?> flattenMap(Map<dynamic, dynamic> map) {
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
