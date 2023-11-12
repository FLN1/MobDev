import 'package:flutter/material.dart';
import 'package:countriez/components/logoutButton.dart';

class settingsPage extends StatelessWidget {
  const settingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //log out user
    logOutProcess() {
      Navigator.pushReplacementNamed(context, '/login');
    }

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
                icon: Icon(Icons.arrow_back))
          ],
        ),
        backgroundColor: Colors.blueGrey[300],
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Icon(
                  Icons.map_outlined,
                  size: 100,
                ),
                SizedBox(height: 50),
                Text('CountriEZ',
                    style: TextStyle(fontSize: 35, color: Colors.black54)),
                const SizedBox(height: 20),
                logoutButton(
                  onTap: logOutProcess,
                )
              ],
            ),
          ),
        ));
  }
}
