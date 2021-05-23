import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/models/forecastModel.dart';
import 'package:today/models/weatherModel.dart';
import 'package:today/provider/weatherprovider.dart';
import 'package:today/widgets/icon.dart';

class LeftScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final weather = Provider.of<WeatherProvider>(context);
    return Scaffold(
      body: FutureBuilder(
        future: weather.getweather('London'),
        builder: (context, AsyncSnapshot<ForecaseModel> snapshot) {
          var data = snapshot.data;
          return ListView.builder(
            itemCount: data == null ? 0 : data.daily.length,
            itemBuilder: (context, index) {
              WeatherModel model = data.daily[index];
              final c = (model.temp) - 273.15;
              String cel = c.toStringAsFixed(2);
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        cel + "°C",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Des:' + model.description),
                          Text('UVI:${model.uvi}'),
                          Text('C:${model.cloudiness}'),
                          Text('H:${model.humidity}'),
                          Text('WS:${model.windSpeed}'),
                          Text('DP:${model.dewpoint}')
                        ],
                      ),
                    ],
                  ),
                  tileColor: Colors.green[300],
                  leading: Text(
                      'Date: ' + model.date.toString() + '\n ${data.city}'),
                  trailing: CircleAvatar(
                    radius: 20,
                    child: TempIcon(
                      condition: model.condition,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
