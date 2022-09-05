import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_solid_clean_code/bloc/home/home_bloc.dart';
import 'package:flutter_bloc_solid_clean_code/router/app_router.dart';
import 'package:flutter_bloc_solid_clean_code/utils/colors_app.dart';
import 'package:flutter_bloc_solid_clean_code/widgets/card_meme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      appBar: AppBar(
        backgroundColor: colorAppBar, 
        title: const Text('Meme App')
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (_, homeState) {
          if (homeState is HomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (homeState is HomeLoadMemesState) {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Placeholder(fallbackHeight: 200)
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        child: CardMeme(meme: homeState.memes[index]),
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.routeDetail);
                        }
                      );
                    }, 
                    childCount: homeState.memes.length
                  )
                )
              ]
            );
          }
          return const Center(child: Text('Error Api....'));
        }
      )
    );
  }
}
