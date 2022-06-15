import 'package:news_app/Models/sqldb.dart';

import '../Screens/newss.dart';

class Database {
  static Sql sqlDb = Sql();
  static Future<List<NewsData>> readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM news");
    List<NewsData> data = [];
    for (int i = 0; i < response.length; i++) {
      NewsData news = NewsData(
          id: response[i]['id'],
          news: response[i]['new'] ?? '',
          question: response[i]['question'] ?? '',
          answer: response[i]['answer'] ?? '',
          image: response[i]['image'] ?? '');
      data.add(news);
    }
    return data;
  }
}
