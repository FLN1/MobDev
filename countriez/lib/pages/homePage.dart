import 'dart:convert';
import 'package:countriez/models/countries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';

class homePage extends StatelessWidget {
  homePage({
    super.key,
  });

//list of countries
  List<Country> countries = [];
  //getData
  Future getCountries() async {
    Response response = await http
        .get(Uri.parse("https://restcountries.com/v3.1/all?fields=name"));
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    print(jsonData);
    for (var eachCountry in jsonData['name']) {
      final country = Country(
          commonName: eachCountry['common'],
          officialName: eachCountry['official']);
      countries.add(country);
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    getCountries();
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            backgroundColor: Colors.blueGrey[300],
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/settings'),
                    icon: Icon(Icons.settings))
              ],
            ),
            body: FutureBuilder(
                future: getCountries(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: countries.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(countries[index].commonName),
                          subtitle: Text(countries[index].officialName),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
