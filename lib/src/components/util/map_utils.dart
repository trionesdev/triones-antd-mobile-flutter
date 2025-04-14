class MapUtils {
  static dynamic getPathValue(Map<dynamic, dynamic>? map, List<dynamic>? path) {
    Map<dynamic, dynamic>? cloneValues = map;
    for (int i = 0; i < (path?.length ?? 0); i++) {
      if (i < path!.length - 1) {
        if (cloneValues![path.elementAt(i)] == null) {
          return null;
        } else {
          cloneValues = cloneValues[path.elementAt(i)];
        }
      } else {
        return cloneValues![path.elementAt(i)];
      }
    }
  }

  static Map<dynamic, dynamic> setPathValue(
      Map<dynamic, dynamic>? map, List<dynamic>? path, dynamic value) {
    Map<dynamic, dynamic> cloneMap = map ?? {};
    Map<dynamic, dynamic> tempMap = cloneMap;
    for (int i = 0; i < (path?.length ?? 0); i++) {
      if (i < path!.length - 1) {
        tempMap = tempMap[path.elementAt(i)] ?? {};
      } else {
        tempMap[path.elementAt(i)] = value;
      }
    }
    return cloneMap;
  }

  /// 将Map转换为扁平化Map
  static Map<String,dynamic> flattenMap(Map<dynamic,dynamic> map){
    Map<String,dynamic> result = {};

    void loopMap(List<String> upKeys,Map<dynamic,dynamic> currentMap){
      for(final MapEntry<dynamic, dynamic> entry in currentMap.entries){
        String key =entry.key.toString();
        List<String> currentKeys = [...upKeys,key];
        result[currentKeys.join('.')] = entry.value;
        if(entry.value is Map){
          loopMap(currentKeys,entry.value);
        }
      }
    }
    loopMap([], map);
    return result;
  }

}
