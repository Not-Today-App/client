import 'package:client/ui/auth/login/login_view_model.dart';
import 'package:client/ui/core/themes/sizes.dart';
import 'package:client/ui/core/widgets/divider_text_center.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:client/routing/routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _email = TextEditingController(
    text: 'aaa@a.com', // You can set it to empty if needed
  );
  final TextEditingController _password = TextEditingController(
    text: 'a123456789', // Set it to empty or saved value
  );

  @override
  void initState() {
    super.initState();
    // Add listener to the ViewModel
    widget.viewModel.login.addListener(_onLoginResult);
  }

  @override
  void didUpdateWidget(covariant LoginView oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.login.removeListener(_onLoginResult);
    widget.viewModel.login.addListener(_onLoginResult);
  }

  @override
  void dispose() {
    widget.viewModel.login.removeListener(_onLoginResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Email field
                  TextField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelText: "email", // For localization
                    ),
                  ),
                  const SizedBox(height: AppSizes.p24),
                  // Password field
                  TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "password", // For localization
                        counterText: "Forgot Password"),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: AppSizes.p48),
                  const DividerTextCenter(text: "Or login with"),
                  // Login button
                  Spacer(),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant),
                          ),
                          TextSpan(
                            text: "Register", // Bold text
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold, // Making "Register" bold
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary, // Optional: Customize color
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => context.go(AppRoutes.registerView),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.p16),
                  ListenableBuilder(
                    listenable: widget.viewModel.login,
                    builder: (context, _) {
                      return FilledButton(
                        onPressed: () {
                          widget.viewModel.login.execute((
                            _email.value.text,
                            _password.value.text,
                          ));
                        },
                        child: Text("Login"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginResult() {
    // Check if login was successful
    if (widget.viewModel.login.completed) {
      widget.viewModel.login.clearResult();
      context
          .go(AppRoutes.addictionsView); // Navigate to home on successful login
    }

    // Handle error in login
    if (widget.viewModel.login.error) {
      widget.viewModel.login.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("errorWhileLogin"),
          action: SnackBarAction(
            label: "Try again", //AppLocalization.of(context).tryAgain
            onPressed: () => widget.viewModel.login.execute((
              _email.value.text,
              _password.value.text,
            )),
          ),
        ),
      );
    }
  }
}
