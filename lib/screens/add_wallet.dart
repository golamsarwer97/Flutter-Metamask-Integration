// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clipboard/clipboard.dart';

import '../provider/metamask_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold();
    // }
    return ChangeNotifierProvider(
      create: (context) => MetaMaskProvider()..init(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: const Color(0xFF1b202b),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/dsl.png'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Connect with wallet",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 30),
              Center(
                child: Consumer<MetaMaskProvider>(
                  builder: (context, provider, child) {
                    late final String text;
                    text = provider.account;
                    if (provider.isConnected) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.white54,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 15,
                        shadowColor: Colors.black,
                        color: const Color.fromARGB(255, 10, 17, 32),
                        child: Container(
                          padding: const EdgeInsets.only(left: 15, bottom: 15),
                          height: 270,
                          width: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Account",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 24,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 150,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.white60,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Connected to MetaMask",
                                            style: TextStyle(
                                                color: Colors.white60),
                                          ),
                                          Text(
                                            '${text.substring(0, 7)}...${text.substring(text.length - 4, text.length)}',
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  _copytext(text);
                                                },
                                                icon: const Icon(
                                                    Icons.content_copy_rounded),
                                                color: Colors.white60,
                                              ),
                                              const Text(
                                                "Copy Address",
                                                style: TextStyle(
                                                    color: Colors.white60),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (provider.isEnabled) {
                      return Container(
                        height: 280,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 25,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () =>
                                  context.read<MetaMaskProvider>().connect(),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Image.asset(
                                      "assets/MetaMask_Fox.png",
                                      height: 30,
                                      width: 40,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  const Text(
                                    "MetaMask",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 10)
                                ],
                              ),
                            ),
                            Divider(color: Colors.white54),
                            TextButton(
                              onPressed: () =>
                                  context.read<MetaMaskProvider>().connect(),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Image.asset(
                                      "assets/TWT.png",
                                      height: 30,
                                      width: 40,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  const Text(
                                    "Trust Wallet",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 10)
                                ],
                              ),
                            ),
                            Divider(color: Colors.white54),
                            TextButton(
                              onPressed: () =>
                                  context.read<MetaMaskProvider>().connect(),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Image.asset(
                                      "assets/rainbow.png",
                                      height: 30,
                                      width: 40,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  const Text(
                                    "Rainbow",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 10)
                                ],
                              ),
                            ),
                            Divider(color: Colors.white54),
                            TextButton(
                              onPressed: () =>
                                  context.read<MetaMaskProvider>().connect(),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Icon(
                                      Icons.link_outlined,
                                      size: 40,
                                      color: Colors.white38,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  const Text(
                                    "Enter ethereum address",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(width: 10)
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      'Please use a Web3 supported browser.';
                    }

                    return ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.purple, Colors.blue, Colors.red],
                      ).createShader(bounds),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New to wallets?',
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Learn more',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSnackbar() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Text Copied")));
  }

  void _copytext(String copytext) {
    FlutterClipboard.copy(copytext).then((value) => _showSnackbar());
  }
}
