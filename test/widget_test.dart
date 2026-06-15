import 'package:flutter_test/flutter_test.dart';
import 'package:assignment_module_33/main.dart';
import 'package:provider/provider.dart';
import 'package:assignment_module_33/providers/converter_provider.dart';

void main() {
  testWidgets('Unit Converter smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ConverterProvider()),
        ],
        child: const UnitConverterApp(),
      ),
    );

    // Verify that the title is present.
    expect(find.text('Unit Converter'), findsOneWidget);
    
    // Verify that Length tab is selected by default.
    expect(find.text('Length'), findsAtLeastNWidgets(1));
  });
}
