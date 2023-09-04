import 'package:flutter/material.dart';
import 'package:flutter_demo/extensions/order_status_constants.dart';

import 'extensions/label_type_ext.dart';
import 'widgets/common_chip_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _status = 'shipped';

  @override
  Widget build(BuildContext context) {
    final orderStatusItem = OrderStatusEnum.getEnumByStatus(_status);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (orderStatusItem != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CommonChipWidget(
                  text: orderStatusItem.text,
                  bgColor: orderStatusItem.labelType.bgColor(),
                  textColor: orderStatusItem.labelType.textColor(),
                ),
              ),
          ],
          // children: LabelType.values.map((e) {
          //   return Padding(
          //     padding: const EdgeInsets.only(bottom: 20),
          //     child: CommonChipWidget(
          //       text: e.getTextDemo(),
          //       bgColor: e.bgColor(),
          //       textColor: e.textColor(),
          //     ),
          //   );
          // }).toList(),
          // children: OrderStatusEnum.values.map((e) {
          //   return Padding(
          //     padding: const EdgeInsets.only(bottom: 20),
          //     child: CommonChipWidget(
          //       text: e.text,
          //       bgColor: e.labelType.bgColor(),
          //       textColor: e.labelType.textColor(),
          //     ),
          //   );
          // }).toList(),
          
        ),
      ),
    );
  }
}
