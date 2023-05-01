
import 'package:flutter/material.dart';
import 'widgets/button.dart';
import 'widgets/mycard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'Hello, World!',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Welcome to Flutter',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Balance",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "\$5 105 200",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: "Transfer",
                      backgroundColor: Colors.primaries[2],
                      fontColor: Colors.white,
                    ),
                    Button(
                      text: "Request",
                      backgroundColor: Colors.primaries[4],
                      fontColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "Wallets",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const MyCard(
                  title: "Euro",
                  amount: 52391200,
                  unit: "EUR",
                  iconData: Icons.euro_rounded,
                  order: 0,
                ),
                const MyCard(
                  title: "Dollar",
                  amount: 52355142,
                  unit: "\$",
                  iconData: Icons.attach_money_rounded,
                  order: 1,
                ),
                const MyCard(
                  title: "Bitcoin",
                  amount: 122,
                  unit: "BTC",
                  iconData: Icons.currency_bitcoin_rounded,
                  order: 2,
                ),
                const MyCard(
                  title: "Ethereum",
                  amount: 52391200,
                  unit: "ETH",
                  iconData: Icons.e_mobiledata_rounded,
                  order: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
