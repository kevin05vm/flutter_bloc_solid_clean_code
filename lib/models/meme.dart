import 'dart:convert';

Response responseFromMap(String response) => Response.fromMap(json.decode(response));

String responseToMap(Response response) => json.encode(response.toMap());

class Response {

  final Data data;
  final bool success;

  Response({
    required this.data,
    required this.success
  });

  factory Response.fromMap(Map<String, dynamic> json) => Response(
    data    : Data.fromMap(json["data"]),
    success : json["success"]
  );

  Map<String, dynamic> toMap() => {
    "data"    : data.toMap(),
    "success" : success
  };
}

class Data {

  final List<Meme> memes;

  Data({required this.memes});

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    memes: List<Meme>.from(json["memes"].map((x) => Meme.fromMap(x)))
  );

  Map<String, dynamic> toMap() => {
    "memes": List<dynamic>.from(memes.map((x) => x.toMap()))
  };
}

class Meme {

  final int boxCount;
  final int height;
  final String id;
  final String name;
  final String url;
  final int width;

  Meme({
    required this.boxCount,
    required this.height,
    required this.id,
    required this.name,
    required this.url,
    required this.width
  });


  factory Meme.fromMap(Map<String, dynamic> json) => Meme(
    boxCount : json["box_count"],
    height   : json["height"],
    id       : json["id"],
    name     : json["name"],
    url      : json["url"],
    width    : json["width"]
  );

  Map<String, dynamic> toMap() => {
    "box_count" : boxCount,
    "height"    : height,
    "id"        : id,
    "name"      : name,
    "url"       : url,
    "width"     : width
  };
}