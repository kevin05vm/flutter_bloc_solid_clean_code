import 'package:flutter_bloc_solid_clean_code/models/meme.dart';

import 'package:flutter_bloc_solid_clean_code/repository/memes_provider.dart';

class MemesRepository {

  late MemesProvider memesProvider; 
        
  MemesRepository(this.memesProvider);

  Future<List<Meme>>getMemes() async {
    return await memesProvider.getMemes();
  }

}