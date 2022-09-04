import 'package:http/http.dart' as http;

import 'package:flutter_bloc_solid_clean_code/models/meme.dart';

abstract class MemesProvider {
  Future<List<Meme>> getMemes() async => <Meme>[];
}

class ApiMemeService implements MemesProvider {
  @override
  Future<List<Meme>> getMemes() async {
    final response = await http.get(Uri.http('api.imgflip.com', 'get_memes'));
    if (response.statusCode != 200) throw Exception("Error in api.imgflip.com");
    final dataMap = responseFromMap(response.body);
    return dataMap.data.memes;
  }
}

class LocalMemeService implements MemesProvider {
  @override
  Future<List<Meme>> getMemes() async {
    final List<Meme> memes = <Meme>[];
    final meme = Meme(
      id       : '181913649',
      name     : 'Drake Hotline Bling',
      url      : 'https://i.imgflip.com/30b1gx.jpg',
      width    : 1200,
      height   : 1200,
      boxCount : 2);
    memes.add(meme);
    return memes;
  }
}