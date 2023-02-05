import 'package:bereal/core/models/user_model.dart';
import 'package:bereal/core/ui/anon_appbar_widget.dart';
import 'package:bereal/onboarding/onboarding_providers.dart';
import 'package:bereal/onboarding/phone_verification_state.dart';
import 'package:bereal/styles/theme_provider.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key, required this.step});

  final int step;

  @override
  ConsumerState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int step = 0;
  Country country = CountryParser.parseCountryCode('FR');

  List<String> titles = [
    "Let’s get started, what's your name?",
    "Hi, #name, when's your birthday?",
    "Create your account using your phone number",
    "Enter the code we sent to #phone"
  ];

  List<String> placeholders = ["Your name", "DD MM YYYY", "Your phone", "••••••"];

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  List<bool> hasError = [false, false, false, false];

  @override
  void initState() {
    super.initState();
    step = widget.step;
  }

  Widget _step1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                titles[step],
                style: ref.watch(stylesProvider).text.bodySmallBold,
              ),
              TextField(
                controller: controllers[step],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: placeholders[step],
                  hintStyle: ref.watch(stylesProvider).text.hint,
                  errorText: hasError[step] ? 'Value can\'t be empty' : null,
                ),
                style: ref.watch(stylesProvider).text.hint.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: ElevatedButton(
                style: ref.watch(stylesProvider).button.primaryLarge,
                onPressed: () {
                  if (controllers[step].text.isNotEmpty) {
                    setState(() {
                      titles[step + 1] = titles[step + 1].replaceAll("#name", controllers[step].text);
                      step = step + 1;
                    });
                  } else {
                    setState(() {
                      hasError[step] = true;
                    });
                  }
                },
                child: const Text('Continue'))),
      ],
    );
  }

  Widget _step2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                titles[step],
                style: ref.watch(stylesProvider).text.bodySmallBold,
              ),
              TextField(
                controller: controllers[step],
                inputFormatters: [FilteringTextInputFormatter.digitsOnly, CustomInputFormatter()],
                maxLength: 10,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: placeholders[step],
                  hintStyle: ref.watch(stylesProvider).text.hint,
                  errorText: hasError[step] ? 'Value can\'t be empty' : null,
                ),
                style: ref.watch(stylesProvider).text.hint.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: ElevatedButton(
                style: ref.watch(stylesProvider).button.primaryLarge,
                onPressed: () {
                  if (controllers[step].text.isNotEmpty) {
                    setState(() {
                      step = step + 1;
                    });
                  } else {
                    setState(() {
                      hasError[step] = true;
                    });
                  }
                },
                child: const Text('Continue'))),
      ],
    );
  }

  Widget _step3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                titles[step],
                style: ref.watch(stylesProvider).text.bodySmallBold,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                              onPressed: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true, // optional. Shows phone code before the country name.
                                  onSelect: (Country country) {
                                    setState(() {
                                      this.country = country;
                                    });
                                  },
                                );
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: const BorderSide(color: Colors.white)))),
                              child: Text('${country.flagEmoji} +${country.phoneCode}'))),
                      const SizedBox(height: 15),
                    ],
                  ),
                  Expanded(
                    child: TextField(
                      controller: controllers[step],
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: placeholders[step],
                        hintStyle: ref.watch(stylesProvider).text.hint,
                        errorText: hasError[step] ? 'Value can\'t be empty' : null,
                      ),
                      style: ref.watch(stylesProvider).text.hint.copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: ref.watch(stylesProvider).text.bodySmall.copyWith(color: Colors.grey.shade400),
                        children: [
                          const TextSpan(text: 'By continuing, you agree to our '),
                          TextSpan(
                              text: 'Terms of Service',
                              style: ref.watch(stylesProvider).text.bodySmallBold.copyWith(color: Colors.grey.shade400),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Terms of Service');
                                }),
                          const TextSpan(text: ' and '),
                          TextSpan(
                              text: 'Privacy Policy',
                              style: ref.watch(stylesProvider).text.bodySmallBold.copyWith(color: Colors.grey.shade400),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Privacy Policy');
                                }),
                        ])),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ref.watch(stylesProvider).button.primaryLarge,
                    onPressed: () {
                      if (controllers[step].text.isNotEmpty) {
                        setState(() {
                          titles[step + 1] =
                              titles[step + 1].replaceAll("#phone", '+${country.phoneCode} ${controllers[step].text}');
                          ref.refresh(phoneVerificationProvider);
                          step = step + 1;
                        });
                      } else {
                        setState(() {
                          hasError[step] = true;
                        });
                      }
                    },
                    child: const Text('Continue'))
              ],
            )),
      ],
    );
  }

  Widget _step4() {
    ref.listen<PhoneVerificationState>(phoneVerificationProvider,
        (PhoneVerificationState? oldValue, PhoneVerificationState newValue) {
      if (newValue.isValid) {
        const storage = FlutterSecureStorage();
        storage
            .write(
                key: 'user',
                value: UserModel(name: controllers[0].text, birthdate: controllers[1].text, phone: controllers[2].text)
                    .toJson()
                    .toString())
            .then((_) => context.go('/'));
      } else if (newValue.hasError) {
        controllers[step].clear();
        Fluttertoast.showToast(
            msg: "Bad verification code, please retry.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        ref.refresh(phoneVerificationProvider);
      }
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                titles[step],
                style: ref.watch(stylesProvider).text.bodySmallBold,
              ),
              TextField(
                controller: controllers[step],
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 6,
                onChanged: (value) => {
                  if (value.length == 6)
                    ref.read(phoneVerificationProvider.notifier).verifyPhoneNumber(controllers[step].text)
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: placeholders[step],
                  hintStyle: ref.watch(stylesProvider).text.hint,
                  errorText: hasError[step] ? 'Value can\'t be empty' : null,
                ),
                style: ref.watch(stylesProvider).text.hint.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        step = step - 1;
                      });
                    },
                    child: Text(
                      'Change the phone number',
                      style: ref
                          .read(stylesProvider)
                          .text
                          .bodySmallBold
                          .copyWith(color: Colors.grey.shade400, fontSize: 14),
                    )),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ref.watch(stylesProvider).button.primaryLarge,
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Use the code: 123456",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 16.0);
                    },
                    child: const Text('Send new code'))
              ],
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AnonAppBar(),
      body: SafeArea(
          child: Center(
        child: _renderStep(),
      )),
    );
  }

  Widget _renderStep() {
    switch (step) {
      case 0:
        return _step1();
      case 1:
        return _step2();
      case 2:
        return _step3();
      case 3:
        return _step4();
      default:
        return _step1();
    }
  }
}

class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    var buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;

      if ((nonZeroIndex == 2 || nonZeroIndex == 4) && nonZeroIndex != text.length) {
        buffer.write(' ');
      }
    }

    var string = buffer.toString();

    return newValue.copyWith(text: string, selection: TextSelection.collapsed(offset: string.length));
  }
}
