import 'package:dart_define_example/launch_json_input.dart';
import 'package:dart_define_example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Verify does contain production title text widget',
    (tester) async {
      final json = await loadJsonFromAssets('keys_production.json');
      final launchJson = LaunchJsonClass.fromJson(json);

      await tester.pumpWidget(
        MyApp(launchJson: launchJson),
      );
      expect(find.text('Flutter Demo Prod build'), findsOneWidget);
      expect(find.text('Flutter Demo Stage build'), findsNothing);
    },
  );

  testWidgets(
    'Verify does contain staging title text widget',
    (tester) async {
      final json = await loadJsonFromAssets('keys_staging.json');
      final launchJson = LaunchJsonClass.fromJson(json);
      await tester.pumpWidget(
        MyApp(launchJson: launchJson),
      );
      expect(find.text('Flutter Demo Stage build'), findsOneWidget);
      expect(find.text('Flutter Demo Prod build'), findsNothing);
    },
  );
}
