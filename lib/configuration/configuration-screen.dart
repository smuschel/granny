import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/painting.dart';

class ConfigurationScreen extends StatefulWidget {
  @override
  _ConfigurationScreenState createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {

  final _formKey = GlobalKey<FormState>();
  String _appLabel = "Beschriftung";

  @override
  void initState() {
    super.initState();
  }

  _getAppList() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
      onlyAppsWithLaunchIntent: true,
      includeSystemApps: true,
      includeAppIcons: true,
    );
    return apps;
  }

  Widget configurationWidget() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.data == null || projectSnap.hasData == null) {
          return Container();
        }
        return Expanded(
          child: ListView.separated(
            itemCount: projectSnap.data.length,
            itemBuilder: (context, index) {
              ApplicationWithIcon current = projectSnap.data[index];
              return ListTile(
                contentPadding: EdgeInsets.all(8),
                leading: Image.memory(
                  current.icon,
                  width: 32,
                ),
                title: Text(current.appName),
                trailing: IconButton(
                  icon: Icon(Icons.play_circle_filled),
                  color: Colors.blue,
                  onPressed: () {
                    DeviceApps.openApp(current.packageName);
                  },
                ),
                onTap: () {
                  Navigator.pop(context, current);
                  /*setState(() {
                    _appLabel = current.appName;
                  });*/
                },
              );
            },
            separatorBuilder: (context, index) => Divider(
              indent: 16,
              endIndent: 16,
            ),
          ),
        );
      },
      future: _getAppList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wählen Sie eine App aus'),
        ),
        body: Column(
          children: <Widget>[

            configurationWidget()
          ],
        ));
  }
}
