import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('building page 3');

    Future<String> future()async{
     await  Future.delayed(const Duration(seconds: 1));
      return 'done';
    }
    return  Scaffold(
      body: FutureBuilder<String>(
          future: future(),
        builder: (BuildContext context,AsyncSnapshot<String>snapshot) {
            if(snapshot.hasData){
              return Center(
                child: Text('${snapshot.data}'),
              );
            }else if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator( color: Colors.red,));
            }else{
              return const Text('snapshot');
            }

        }
      ),
    );
  }
}
