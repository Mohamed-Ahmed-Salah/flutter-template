import 'package:flutter/material.dart';
import 'package:flutter_template/repository/test%20repo/post_change_provider.dart';
import 'package:provider/provider.dart';

import '../../models/post.dart';
import '../../repository/test repo/fake_repo.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  /*init() async {
    print('help');
    postFuture = postService.getOnePost();
  }*/

  //Future<Post?> postFuture =await postService.getOnePost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Error Handling',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: Column(
        children: [
          Consumer<PostChangeNotifier>(
            builder: (_, notifier, __) {
              if (notifier.state == NotifierState.initial) {
                return const Text('Press the button 👇');
              } else if (notifier.state == NotifierState.loading) {
                return const CircularProgressIndicator();
              } else {
                return notifier.post.fold(
                      (failure) => Text(failure.toString()),
                      (post) => Text(post.toString()),
                );
               /* if (notifier.failure != null) {
                  return Text(notifier.failure.toString());
                } else {
                  return Text(notifier.post.toString());
                }*/
              }
            },
          ),
          ElevatedButton(
            child: const Text('Get Post'),
            onPressed: () async {
              Provider.of<PostChangeNotifier>(context,listen: false).getOnePost();
            },
          ),
        ],
      ),
    );
  }
}
