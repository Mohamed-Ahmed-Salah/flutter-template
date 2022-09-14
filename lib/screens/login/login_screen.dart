import 'package:flutter/material.dart';

import '../../config/route/route_constants.dart';
import '../../constants.dart';
import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    print('building authentication');

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: largehorizantolPadding,vertical: largeVerticalPadding),
        child: Column(
          children: [
          /*  TextField(),
            Container(height: 20,),

            TextFormField(),
            Container(height: 20,),*/
            LogInForm(formKey: _formKey),
            const SizedBox(
              height: largeVerticalPadding,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(
                      context,
                    page1ScreenRoute,
                     );
                }
              },
              child: const Text("Log in"),
            ),
          ],
        ),
      ),
    );
  }
}
