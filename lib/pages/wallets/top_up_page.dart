import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rental_sepeda_flutter/commons/constants.dart';
import 'package:rental_sepeda_flutter/components/amount_card.dart';
import 'package:rental_sepeda_flutter/components/custom_button.dart';
import 'package:rental_sepeda_flutter/components/screen_template.dart';
import 'package:rental_sepeda_flutter/components/text_form_field.dart';
import 'package:rental_sepeda_flutter/providers/top_up_provider.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TopUpProvider>(
      create: (context) => TopUpProvider(),
      builder: (context, _) => Scaffold(
        body: ScreenTemplate(
          title: "Isi Saldo",
          children: [
            CustomTextFormField2(
              controller: Provider.of<TopUpProvider>(context, listen: false)
                  .amountController,
              labelText: "Nominal Pengisian",
              hintText: "Rp. 10.000",
              keyboardType: TextInputType.number,
              inputFormatters: [
                Provider.of<TopUpProvider>(context, listen: false)
                    .currencyTextInputFormatter,
              ],
              onChanged: (value) {
                Provider.of<TopUpProvider>(context, listen: false).syncAmount();
              },
            ),
            SizedBox(height: 10),
            Consumer<TopUpProvider>(
              builder: (context, state, _) => Wrap(
                spacing: 10,
                runSpacing: 10,
                children: state.quickAmounts
                    .map(
                      (amount) => AmountCard(
                        onTap: () => state.amount = amount,
                        amount: amount,
                        isSelected: state.amount == amount,
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 16),
            Text("Metode Pembayaran", style: headline3Style),
            SizedBox(height: 10),
            Container(
              width: (MediaQuery.of(context).size.width - 60) / 3,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black26),
              ),
              child: Row(
                children: [
                  Icon(Icons.radio_button_on, size: 12, color: Colors.black),
                  SizedBox(width: 8),
                  Text("Kode QRIS", style: headline3Style),
                  Spacer(),
                  SvgPicture.asset(
                    "assets/svg/qris.svg",
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Consumer<TopUpProvider>(
              builder: (context, state, _) => CustomButton(
                text: "Bayar",
                onPressed: state.amount < 10000 || state.isProcessing
                    ? null
                    : () {
                        Provider.of<TopUpProvider>(context, listen: false)
                            .topUp(context);
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
