import 'package:flutter_test/flutter_test.dart';
import 'package:happnd/app/app.dart';
import 'package:happnd/pages/splash_page.dart';

void main() {
  group('App', () {
    testWidgets('renders SplashPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(SplashPage), findsOneWidget);
    });
  });
}
