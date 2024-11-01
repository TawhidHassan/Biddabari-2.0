double calculateDiscountPercentage(double mainPrice, double discountPrice) {
  if (mainPrice == 0) return 0;
  return ((1 - (discountPrice / mainPrice)) * 100).roundToDouble();
}