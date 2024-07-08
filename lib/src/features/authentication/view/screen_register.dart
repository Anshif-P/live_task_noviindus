import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:noviindus_live_task_/src/util/constance/colors.dart';
import 'package:noviindus_live_task_/src/util/constance/text_style.dart';
import 'package:noviindus_live_task_/src/util/validation/form_validation.dart';
import 'package:noviindus_live_task_/src/widgets/text_feild_widget.dart';

class ScreenRegister extends StatelessWidget {
  final TextEditingController numberController = TextEditingController();
  ScreenRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.grey),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Text(
                        'Continue',
                        style: AppText.defaultGrey,
                      ),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    backgroundColor: AppColor.redColor,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Enter Your\nMobile Number',
              style: AppText.mediumLight,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Porta at id hac vitae. Et tortor at vehicula euismod mi viverra.',
              style: AppText.smallGrey,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: CountryCodePicker(
                      onChanged: print,
                      textStyle: AppText.defaultLight,
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: 'IN',
                      favorite: ['+91', 'IN'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      showFlag: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 7,
                    child: TextFieldWidget(
                      isNumberKeyboard: true,
                      hintText: 'Enter Mobile Number',
                      controller: numberController,
                      validator: (value) => Validations.numberValidation(value),
                    )),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
