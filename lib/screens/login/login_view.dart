import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gandakimun/constants.dart';
import 'package:gandakimun/controllers/hrmcontroller.dart';
import 'package:gandakimun/utils/validators.dart';
import 'package:gandakimun/widget/custom_button.dart';
import 'package:gandakimun/widget/inputfield.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/appcontroller.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(HrmController());
  AppController controllerApp = Get.put(AppController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTop(),
            const SizedBox(
              height: 40,
            ),
            _buildLoginField()
          ],
        ),
      ),
    );
  }

  _buildTop() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 30.h,
          decoration: const BoxDecoration(
              color: AppColor.primaryClr,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black,
                  offset: Offset(0, -2),
                  blurStyle: BlurStyle.outer,
                )
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100))),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...List.generate(
                        1,
                        (index) => Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                    child: CachedNetworkImage(
                                      imageUrl: controllerApp
                                          .aboutlist[index].companyLogo
                                          .toString(),
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    controllerApp.isNepali.value
                                        ? controllerApp
                                            .aboutlist[index].companyName!.np
                                            .toString()
                                        : controllerApp
                                            .aboutlist[index].companyName!.en
                                            .toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ))
                  ],
                )
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              Get.back();
            },
            padding: const EdgeInsets.symmetric(vertical: 40),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
      ],
    );
  }

  _buildLoginField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username', style: subtitleStyle),
            const SizedBox(
              height: 5,
            ),
            MyInputField(
              hint: 'Enter you username',
              controller: controller.username,
              validator: (value) => validateIsEmpty(string: value),
            ),
            // CustomTextfield(label: 'Username'),
            const SizedBox(
              height: 20,
            ),
            Text('Password', style: subtitleStyle),
            const SizedBox(
              height: 5,
            ),
            Obx(
                  () => MyInputField(
                hint: 'Enter your password',
                controller: controller.password,
                obscuretext: controller.viewPassword.isFalse ? true : false,
                validator: (value) => validateIsEmpty(string: value),
                suffix: GestureDetector(
                    onTap: () {
                      controller.viewPassword.value =
                          !controller.viewPassword.value;
                    },
                    child: const Icon(Icons.remove_red_eye_outlined)),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                title: "Login",
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                    controller.login();
                    setState(() {});
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
