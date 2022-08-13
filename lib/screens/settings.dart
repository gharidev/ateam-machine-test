// import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../widgets/neumorphic_switch.dart';
import '../widgets/switch_with_title.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final settings = [
    {
      'title': 'Email Notification',
      'value': false,
      'sub-settings': [],
    },
    {
      'title': 'Push Notification',
      'value': false,
      'sub-settings': [],
    },
    {
      'title': 'Notification at Night',
      'value': false,
      'sub-settings': [],
    },
  ];

  @override
  void initState() {
    super.initState();
    settings.forEach((setting) {
      setting['sub-settings'] = [
        {
          'title': 'Order Updates',
          'value': true,
        },
        {
          'title': 'Shipping Updates',
          'value': true,
        },
        {
          'title': 'Promotions',
          'value': true,
        },
        {
          'title': 'Offers',
          'value': true,
        },
        {
          'title': 'News',
          'value': true,
        },
        {
          'title': 'Messages',
          'value': true,
        },
        {
          'title': 'New Arrivals',
          'value': true,
        },
      ];
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        );
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: DefaultTextStyle(
        style: textStyle,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Notification Settings'),
                const SizedBox(height: 15.0),
                ...settings
                    .map((setting) => DefaultTextStyle(
                          style: textStyle.copyWith(
                            color: Colors.grey.shade700,
                          ),
                          child: Column(
                            children: [
                              SwitchWithTitle(
                                title: '${setting['title']}',
                                onChanged: (value) {
                                  setState(() {
                                    setting['value'] = value;
                                  });
                                },
                                value: setting['value'] as bool,
                                isSub: false,
                              ),
                              if (setting['value'] as bool)
                                ...(setting['sub-settings'] as List)
                                    .map(
                                      (subSetting) => DefaultTextStyle(
                                        style: textStyle.copyWith(
                                            color: Colors.grey),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 13.0),
                                            SwitchWithTitle(
                                              title: '${subSetting['title']}',
                                              onChanged: (value) {
                                                setState(() {
                                                  subSetting['value'] = value;
                                                });
                                              },
                                              value:
                                                  subSetting['value'] as bool,
                                              isSub: true,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              const SizedBox(height: 15.0),
                            ],
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
