import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/billet_info/billet_info_widget.dart';
import 'package:pay_flow/shared/widgets/billet_list/billet_list_widget.dart';

class MyBilletsPage extends StatefulWidget {
  const MyBilletsPage({Key? key}) : super(key: key);

  @override
  _MyBilletsPageState createState() => _MyBilletsPageState();
}

class _MyBilletsPageState extends State<MyBilletsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Stack(
              children: [
                Container(
                  height: 40,
                  color: AppColors.primary,
                ),
                AnimatedCard(
                  direction: AnimatedCardDirection.top,
                  child: BilletInfoWidget(
                    key: UniqueKey(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 24,
            ),
            child: Row(
              children: [
                Text(
                  'Meus boletos',
                  style: AppTextStyles.titleBoldHeading,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BilletListWidget(
              key: UniqueKey(),
            ),
          )
        ],
      ),
    );
  }
}
