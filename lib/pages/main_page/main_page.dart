import 'package:flutter/material.dart';
import 'package:hackaton/utils/constants.dart';

import 'package:hackaton/elements/body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hackaton/elements/buttons.dart';
import 'package:hackaton/utils/data.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 1;

  addDevice() {
    int deviceType = 0;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(marginHigh),
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!.name_device),
                  TextFormField(),
                  Text(AppLocalizations.of(context)!.device_type),
                  Row(children: [
                    Radio(
                        value: 0,
                        groupValue: deviceType,
                        onChanged: (value) {
                          setState(() {
                            deviceType = value!;
                            print(deviceType);
                          });
                        }),
                    const Text('0')
                  ]),
                  Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: deviceType,
                          onChanged: (value) {
                            setState(() {
                              deviceType = value!;
                              print(deviceType);
                            });
                          }),
                      const Text('1')
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: deviceType,
                          onChanged: (value) {
                            setState(() {
                              deviceType = value!;
                              print(deviceType);
                            });
                          }),
                      const Text('2')
                    ],
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: currentPage == 1,
        child: FloatingActionButton(
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: mainColor),
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
          onPressed: () {
            addDevice();
          },
        ),
      ),
      body: Stack(
        children: [
          Visibility(visible: currentPage == 0, child: const ScenarioPage()),
          Visibility(visible: currentPage == 1, child: const HomePage()),
          Visibility(visible: currentPage == 2, child: const ProfilePage()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff836AFB),
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.edit),
              label: AppLocalizations.of(context)!.scenarios),
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: AppLocalizations.of(context)!.main),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: AppLocalizations.of(context)!.profile)
        ],
        currentIndex: currentPage,
        backgroundColor: Colors.white,
        onTap: (i) {
          setState(() {
            currentPage = i;
          });
        },
      ),
    );
  }
}

class ScenarioPage extends StatefulWidget {
  const ScenarioPage({super.key});

  @override
  State<ScenarioPage> createState() => _ScenarioPageState();
}

class _ScenarioPageState extends State<ScenarioPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'В разработке!',
        style: headline1Montserrat,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget component(Device device, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/device_review',
              arguments: {'device': device, 'index': index}).then((_) {
            setState(() {});
          });
        },
        child: Stack(children: [
          Image.asset(
            device.type == 0 ? 'images/co2.png' : 'images/switch.png',
            height: 300,
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Body(
        child: NestedScrollView(
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
              child: SafeArea(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(marginHigh),
                child: Text(AppLocalizations.of(context)!.connected_devices,
                    style: headline1Montserrat),
              )
            ],
          ))),
        ];
      },
      body: GridView.count(
        padding: EdgeInsets.all(margin),
        crossAxisCount: 2,
        // This creates two columns with two items in each column
        children: List.generate(devices.length, (index) {
          return component(devices[index], index);
        }),
      ),
    ));
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(marginBig), children: [
      Text(AppLocalizations.of(context)!.profile, style: headline1Montserrat),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: marginBig),
        Text(AppLocalizations.of(context)!.choose_name),
        TextFormField(),
        const SizedBox(height: marginHigh),
        Text(AppLocalizations.of(context)!.enter_email),
        TextFormField(),
        const SizedBox(height: marginHigh),
        Text(AppLocalizations.of(context)!.choose_password),
        TextFormField(),
        const SizedBox(height: marginHigh),
        Text(AppLocalizations.of(context)!.repeat_password),
        TextFormField(),
        const SizedBox(height: marginHigh),
        ClassicButton(AppLocalizations.of(context)!.save, () {})
      ])
    ]);
  }
}
