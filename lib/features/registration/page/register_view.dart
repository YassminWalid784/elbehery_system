import 'package:flutter/material.dart';
import '../../../core/widgets/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  static const String routeName = 'register';

  var formKey = GlobalKey<FormState>();
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    // var vm = Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);
    return  Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        // image: DecorationImage(
        //   image: AssetImage("assets/images/photo.jpg"),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Create Account"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mediaQuery.height * 0.1),
                  Text(
                    "First Name",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  CustomTextField(
                    controller: firstNameEditingController,
                    hint: "Enter your first name",
                    hintColor: Colors.black87,
                    suffixWidget: const Icon(Icons.person),
                    onFieldSubmitted: (_) {
                      print(firstNameEditingController.text);
                    },
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Second Name",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  CustomTextField(
                    controller: secondNameEditingController,
                    hint: "Enter your full name",
                    hintColor: Colors.black87,
                    suffixWidget: const Icon(Icons.person),
                    onFieldSubmitted: (_) {
                      print(secondNameEditingController.text);
                    },
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter your name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "E-mail",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  CustomTextField(
                    controller: emailController,
                    hint: "Enter your e-mail address",
                    hintColor: Colors.black87,
                    suffixWidget: const Icon(Icons.email_rounded),
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter e-mail address";
                      }

                      var reges = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                      if (!reges.hasMatch(value)) {
                        return "Invalid e-mail address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Password",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  CustomTextField(
                    controller: passwordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: "Enter your password",
                    hintColor: Colors.black87,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter your password";
                      }

                      var regex = RegExp(
                          r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$");

                      if (!regex.hasMatch(value)) {
                        return "The password must include at least \n* one lowercase letter, \n* one uppercase letter, \n* one digit, \n* one special character,\n* at least 8 characters long.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Confirm Password",
                    textAlign: TextAlign.start,
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  CustomTextField(
                    controller: confirmPasswordController,
                    isPassword: true,
                    maxLines: 1,
                    hint: "Enter your confirm password",
                    hintColor: Colors.black87,
                    onFieldSubmitted: (value) {

                    },
                    onValidate: (value) {

                      if(value != passwordController.text) {
                        return "password doesn't match";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 8.0),
                      backgroundColor:Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    onPressed: () {
                      if(formKey.currentState!.validate()) {
                        print("Validation successful");
                        print("calling request");
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Create Account",
                          style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          size: 30,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
