import 'package:client/routing/routes.dart';
import 'package:client/ui/auth/register/register_view_model.dart';
import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/ui/core/widgets/divider_text_center.dart';
import 'package:client/ui/core/widgets/input_custom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key, required this.viewModel});

  final RegisterViewModel viewModel;

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _username = TextEditingController();

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Add listener to the ViewModel's register command
    widget.viewModel.register.addListener(_onRegisterResult);
  }

  @override
  void didUpdateWidget(covariant RegisterView oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Remove the old listener and add the new one
    oldWidget.viewModel.register.removeListener(_onRegisterResult);
    widget.viewModel.register.addListener(_onRegisterResult);
  }

  @override
  void dispose() {
    // Remove the listener when the widget is disposed
    widget.viewModel.register.removeListener(_onRegisterResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.p24),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: AppSizes.p48),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Email field
                  AppTextField(
                    controller: widget._email,
                    label: 'Email*',
                    hint: 'Enter your email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSizes.p24),
                  // Username field
                  AppTextField(
                    controller: widget._username,
                    label: 'Username*',
                    hint: 'Enter your username',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is required';
                      }
                      if (value.length < 3 || value.length > 30) {
                        return 'Username must be between 3 and 30 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSizes.p24),
                  // Password field
                  AppTextField(
                    controller: widget._password,
                    label: 'Password*',
                    hint: 'Enter your password',
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 8 || value.length > 30) {
                        return 'Password must be between 8 and 30 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSizes.p24),
                  // Confirm password field
                  AppTextField(
                    controller: widget._confirmPassword,
                    label: 'Confirm Password*',
                    hint: 'Enter your password',
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm Password is required';
                      }
                      if (value != widget._password.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSizes.p48),
                  const DividerTextCenter(text: "Or register with"),
                  const SizedBox(height: AppSizes.p24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                              Icons.login), // Replace with Google icon
                          label: const Text("Google"),
                        ),
                      ),
                      const SizedBox(width: AppSizes.p16),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                              Icons.login), // Replace with Facebook icon
                          label: const Text("Facebook"),
                        ),
                      ),
                    ],
                  ),
                  // Register button
                  const SizedBox(height: AppSizes.p48),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                          TextSpan(
                            text: "Login", // Bold text
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.go(AppRoutes.loginView),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.p16),
                  ListenableBuilder(
                    listenable: widget.viewModel.register,
                    builder: (context, _) {
                      return FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, proceed with registration
                            widget.viewModel.register.execute((
                              email: widget._email.text,
                              password: widget._password.text,
                              username: widget._username.text,
                            ));
                          }
                        },
                        child: const Text("Register"),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onRegisterResult() {
    // Check if registration was successful
    if (widget.viewModel.register.completed) {
      widget.viewModel.register.clearResult();

      // success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Account created. Please verify it in your email"),
          duration: Duration(seconds: 3),
        ),
      );

      Future.delayed(const Duration(seconds: 3), () {
        if (!mounted) return;
        context.go(AppRoutes.loginView);
      });
    }

    // Handle error in registration
    if (widget.viewModel.register.error) {
      widget.viewModel.register.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Registration failed. Please try again."),
          action: SnackBarAction(
            label: "Try again",
            onPressed: () => widget.viewModel.register.execute((
              email: widget._email.text,
              password: widget._password.text,
              username: widget._username.text,
            )),
          ),
        ),
      );
    }
  }
}
