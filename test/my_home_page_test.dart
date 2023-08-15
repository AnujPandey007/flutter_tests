import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/my_home_page.dart';

void main(){

  testWidgets("given counter is 0 when increment button is clicked then count value should be 1", (widgetTester) async{
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      )
    );

    final counterWith0Value = find.text("0");
    expect(counterWith0Value, findsOneWidget);

    final counterWith1Value = find.text("1");
    expect(counterWith1Value, findsNothing);

    final incrementButton = find.byKey(const Key("increment_counter"));
    await widgetTester.tap(incrementButton);
    await widgetTester.pump(); //similar to setState

    expect(counterWith1Value, findsOneWidget);
    expect(counterWith0Value, findsNothing);
  });

}