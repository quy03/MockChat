class Massage {
  late final String name;
  late final double rating, price;

  Massage({
    required this.name,
    required this.price,
    this.rating = 0.0,
  });
}

List<Massage> demoMassage = [];
