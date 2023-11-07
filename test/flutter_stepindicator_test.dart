import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_stepindicator/flutter_stepindicator.dart';

void main() {
  testWidgets("test", (WidgetTester tester) async {
    tester.pumpWidget(
        FlutterStepIndicator(onChange: (e){}, list: const [0,1,2,3,4,5,6], page: 2, disableAutoScroll: false, height: 20)
    );
  });
}
