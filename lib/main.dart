import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/widgets.dart';
import 'package:granny/routes.dart';
import 'package:palette_generator/palette_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Application app1 =
      await DeviceApps.getApp('com.sonymobile.android.dialer', true);
  Application app2 = await DeviceApps.getApp('com.frandroid.app');
  Application app3 = await DeviceApps.getApp('com.frandroid.app');
  runApp(MyApp(app1));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Application dialer;

  MyApp(this.dialer);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', dialer: dialer),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.dialer}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final Application dialer;

  @override
  _MyHomePageState createState() => _MyHomePageState(dialer);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final ApplicationWithIcon dialer;
  _MyHomePageState(this.dialer);

  String _tile1Title = "Festlegen";
  Image _tile1Image = null;
  String _tile2Title = "Festlegen";
  Image _tile2Image = null;
  String _tile3Title = "Festlegen";
  Image _tile3Image = null;
  String _tile4Title = "Festlegen";
  Image _tile4Image = null;
  Application _tile1App = null;
  Application _tile2App = null;
  Application _tile3App = null;
  Application _tile4App = null;
  Color _tile1Color = Colors.green;
  Color _tile2Color = Colors.red;
  Color _tile3Color = Colors.blue;
  Color _tile4Color = Colors.orange;
  Color _text1Color = Colors.white;
  Color _text2Color = Colors.white;
  Color _text3Color = Colors.white;
  Color _text4Color = Colors.white;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: FlatButton.icon(
                    label: Flexible(
                      child:
                          Text(_tile1Title, style: TextStyle(fontSize: 24.0)),
                    ),
                    icon: _tile1Image == null
                        ? Icon(Icons.live_help)
                        : _tile1Image,
                    onLongPress: () async {
                      final app = await Navigator.pushNamed(context, '/Config');
                      //Color c = _tile1Color;
                      //if (app != null) {
                      //  PaletteGenerator pg = await PaletteGenerator.fromImageProvider(MemoryImage((app as ApplicationWithIcon).icon));
                      //  c = pg.dominantColor.color.withOpacity(0.75);
                      //}

                      setState(() {
                        if (app != null) {
                          _tile1Title = (app as ApplicationWithIcon).appName;
                          _tile1Image = Image.memory(
                            (app as ApplicationWithIcon).icon,
                            width: 32,
                          );
                          _tile1App = app;
                          //_tile1Color = c;
                        }
                      });
                    },
                    textColor: _text1Color,
                    color: _tile1Color,
                    onPressed: () async {
                      DeviceApps.openApp(_tile1App.packageName);

                      //List<Application> apps = await DeviceApps.getInstalledApplications(onlyAppsWithLaunchIntent: true, includeSystemApps: true);
                      //apps.forEach(print);
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton.icon(
                    label: Flexible(
                      child: Text(
                        _tile2Title,
                        style: TextStyle(fontSize: 24.0),
                        softWrap: true,
                      ),
                    ),
                    icon: _tile2Image == null
                        ? Icon(Icons.live_help)
                        : _tile2Image,
                    onLongPress: () async {
                      final app = await Navigator.pushNamed(context, '/Config');
                      setState(() {
                        if (app != null) {
                          _tile2Title = (app as ApplicationWithIcon).appName;
                          _tile2Image = Image.memory(
                            (app as ApplicationWithIcon).icon,
                            width: 32,
                          );
                          _tile2App = app;
                        }
                      });
                    },
                    textColor: _text2Color,
                    color: _tile2Color,
                    onPressed: () async {
                      DeviceApps.openApp(_tile2App.packageName);

                      //List<Application> apps = await DeviceApps.getInstalledApplications(onlyAppsWithLaunchIntent: true, includeSystemApps: true);
                      //apps.forEach(print);
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: FlatButton.icon(
                  label: Flexible(
                    child: Text(_tile3Title, style: TextStyle(fontSize: 24.0)),
                  ),
                  icon:
                      _tile3Image == null ? Icon(Icons.live_help) : _tile3Image,
                  onLongPress: () async {
                    final app = await Navigator.pushNamed(context, '/Config');
                    setState(() {
                      if (app != null) {
                        _tile3Title = (app as ApplicationWithIcon).appName;
                        _tile3Image = Image.memory(
                          (app as ApplicationWithIcon).icon,
                          width: 32,
                        );
                        _tile3App = app;
                      }
                    });
                  },
                  textColor: _text3Color,
                  color: _tile3Color,
                  onPressed: () async {
                    DeviceApps.openApp(_tile3App.packageName);

                    //List<Application> apps = await DeviceApps.getInstalledApplications(onlyAppsWithLaunchIntent: true, includeSystemApps: true);
                    //apps.forEach(print);
                  },
                ),
              ),
              Expanded(
                child: FlatButton.icon(
                  label: Flexible(
                    child: Text(_tile4Title, style: TextStyle(fontSize: 24.0)),
                  ),
                  icon:
                      _tile4Image == null ? Icon(Icons.live_help) : _tile4Image,
                  onLongPress: () async {
                    final app = await Navigator.pushNamed(context, '/Config');
                    setState(() {
                      if (app != null) {
                        _tile4Title = (app as ApplicationWithIcon).appName;
                        _tile4Image = Image.memory(
                          (app as ApplicationWithIcon).icon,
                          width: 32,
                        );
                        _tile4App = app;
                      }
                    });
                  },
                  textColor: _text4Color,
                  color: _tile4Color,
                  onPressed: () async {
                    DeviceApps.openApp(_tile4App.packageName);

                    //List<Application> apps = await DeviceApps.getInstalledApplications(onlyAppsWithLaunchIntent: true, includeSystemApps: true);
                    //apps.forEach(print);
                  },
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
