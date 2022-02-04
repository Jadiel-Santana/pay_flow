import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/billet_model.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_images.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/billet_list/billet_list_controller.dart';

class BilletInfoWidget extends StatefulWidget {
  const BilletInfoWidget({Key? key}) : super(key: key);

  @override
  _BilletInfoWidgetState createState() => _BilletInfoWidgetState();
}

class _BilletInfoWidgetState extends State<BilletInfoWidget> {
  final controller = BilletListController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppImages.logoMini,
                width: 56,
                height: 34,
                color: AppColors.background,
              ),
              Container(
                width: 1,
                height: 32,
                color: AppColors.background,
              ),
              ValueListenableBuilder<List<BilletModel>>(
                valueListenable: controller.billetsNotifier,
                builder: (_, billets, __) => Text.rich(
                  TextSpan(
                    text: 'Você tem ',
                    style: AppTextStyles.captionBackground,
                    children: [
                      TextSpan(
                        text: '${billets.length} boletos\n',
                        style: AppTextStyles.captionBoldBackground,
                      ),
                      TextSpan(
                        text: 'cadastrados para pagar',
                        style: AppTextStyles.captionBackground,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}