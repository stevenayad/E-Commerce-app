import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/Authcation/presenation/Signupview.dart';
import 'package:flutter_application_1/features/Authcation/presenation/cubit/login/login_cubit.dart';
import 'package:flutter_application_1/features/Authcation/presenation/passwordview.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/mainscreenview.dart';
import 'package:flutter_application_1/features/splah/controller/authcontroller.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:flutter_application_1/features/Authcation/presenation/views/widget/custom_textfelid.dart';

void handleSiginin() {
  final Authcontroller authController = Get.find<Authcontroller>();
  authController.loginin();
}

class Signinbody extends StatelessWidget {
  const Signinbody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Mainscreenview()),
          );
        } else if (state is LoginFailure) {
          Get.snackbar("Error", state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back', style: AppTextStyle.h1),
                    const SizedBox(height: 8),
                    Text(
                      'Sign in to Continue Shopping',
                      style: AppTextStyle.bodyLarge.copyWith(
                        color: isDark ? Colors.grey[400] : Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 40),

                    /// Email
                    CustomTextfelid(
                      label: 'Email',
                      prefixicon: Icons.email,
                      textEditingController: cubit.emailController,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Enter email';
                        if (!GetUtils.isEmail(v)) return 'Invalid email';
                        return null;
                      },
                    ),

                    const SizedBox(height: 12),

                    /// Password
                    CustomTextfelid(
                      label: 'Password',
                      prefixicon: Icons.lock,
                      textEditingController: cubit.passwordController,
                      validator:
                          (v) =>
                              v == null || v.isEmpty ? 'Enter password' : null,
                    ),

                    /// Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => Passwordview());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// Button
                    SizedBox(
                      width: double.infinity,
                      child:
                          state is LoginLoading
                              ? const Center(child: CircularProgressIndicator())
                              : ElevatedButton(
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.login();
                                  }
                                },
                                child: const Text("Sign in"),
                              ),
                    ),

                    const SizedBox(height: 12),

                    /// Signup
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have account?',
                          style: TextStyle(
                            color: isDark ? Colors.grey[400] : Colors.grey[800],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupView(),
                              ),
                            );
                          },
                          child: const Text("Sign Up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
