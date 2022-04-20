import 'package:birdeye_task/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/connection_loss.png"),
                ),
              ),
            ),
            Text(
              "No Internet Connection",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).errorColor,
              ),
            ),
            InkWell(
              onTap: () {
                Provider.of<HomeVM>(context, listen: false)
                  ..checkInternetConnected()
                  ..getAllAlbum();
              },
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Check Internet",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
