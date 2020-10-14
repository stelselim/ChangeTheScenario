import 'package:shared_preferences/shared_preferences.dart';

const favoriteKey = "Favorites";

Future addToScenarioToBookMark(String docId) async {
  final instance = await SharedPreferences.getInstance();
  List<String> list = instance.getStringList(favoriteKey);
  if (list == null) {
    list = [docId];
    await instance.setStringList(favoriteKey, list);
  } else {
    list.add(docId);
    await instance.setStringList(favoriteKey, list);
  }
  print(list);
}

Future deleteFromScenarioToBookMark(String docId) async {
  final instance = await SharedPreferences.getInstance();
  List<String> list = instance.getStringList(favoriteKey);
  if (list == null) {
    return null;
  } else {
    list.remove(docId);
    await instance.setStringList(favoriteKey, list);
  }
  print(list);
}

Future<List<String>> getFavoritesDoc() async {
  final instance = await SharedPreferences.getInstance();
  List<String> list = instance.getStringList(favoriteKey);
  // print("Bura " + list.toString());
  if (list == null) return null;
  List<String> docList = [];
  list.forEach((docId) {
    docList.add(docId);
  });
  return docList;
}

Future<bool> isFavoritedPost(String docId) async {
  final instance = await SharedPreferences.getInstance();
  List<String> list = instance.getStringList(favoriteKey);
  if (list == null) return false;
  if (list.contains(docId)) {
    return true;
  } else {
    return false;
  }
}

Future<void> deleteAllBookmarks() async {
  final instance = await SharedPreferences.getInstance();
  await instance.setStringList(favoriteKey, []);
}
