class CustomeService{

  double GetPercentage(double mainPrice, double discountPrice){
    return double.parse(((mainPrice-discountPrice)/100).toStringAsFixed(2));
  }

}