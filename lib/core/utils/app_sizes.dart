import 'package:flutter/cupertino.dart';

const gapH4 = SizedBox(height: 4);
const gapH8 = SizedBox(height: 8);
const gapH12 = SizedBox(height: 12);
const gapH16 = SizedBox(height: 16);
const gapH20 = SizedBox(height: 20);
const gapH24 = SizedBox(height: 24);

const gapW4 = SizedBox(width: 4);
const gapW8 = SizedBox(width: 8);
const gapW12 = SizedBox(width: 12);
const gapW16 = SizedBox(width: 16);
const gapW20 = SizedBox(width: 20);
const gapW24 = SizedBox(width: 24);

extension GapExtension on num {
  SizedBox get toGapH => SizedBox(height: toDouble());

  SizedBox get toGapW => SizedBox(width: toDouble());
}
