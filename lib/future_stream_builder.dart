import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
StreamController streamController;

class Country {
  final String name;
  final String capital;
  final String subregion;
  final int population;
  final String flag;

  Country(this.name, this.capital, this.subregion, this.population, this.flag);

  factory Country.fromJson(dynamic json) {
    return Country(
        json['name'] as String,
        json['capital'] as String,
        json['subregion'] as String,
        json['population'] as int,
        json['flag'] as String
    );
  }
}

Future<List<Country>> getInfoGitUser() async {
  // throw "error";
  Dio dio = Dio();
  // dio.interceptors.add(LogInterceptor(responseBody: true));
  final response = await dio.get("https://restcountries.eu/rest/v2/region/asia?fields=name;capital;subregion;population;flag");
  return parseCountrys(response.data);
}

List<Country> parseCountrys(List responseBody) {
  print(responseBody);
  List<Country> x = responseBody.map<Country>((json) => Country.fromJson(json)).toList();
  print(x);
  return x;
}

class CountrysList extends StatelessWidget {
  final List<Country> countrys;

  CountrysList({Key key, this.countrys}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: countrys.length,
          itemBuilder: (context, index) {
            var country = countrys[index];
            return ListTile(
              title: Text(country.name),
              onTap: () {streamController.add(country);},
            );
          },
        )
    );
  }
}

class FutureStreamBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FutureStreamBuilderState();
  }
}

class _FutureStreamBuilderState extends State<FutureStreamBuilder> {
  Future<List<Country>> myFuture;
  final streamController = StreamController();
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              flex: 1,
              child: FutureBuilder<List<Country>>(
                future: getInfoGitUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data[0].name);
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        var country = snapshot.data[index];
                        return ListTile(
                          title: Text(country.name),
                          onTap: () {streamController.add(country);},
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return CircularProgressIndicator();
                },
              )
          ),
          Flexible(
              flex: 1,
              child: StreamBuilder(
                stream: streamController.stream,
                builder: (context, snapshot) {
                  print("Stream state: ${snapshot.connectionState.toString()}");
                  if (snapshot.hasData) {
                    return Column(
                        children: [
                          Text('name: ' + snapshot.data.name),
                          Text('capital: ' + snapshot.data.capital),
                          Text('subregion: ' + snapshot.data.subregion),
                          Text('population: ' + snapshot.data.population.toString()),
                          Container(
                              height: 100,
                              width: 100,
                              child: SvgPicture.network(snapshot.data.flag,
                                semanticsLabel: 'flag',
                                placeholderBuilder: (BuildContext context) => Container(
                                    padding: const EdgeInsets.all(30.0),
                                    child: const CircularProgressIndicator()),
                              )
                          )
                        ]
                    );
                  }
                  return Wrap();
                },
              )
          ),
        ],
      ),
    );
  }
}
