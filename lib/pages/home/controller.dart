import 'package:get/get.dart';

import 'package:sqflite/sqflite.dart';
import 'package:test_error/db/db_helper.dart';

import '../../models/note.dart';


class HomeController extends GetxController {
  Database db = DbHelper.getDb();

  RxBool isLoading = false.obs;
  late List<Note> notes;

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  void getNotes() async {
    isLoading.value = true;
    List<Map<String, dynamic>> mapNotes = await db.query("notes");
    notes = mapNotes.map((e) => Note.fromMap(map: e)).toList();
    isLoading.value = false;
  }

  void createNote() async {
    var newNote = await Get.toNamed("/create");
    newNote = newNote as Note?;

    if(newNote != null) {
      await db.insert("notes", newNote.toMap());
      getNotes();
    }
  }

  void deleteNote(int id) async {
    db.delete("notes", where: "id = ?", whereArgs: [id]);
    getNotes();
  }

    void editNote(int index) async {
    print(index);
    var newNote = await Get.toNamed("/create", arguments: notes[index]);
    newNote = newNote as Note?;

    if(newNote != null) {
      await db.update("notes", newNote.toMap(),
        where: "id = ?", whereArgs: [newNote.id]);
      getNotes();
    }
  }
}