class Product {
  final String nama;
  final double harga;
  final String imageUrl;

  const Product({
    required this.nama, 
    required this.harga, 
    required this.imageUrl
  });

  static const List<Product> products = [
    Product(
      nama:'Blue Alien Curved Monitor 34 Inch ' , 
      harga: 5000000, 
      imageUrl: 'https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1658151680.21758095!800x800!85.png'),
    
    Product(
      nama: 'The Waduch 3000', 
      harga: 100000, 
      imageUrl: 'https://pbs.twimg.com/media/Fk9a4RnaAAEihoC.jpg'),

    Product(
      nama: 'Mouse Gimang', 
      harga: 100000444, 
      imageUrl: 'https://pbs.twimg.com/media/EC_A-4rXsAEZFsT.jpg'),    
    
  ];
}
