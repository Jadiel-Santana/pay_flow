import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/billet_model.dart';
import 'package:pay_flow/shared/widgets/billet_list/billet_list_controller.dart';
import 'package:pay_flow/shared/widgets/billet_tile/billet_tile_widget.dart';

class BilletListWidget extends StatefulWidget {
  const BilletListWidget({Key? key}) : super(key: key);

  @override
  _BilletListWidgetState createState() => _BilletListWidgetState();
}

class _BilletListWidgetState extends State<BilletListWidget> {
  final controller = BilletListController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BilletModel>>(
      valueListenable: controller.billetsNotifier,
      builder: (_, billets, __) {
        return Column(
          children: billets
              .map(
                (e) => BilletTileWidget(billet: e),
              )
              .toList(),
        );
      },
    );
  }
}