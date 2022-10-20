import 'dart:async';
import 'package:flash_meteo/models/country_model/country_model.dart';
import 'package:flash_meteo/utils/request_extention.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import '../models/loading.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String Nomafficher = "";
  String Nomafficher2 = "";
  final TextEditingController CityName = TextEditingController();

  void afficheVille() async {
    Nomafficher = CityName.text;
    Nomafficher2 = await restcountries(Nomafficher);

    setState(() {
      restcountries(Nomafficher);

      print('AAAAAAAASSSSSSSSSDDDDDDDDDDD');
      print(Nomafficher2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Country App"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 15.0,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/worldT.png"),
                  TextField(
                    controller: CityName,
                    decoration: InputDecoration(labelText: 'CityName'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'la capital est $Nomafficher2',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: afficheVille,
          tooltip: 'Increment',
          child: const Icon(Icons.web),
          focusColor: Colors.amber,
          hoverColor: Colors.red,
          elevation: 0.0,
        ));
  }

  Stream<Loading> get loadingCountryStream => _loadingCountrySubject.stream;
  final _loadingCountrySubject = BehaviorSubject<Loading>();
  restcountries(String CityName) async {
    RequestExtension<Country> requestExtension = RequestExtension();
    _loadingCountrySubject.add(Loading(
      loading: true,
      message: "loading",
    ));

    String retour = "";
    Country response = await requestExtension.get(CityName);

    print(CityName);
    print(
        "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    retour = (response.capital!.first);
    return retour;
  }
}
