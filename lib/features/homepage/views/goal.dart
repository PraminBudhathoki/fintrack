// import 'package:bdc/core/app_export.dart';
// import 'package:bdc/widgets/custom_elevated_button.dart';
// import 'package:bdc/widgets/custom_text_form_field.dart';
// import 'package:flutter/material.dart';

// // ignore_for_file: must_be_immutable
// class LogInScreen extends StatelessWidget {
//   LogInScreen({Key? key}) : super(key: key);

//   TextEditingController phoneNumberController = TextEditingController();

//   TextEditingController passwordController = TextEditingController();

//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     return MaterialApp(
//         home: Scaffold(
//             resizeToAvoidBottomInset: false,
//             body: Form(
//                 key: _formKey,
//                 child: Container(
//                     width: double.maxFinite,
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 22.h, vertical: 36.v),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CustomImageView(
//                               imagePath: ImageConstant.imgLogo1,
//                               height: 104.v,
//                               width: 99.h),
//                           SizedBox(height: 16.v),
//                           Text("Welcome!!!",
//                               style: CustomTextStyles.headlineSmallPrimary),
//                           SizedBox(height: 37.v),
//                           CustomTextFormField(
//                               controller: phoneNumberController,
//                               hintText: "Phone Number",
//                               textInputType: TextInputType.phone,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 11.h, vertical: 21.v),
//                               borderDecoration:
//                                   TextFormFieldStyleHelper.outlineBlackTL25),
//                           SizedBox(height: 28.v),
//                           CustomTextFormField(
//                               controller: passwordController,
//                               hintText: "password",
//                               textInputAction: TextInputAction.done,
//                               textInputType: TextInputType.visiblePassword,
//                               obscureText: true,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 11.h, vertical: 21.v),
//                               borderDecoration:
//                                   TextFormFieldStyleHelper.outlineBlackTL25),
//                           SizedBox(height: 19.v),
//                           Align(
//                               alignment: Alignment.centerRight,
//                               child: GestureDetector(
//                                   onTap: () {
//                                     onTapTxtForgetPassword(context);
//                                   },
//                                   child: Padding(
//                                       padding: EdgeInsets.only(right: 15.h),
//                                       child: Text("forget password?",
//                                           style: CustomTextStyles
//                                               .bodyMediumGray800)))),
//                           SizedBox(height: 56.v),
//                           CustomElevatedButton(
//                               text: "Log In",
//                               buttonStyle:
//                                   CustomButtonStyles.fillSecondaryContainer,
//                               buttonTextStyle:
//                                   CustomTextStyles.titleSmallRobotoOnPrimary_1,
//                               onPressed: () {
//                                 onTapLogIn(context);
//                               }),
//                           Spacer(),
//                           SizedBox(height: 3.v),
//                           Align(
//                               alignment: Alignment.centerLeft,
//                               child: Padding(
//                                   padding: EdgeInsets.only(left: 45.h),
//                                   child: Row(children: [
//                                     Padding(
//                                         padding: EdgeInsets.only(bottom: 1.v),
//                                         child: Text("Don’t have an account?",
//                                             style: CustomTextStyles
//                                                 .bodyMediumBlack900_1)),
//                                     GestureDetector(
//                                         onTap: () {
//                                           onTapTxtSignUp(context);
//                                         },
//                                         child: Padding(
//                                             padding: EdgeInsets.only(left: 4.h),
//                                             child: Text("Sign Up",
//                                                 style: CustomTextStyles
//                                                     .titleSmallPrimary_1)))
//                                   ])))
//                         ])))));
//   }

//   /// Navigates to the stStepOfNewPasswordScreen when the action is triggered.
//   onTapTxtForgetPassword(BuildContext context) {
//     Navigator.pushNamed(context, AppRoutes.stStepOfNewPasswordScreen);
//   }

//   /// Navigates to the homePageScreen when the action is triggered.
//   onTapLogIn(BuildContext context) {
//     Navigator.pushNamed(context, AppRoutes.homePageScreen);
//   }

//   /// Navigates to the signUpScreen when the action is triggered.
//   onTapTxtSignUp(BuildContext context) {
//     Navigator.pushNamed(context, AppRoutes.signUpScreen);
//   }
// }