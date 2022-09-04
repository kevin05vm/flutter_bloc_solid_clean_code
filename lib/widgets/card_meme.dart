import 'package:flutter/material.dart';

import 'package:flutter_bloc_solid_clean_code/models/meme.dart';

class CardMeme extends StatelessWidget {
  final Meme meme;
  const CardMeme({required this.meme, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Card(
        clipBehavior: Clip.antiAlias,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0)
        ),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          HeaderCard(meme),
          BodyCard(meme),
          FooterCard(meme)
        ]
      )
    );
  }
}

class HeaderCard extends StatelessWidget {
  final Meme meme;
  const HeaderCard(this.meme, { Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var styleTitle = const TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold);
    var styleSubtitle = TextStyle(fontSize: 15.0, color: Colors.grey[600], fontWeight: FontWeight.bold);   
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image(
              image: NetworkImage(meme.url),
              height: 50.0,
              width: 50.0,
              fit: BoxFit.cover
            ),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(meme.name, style: styleTitle),
                  Text('@GuyIt', style: styleSubtitle)
                ]
              )
            )
          ) 
        ]
      )
    );
  }
}

class BodyCard extends StatelessWidget {
  final Meme meme;
  const BodyCard(this.meme, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16/9,
      child: Image(
        image: NetworkImage(meme.url),
        fit: BoxFit.cover
      )
    );
  }
}

class FooterCard extends StatelessWidget {
  final Meme meme;
  const FooterCard(this.meme, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var styleIdText = const TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold);   
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('#${meme.id}', style: styleIdText)
    );
  }
}