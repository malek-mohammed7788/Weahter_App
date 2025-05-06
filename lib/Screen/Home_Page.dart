import 'package:flutter/material.dart';
import 'package:weahter_app/Model/weather_Model.dart';
import 'package:weahter_app/Screen/Search.dart';
import 'package:provider/provider.dart';
import 'package:weahter_app/Provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = "Weahter App";
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    weatherModel = Provider.of<weatherProvider>(context).weatherdate;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            title.toUpperCase(),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xffF25E2B),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((BuildContext context) {
                    return const SearchPage();
                  })));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Provider.of<weatherProvider>(context, listen: false)
                    .weatherDate ==
                null
            ? Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Welcome to the weather app 😊",
                      style: TextStyle(
                          color: Color(0xff1D1716),
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Search 🔎 for the weather you want😃",
                      style: TextStyle(color: Color(0xff1D1716), fontSize: 20),
                    )
                  ],
                ))
            : Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Provider.of<weatherProvider>(context).CityName!,
                        style: const TextStyle(fontSize: 35),
                      ),
                      Text(
                        "Update Time ${weatherModel!.date.hour.toString()} : ${weatherModel!.date.day.toString()}",
                        style: const TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(weatherModel!.getImage()),
                          Text(
                            weatherModel!.temp.toInt().toString(),
                            style: const TextStyle(fontSize: 40),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                'max : ${weatherModel!.maxTemp.toString()}',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                'min : ${weatherModel!.minTemp.toString()}',
                                style:const TextStyle(fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        weatherModel!.weatherStateName.toString(),
                        style:const TextStyle(fontSize: 30),
                      )
                    ]),
              ));
  }
}
