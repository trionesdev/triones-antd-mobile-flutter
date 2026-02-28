import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

import '../demo_block.dart';

class VerificationCodeInputPage extends StatefulWidget {
  const VerificationCodeInputPage({super.key});

  @override
  State<StatefulWidget> createState() => _VerificationCodeInputPageState();
}

class _VerificationCodeInputPageState extends State<VerificationCodeInputPage> {
  @override
  Widget build(BuildContext context) {
    return AntScaffold(
      appBar: AntAppBar(title: const Text('VerificationCodeInput 验证码输入框')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            DemoBlock(
              title: "基本使用",
              child: AntVerificationCodeInput(placeholder: "请输入验证码"),
            ),
            DemoBlock(
              title: "变体",
              child: Column(
                spacing: 10,
                children: [
                  AntVerificationCodeInput(
                    variant: AntInputVariant.outlined,
                    placeholder: "请输入验证码",
                  ),
                  AntVerificationCodeInput(
                    variant: AntInputVariant.filled,
                    placeholder: "请输入验证码",
                  ),
                  AntVerificationCodeInput(
                    variant: AntInputVariant.borderless,
                    placeholder: "请输入验证码",
                  ),
                  AntVerificationCodeInput(
                    variant: AntInputVariant.underlined,
                    placeholder: "请输入验证码",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
