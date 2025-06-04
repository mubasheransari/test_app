import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CustomTextWidget(
                  text: "Mubasher Hasnain",
                  fontFamily: 'playfair',
                  fontWeight: FontWeight.w600,
                  textSize: 24,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey[300],
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: "Mubasher Hasnain",
                          fontWeight: FontWeight.w600,
                          textSize: 14,
                          color: Colors.white,
                        ),
                        SizedBox(height: 4),
                        CustomTextWidget(
                          text: "mubashera38@gmail.com",
                          fontWeight: FontWeight.w400,
                          textSize: 12,
                          color: Colors.white,
                        ),
                        SizedBox(height: 2),
                        CustomTextWidget(
                          text: "+923312025765",
                          fontWeight: FontWeight.w400,
                          textSize: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const AccountOptionRow(
                icon: Icons.settings,
                text: 'Kontoinstallningar',
              ),
              const SizedBox(height: 20),
              const AccountOptionRow(
                icon: Icons.account_balance_wallet_outlined,
                text: 'Mina betalmetoder',
              ),
              const SizedBox(height: 20),
              const AccountOptionRow(
                icon: Icons.sports_soccer,
                text: 'Support',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountOptionRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const AccountOptionRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 24),
       const SizedBox(width: 12),
        CustomTextWidget(
          text: text,
          fontWeight: FontWeight.w400,
          textSize: 14,
        ),
      ],
    );
  }
}
