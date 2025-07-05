import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qansa/providers/home/home_provider.dart';
import 'package:qansa/widgets/consumer_state_data/consumer_state_data.dart';

import '../../../providers/memes/get_memes_provider.dart';
import '../../../widgets/card_memes/card_memes.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<HomeProvider>().refresh();
      },
      child: ConsumerStateData<HomeProvider>(
        state: context.watch<HomeProvider>().stateGetMemems!,
        message: context.watch<HomeProvider>().msgGetMemems,
        enumValue: ResultGetMemesState.values,
        builder: (context, homeProv, _) {
          var memesData = homeProv.memesData;

          if (memesData.isNotEmpty) {
            return CustomScrollView(
              slivers: [
                SliverGrid.builder(
                  itemCount: memesData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return CardMemes(
                      press: () {
                        homeProv.goToDetail(data: memesData[index]);
                      },
                      memesData: memesData[index],
                    );
                  },
                ),
              ],
            );
          } else {
            return Center(child: Text('Empty'));
          }
        },
      ),
    );
  }
}
