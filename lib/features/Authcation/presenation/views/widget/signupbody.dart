import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/Authcation/presenation/Signinview.dart';
import 'package:flutter_application_1/features/Authcation/presenation/views/widget/custom_textfelid.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/features/mainscreen/presentation/mainscreenview.dart';
import 'package:flutter_application_1/features/Authcation/presenation/cubit/signup/cubit/signup_cubit.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => Mainscreenview()),
            (route) => false,
          );
        } else if (state is SignupFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Back Button
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// Title
                    Text('Create Account', style: AppTextStyle.h1),

                    const SizedBox(height: 8),

                    Text(
                      'Signup To Use APP',
                      style: AppTextStyle.bodyLarge.copyWith(
                        color: isDark ? Colors.grey[400] : Colors.grey[800],
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// First Name
                    CustomTextfelid(
                      label: 'First Name',
                      prefixicon: Icons.person,
                      textEditingController: cubit.firstNameController,
                      validator:
                          (v) =>
                              v == null || v.isEmpty
                                  ? 'Enter first name'
                                  : null,
                    ),

                    const SizedBox(height: 12),

                    /// Last Name
                    CustomTextfelid(
                      label: 'Last Name',
                      prefixicon: Icons.person_outline,
                      textEditingController: cubit.lastNameController,
                      validator:
                          (v) =>
                              v == null || v.isEmpty ? 'Enter last name' : null,
                    ),

                    const SizedBox(height: 12),

                    /// Email
                    CustomTextfelid(
                      label: 'Email',
                      prefixicon: Icons.email_outlined,
                      textEditingController: cubit.emailController,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Enter email';

                        return null;
                      },
                    ),

                    const SizedBox(height: 12),

                    /// Password
                    CustomTextfelid(
                      label: 'Password',
                      prefixicon: Icons.lock,
                      textEditingController: cubit.passwordController,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Enter password';
                        if (v.length < 6) return 'Min 6 chars';
                        return null;
                      },
                    ),

                    const SizedBox(height: 12),

                    /// Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            state is SignupLoading
                                ? null
                                : () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.signup();
                                  }
                                },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child:
                            state is SignupLoading
                                ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                : Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// Already have account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have account?',
                          style: TextStyle(
                            color: isDark ? Colors.grey[400] : Colors.grey[800],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Signinview()),
                            );
                          },
                          child: const Text("Sign in"),
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
