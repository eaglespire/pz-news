class Article {
  String? author;
  String? description;
  String? title;
  String? urlToImage;
  String? content;
  String? publishDate;

  Article(
      {this.author,
      this.content,
      this.description,
      this.publishDate,
      this.title,
      this.urlToImage});

  factory Article.fromJson(Map<String, dynamic> article) {
    return Article(
        author: article['author'],
        content: article['content'],
        description: article['description'],
        publishDate: article['publishDate'],
        title: article['title'],
        urlToImage: article['urlToImage']);
  }
}
