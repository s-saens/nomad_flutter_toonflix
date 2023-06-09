import 'package:flutter/material.dart';
import 'package:nomad_toonflix/controllers/webtoon_getter.dart';
import '/models/webtoon.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Future<List<Webtoon>> _webtoons = WebtoonGetter.getTodayWebtoons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Webtoon>>(
        future: _webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return makeList(snapshot);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<Webtoon>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        Webtoon webtoon = snapshot.data![index];
        return ListTile(
          title: Text(webtoon.title),
          subtitle: Text(webtoon.id),
          leading: getImage(webtoon.thumb),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }

  Widget getImage(String url) {
    try {
      return Image.network(
        url,
        headers: const {
          "User-Agent":
              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
        },
      );
    } catch (e) {
      return const Icon(Icons.image);
    }
  }
}
