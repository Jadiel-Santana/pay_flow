import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/billet_model.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

class BilletTileWidget extends StatelessWidget {
  final BilletModel billet;

  const BilletTileWidget({
    Key? key,
    required this.billet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            billet.name!,
            style: AppTextStyles.titleListTile,
          ),
          subtitle: Text(
            'Vence em ${billet.dueDate}',
            style: AppTextStyles.captionBody,
          ),
          trailing: Text.rich(TextSpan(
            text: 'R\$ ',
            style: AppTextStyles.trailingRegular,
            children: [
              TextSpan(
                text: billet.value!.toStringAsFixed(2),
                style: AppTextStyles.trailingBold,
              ),
            ],
          )),
        ),
      ),
    );
  }
}