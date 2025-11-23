import 'dart:io';

import 'package:svg_to_flutter/main.dart';

void main(List<String> arguments) async {
  exit(await SvgToFlutterCommandRunner().run(arguments));
}
