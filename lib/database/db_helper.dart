import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

// LESSON CATEGORY TABLE COLUMNS
const LC_TABLE = 'lesson_category';
const LC_ID = 'id';
const LC_TITLE = 'title';
const LC_TOTAL_LESSONS = 'total_lessons';
const LC_LESSONS_COMPLETED = 'lessons_completed';

class DbHelper {
  static Future<Database> getDatabase() async {
    // GET THE PLACE ON THE DEVICE WHERE THE DATABASES SHOULD BE STORED
    final dbPath = await sql.getDatabasesPath();
    // OPENS THE DATABASE IF IT ALREADY EXISTS OR CREATES IT, IF IT DOESN'T
    // RETURN THE FUTURE OF openDatabase
    return sql.openDatabase(
      path.join(dbPath, 'izi_english_now.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $LC_TABLE($LC_ID INTEGER AUTO_INCREMENT PRIMARY KEY, $LC_TITLE TEXT, $LC_TOTAL_LESSONS INTEGER, $LC_LESSONS_COMPLETED INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertLessonCategory(
    Map<String, dynamic> lessonCategory,
  ) async {
    final db = await DbHelper.getDatabase();
    final result = await db.insert(LC_TABLE, lessonCategory);
    print(result);
  }

  static Future<void> completeLesson(String lessonCategory) async {
    final db = await DbHelper.getDatabase();
    final result = await db.query(
      '$LC_TABLE',
      columns: ['$LC_LESSONS_COMPLETED'],
      where: '$LC_TITLE = $lessonCategory',
    );
    print(result);
  }

  static Future<void> getLessonCompletionInfo(String lessonCategory) async {
    final db = await DbHelper.getDatabase();
    final result = await db.query(
      '$LC_TABLE',
      columns: ['$LC_TOTAL_LESSONS, $LC_LESSONS_COMPLETED'],
      where: '$LC_TITLE = $lessonCategory',
    );
    print(result);
  }
}
