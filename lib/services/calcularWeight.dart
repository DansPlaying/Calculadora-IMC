import 'dart:math';

List<double> weightFromTwoStrings(
    {double weight, double size, int idealWeight}) {
  int decimals = 2;
  int fad = pow(10, decimals);

  if (weight != 0 && size != 0 && weight * 100 > 100 && size > 140) {
    double heightUsed = (size / 100) * 2;
    double d = weight / heightUsed;
    d = (d * fad).round() / fad;

    double suggested = (idealWeight * weight) / d;
    suggested = (suggested * fad).round() / fad;

    return [suggested, d];
  }

  return [0, 0];
}
