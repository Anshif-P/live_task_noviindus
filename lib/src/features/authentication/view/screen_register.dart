import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:noviindus_live_task_/src/features/authentication/controller/register_provider.dart';
import 'package:noviindus_live_task_/src/util/constance/colors.dart';
import 'package:noviindus_live_task_/src/util/constance/text_style.dart';
import 'package:noviindus_live_task_/src/util/validation/form_validation.dart';
import 'package:noviindus_live_task_/src/widgets/text_feild_widget.dart';
import 'package:provider/provider.dart';

class ScreenRegister extends StatelessWidget {
  final TextEditingController numberController = TextEditingController();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  String countryCode = '+91';
  ScreenRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer<RegisterProvider>(
        builder: (context, obj, child) => Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.grey),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () =>
                  registerUser(countryCode, numberController.text, context),
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
                      child: obj.isLoading
                          ? const CircularProgressIndicator()
                          : const CircleAvatar(
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
        ),
      ),
      backgroundColor: AppColor.backgroundColor,
      body: Form(
        key: registerKey,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: CountryCodePicker(
                        onChanged: (value) {
                          countryCode = value.toString();
                        },
                        textStyle: AppText.defaultLight,
                        initialSelection: 'IN',
                        favorite: const ['+91', 'IN'],
                        showCountryOnly: false,
                        showFlag: false,
                        showOnlyCountryWhenClosed: false,
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
                        validator: (value) =>
                            Validations.numberValidation(value),
                      )),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }

  void registerUser(String countryCode, String number, BuildContext context) {
    if (registerKey.currentState!.validate()) {
      Provider.of<RegisterProvider>(context, listen: false)
          .registerUser(countryCode, numberController.text, context);
    } else {}
  }
}
