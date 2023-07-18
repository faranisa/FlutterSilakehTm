
import 'package:flutter/material.dart';
import 'package:flutter_silakehtm/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../component/background.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "SiLakeh Tenaga Medis",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2661FA),
                  fontSize: 25.sp),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
              child: Column(children: [
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? 'Please Enter Email'
                        : null;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Username', icon: Icon(Icons.person_outline)),
                ),
                SizedBox(height: size.height * 0.03),
                GetX<LoginController>(
                  init: LoginController(),
                  autoRemove: false, // add this
                  builder: (_) => TextFormField(
                    validator: (value) {
                      return (value == null || value.isEmpty)
                          ? 'Please Enter Password'
                          : null;
                    },
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      icon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.isHidden.value =
                              !controller.isHidden.value;
                        },
                        child: Icon(controller.isHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    obscureText: controller.isHidden.value,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  margin: const EdgeInsets.only(left: 200, bottom: 10),
                  child: TextButton(
                    onPressed: () {
                      // setState(() {
                      //   _formType = FormType.register;
                      // });
                    },
                    child: Text(
                      'Lupa Password?',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      textStyle: const TextStyle(color: Colors.white)),
                  onPressed: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      controller.loginUser(
                              _emailController.text, _passwordController.text)
                          .then((value) {
                        Get.offAllNamed(Routes.HOME);
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 8.h,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 255, 136, 34),
                          Color.fromARGB(255, 255, 177, 41)
                        ])),
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ],
      )),
    );
  }
}
