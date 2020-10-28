import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

// LESSON CATEGORY TABLE COLUMNS
const DECK_TABLE = 'deck';
const DECK_ID = 'id';
const DECK_TITLE = 'title';
const DECK_TOTAL_LESSONS = 'total_lessons';
const DECK_LESSONS_COMPLETED = 'lessons_completed';

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
          'CREATE TABLE $DECK_TABLE($DECK_ID INTEGER AUTO_INCREMENT PRIMARY KEY, $DECK_TITLE TEXT, $DECK_TOTAL_LESSONS INTEGER, $DECK_LESSONS_COMPLETED INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertDeck(
    Map<String, dynamic> deck,
  ) async {
    final db = await DbHelper.getDatabase();
    final result = await db.insert(DECK_TABLE, deck);
    print(result);
  }

  static Future<void> completeLesson(String deck) async {
    final db = await DbHelper.getDatabase();
    final result = await db.query(
      '$DECK_TABLE',
      columns: ['$DECK_LESSONS_COMPLETED'],
      where: '$DECK_TITLE = $deck',
    );
    print(result);
  }

  static Future<void> getLessonCompletionInfo(String deck) async {
    final db = await DbHelper.getDatabase();
    final result = await db.query(
      '$DECK_TABLE',
      columns: ['$DECK_TOTAL_LESSONS, $DECK_LESSONS_COMPLETED'],
      where: '$DECK_TITLE = $deck',
    );
    print(result);
  }
}
