class News {
  late String id, title, body, img;
  News(this.id, this.title, this.body, this.img);
  tojson() {
    return {
      'id': id,
      'title': title,
      'content': body,
      'urlToImage': img,
    };
  }
  News.fromjson(Map<String, dynamic> json) {
    id = json["source"]['id'] ?? '';
    title = json['title'] ?? '';
    body = json['content'] ?? '';
    img = json['urlToImage'] ?? '';
  }
}
