import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


AuthResponse? response;

class PageFruitStoreLogin extends StatelessWidget {
  const PageFruitStoreLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: Container()),
              SupaEmailAuth(
                onSignInComplete: (res) {
                  response = res;
                  Navigator.of(context).pop();
                },
                onSignUpComplete: (response) {
                  if (response.user != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PageVerifyOTP(email: response.user!.email!),
                      ),
                    );
                  }
                },
                showConfirmPasswordField: true,
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}

class PageVerifyOTP extends StatelessWidget {
  PageVerifyOTP({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Xác thực mã OTP"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OtpTextField(
            numberOfFields: 6,
            borderColor: Color(0xFF512DA8),
            showFieldAsBox: true,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) async {
              final response = await Supabase.instance.client.auth.verifyOTP(
                email: email,
                token: verificationCode,
                type: OtpType.email,
              );

              if (response.session != null && response.user != null) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => PageThongTinKH()),
                      (route) => false,
                );
              } else {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Xác thực thất bại. Vui lòng thử lại.")),
                );
              }
            },
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Đang gửi mã OTP..."), duration: Duration(seconds: 6)),
              );

              final response = await Supabase.instance.client.auth.signInWithOtp(
                email: email,
              );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Mã OTP đã gửi vào $email của bạn"), duration: Duration(seconds: 3)),
              );
            },
            child: Text("Gửi lại mã OTP"),
          ),
        ],
      ),
    );
  }
}


class PageThongTinKH extends StatefulWidget {
  const PageThongTinKH({super.key});

  @override
  State<PageThongTinKH> createState() => _PageThongTinKHState();
}

class _PageThongTinKHState extends State<PageThongTinKH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin khách hàng"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Text(
          "Đăng nhập thành công!",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}