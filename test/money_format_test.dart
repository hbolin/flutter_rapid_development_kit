import 'package:flutter_rapid_development_kit/org.phoenix.commons/extension/money_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('double moneyFormat', () {
    String? money = "1";
    print(money.moneyFormat());
    expect(money.moneyFormat(), "1");
    money = "1.0";
    print(money.moneyFormat());
    expect(money.moneyFormat(), "1");
    money = "1.00";
    print(money.moneyFormat());
    expect(money.moneyFormat(), "1");
    money = "1.";
    print(money.moneyFormat());
    expect(money.moneyFormat(), "1");
    money = "01";
    print(money.moneyFormat());
    expect(money.moneyFormat(), "1");
    money = "001";
    print(money.moneyFormat());
    expect(money.moneyFormat(), "1");
    money = "0.1";
    print(money.moneyFormat());
    expect(money.moneyFormat(), "0.1");
    money = "0.10";
    print(money.moneyFormat());
    expect(money.moneyFormat(), "0.1");
    money = "0.2001";
    print(money.moneyFormat());
    expect(money.moneyFormat(), "0.2");
    money = ".1";
    print(money.moneyFormat());
    expect(money.moneyFormat(), "0.1");
    money = ".10";
    print(money.moneyFormat());
    expect(money.moneyFormat(), "0.1");
    money = "0.11";
    print(money.moneyFormat());
    expect(money.moneyFormat(), "0.11");
    money = null;
    print(money.moneyFormat());
    expect(money.moneyFormat(), null);
  });

  test('string moneyFormat', () {
    double? money = 1;
    print(money.moneyFormat());
    expect(money.moneyFormat(), "1");
    money = 1.0;
    print(money.moneyFormat());
    expect(money.moneyFormat(), "1");
    money = 1.00;
    print(money.moneyFormat());
    expect(money.moneyFormat(), "1");
    money = 1.01;
    print(money.moneyFormat());
    expect(money.moneyFormat(), "1.01");
    money = null;
    print(money.moneyFormat());
    expect(money.moneyFormat(), null);
  });
}
