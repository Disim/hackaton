import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hackaton/elements/alerts.dart';
import 'package:hackaton/elements/body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hackaton/elements/buttons.dart';
import 'package:hackaton/utils/constants.dart';
import 'package:hackaton/utils/data.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Dio dio = Dio();
  int firstLoading = 0;

  dynamic humidity;
  dynamic temperature;
  dynamic co2;

  firstLoad() async {
    setState(() {
      firstLoading = 1;
    });
    final response = await dio.get(
        'https://api-uae-test.ujin.tech/api/devices/get-device-info/',
        data: {
          "token": "ust-738989-e96c48339a4a4ded2cd43abdee8c0392",
          "serialnumber": "636586996"
        });
    humidity = (response.data['data']['signals'][0]['state']['value']);
    temperature = (response.data['data']['signals'][2]['state']['value']);
    co2 = (response.data['data']['signals'][7]['state']['value']);
    setState(() {
      firstLoading = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (firstLoading == 0) {
      firstLoad();
    }
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    Device device = arguments['device'] as Device;
    int index = arguments['index'] as int;
    return Scaffold(
        body: Body(
            loading: firstLoading != 2,
            child: ListView(
              padding: const EdgeInsets.all(marginHigh),
              children: [
                SafeArea(
                  child: Text(
                    AppLocalizations.of(context)!.device_revie,
                    style: headline1Montserrat,
                  ),
                ),
                Row(children: [
                  Image.asset(
                    device.type == 0 ? 'images/co2.png' : 'images/switch.png',
                    height: 300,
                  ),
                ]),
                Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Text('${AppLocalizations.of(context)!.state}:',
                            style: middleText),
                        Text(
                            device.state == 1
                                ? AppLocalizations.of(context)!.turn_on
                                : device.state == 0
                                    ? AppLocalizations.of(context)!.turn_off
                                    : '-',
                            style: middleText)
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Text('${AppLocalizations.of(context)!.locate}:',
                            style: middleText),
                        Text(device.location, style: middleText)
                      ],
                    ),
                  ],
                ),
                Visibility(
                  visible: device.type == 0,
                  child: Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(),
                      1: FlexColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          Text('${AppLocalizations.of(context)!.temperature}:',
                              style: middleText),
                          Text('$temperature', style: middleText)
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Text('${AppLocalizations.of(context)!.humidity}:',
                              style: middleText),
                          Text('$humidity', style: middleText)
                        ],
                      ),
                      // TableRow(
                      //   children: <Widget>[
                      //     Text('${AppLocalizations.of(context)!.air_quality}:',
                      //         style: middleText),
                      //     Text('${device.airQuality}', style: middleText)
                      //   ],
                      // ),
                      TableRow(
                        children: <Widget>[
                          Text('${AppLocalizations.of(context)!.co2}:',
                              style: middleText),
                          Text('$co2', style: middleText)
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.about_device,
                  style: headline2Montserrat,
                ),
                Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Text('${AppLocalizations.of(context)!.developer}:',
                            style: middleText),
                        Text(device.developer, style: middleText)
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        Text('${AppLocalizations.of(context)!.serial_number}:',
                            style: middleText),
                        Text(device.serialNumber, style: middleText)
                      ],
                    ),
                  ],
                ),
                Visibility(
                    visible: device.type == 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: margin),
                        Row(
                          children: [
                            ClassicButton(AppLocalizations.of(context)!.enable,
                                () async {
                              final response = await dio
                                  .post(
                                      'https://api-uae-test.ujin.tech/api/apartment/send-signal/?token=ust-738989-e96c48339a4a4ded2cd43abdee8c0392&serialnumber=636686744&signal=lamp_a1&state=1')
                                  .onError((error, stackTrace) =>
                                      alert(context, message: '$error'))
                                  .then((value) => setState(() {
                                        device.state = 1;
                                      }));
                            }),
                            SizedBox(width: margin),
                            ClassicButton(AppLocalizations.of(context)!.disable,
                                () async {
                              final response = await dio
                                  .post(
                                      'https://api-uae-test.ujin.tech/api/apartment/send-signal/?token=ust-738989-e96c48339a4a4ded2cd43abdee8c0392&serialnumber=636686744&signal=lamp_a1&state=0')
                                  .onError((error, stackTrace) =>
                                      alert(context, message: '$error'))
                                  .then((value) => setState(() {
                                        device.state = 0;
                                      }));
                            }),
                          ],
                        )
                      ],
                    )),
                SizedBox(height: margin),
                InlineButton(
                  AppLocalizations.of(context)!.delete_device,
                  () {
                    Navigator.pop(context);
                    devices.removeAt(index);
                    setState(() {});
                  },
                  color: Colors.red.shade300,
                )
              ],
            )));
  }
}
