import 'package:dart_define_example/launch_json_input.dart';
import 'package:flutter/material.dart';

final class DartDefineHelper {
  static LaunchJsonClass getLaunchJsonFile() {
    const isProd = bool.fromEnvironment('IS_PROD');
    const isStage = bool.fromEnvironment('IS_STAGE');
    const apiKeyId = String.fromEnvironment('API_KEY_ID');
    const someConditionsPath = String.fromEnvironment('SOME_CONDITIONS_PATH');
    return const LaunchJsonClass(
      apiKeyId: apiKeyId,
      someConditionsPath: someConditionsPath,
      isStage: isStage,
      isProd: isProd,
    );
  }
}

void main() {
  final launchJson = DartDefineHelper.getLaunchJsonFile();
  runApp(
    MyApp(launchJson: launchJson),
  );
}

class MyApp extends StatelessWidget {
  final LaunchJsonClass launchJson;

  const MyApp({
    super.key,
    required this.launchJson,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Flutter Demo ${launchJson.isProd ? 'Prod' : 'Stage'} build',
        launchJson: launchJson,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final LaunchJsonClass launchJson;

  const MyHomePage({
    super.key,
    required this.title,
    required this.launchJson,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'api_key: ${widget.launchJson.apiKeyId}',
            ),
            Text(
              'is production: ${widget.launchJson.isProd}',
            ),
            Text(
              'is stage: ${widget.launchJson.isStage}',
            ),
          ],
        ),
      ),
    );
  }
}
