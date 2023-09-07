import 'package:flutter/material.dart';
import 'package:payment_apps/theme.dart';

void main() => runApp(const PaymentApps());

class PaymentApps extends StatefulWidget {
  const PaymentApps({super.key});

  @override
  State<PaymentApps> createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subtitle, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selectedIndex == index
                  ? const Color(0xff007dff)
                  : const Color(0xff4d5b7c),
            ),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedIndex == index
                    ? Image.asset(
                        'assets/images/check_two.png',
                        width: 18,
                        height: 18,
                      )
                    : Image.asset('assets/images/check.png',
                        width: 18, height: 18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: planTextStyle,
                    ),
                    Text(
                      subtitle,
                      style: descTextStyle,
                    )
                  ],
                ),
                const SizedBox(
                  width: 91,
                ),
                Text(
                  pricing,
                  style: priceTextStyle,
                ),
              ],
            )
          ]),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 32, right: 32),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/icon_one.png',
                width: 267,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to',
                  style: titleTextStyle,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'Pro',
                  style: titleproTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Go unlock all features and \nbuild your on bussines bigger',
              style: subTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          SizedBox(
            width: 311,
            height: 51.23,
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff007dff),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(71))),
              onPressed: () {},
              child: Text(
                'Checkout Now',
                style: buttonTextStyle,
              ),
            ),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff04112f),
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              const SizedBox(
                height: 50,
              ),
              option(0, 'Montly', 'Good for starting up', "\$20"),
              option(1, 'Quarterly', 'Focusing on building', "\$55"),
              option(2, 'Yearly', 'steady company', "\$220"),
              const SizedBox(
                height: 50,
              ),
              selectedIndex == -1 ? const SizedBox() : checkoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
