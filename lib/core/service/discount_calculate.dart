import 'package:logger/logger.dart';

double calculateDiscountPercentage(double mainPrice, double discountPrice) {
  Logger().w(discountPrice);
  if (mainPrice == 0.0 ||discountPrice == 0.0 ||mainPrice==discountPrice) return 0;
  return ((1 - (discountPrice / mainPrice)) * 100).roundToDouble();
}
