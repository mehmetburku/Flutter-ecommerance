
class Clothes{
  String? productName;
  String? price;
  String? imageUrl;



  Clothes(
    this.productName, 
    this.price, 
    this.imageUrl,
  );
  static List<Clothes> generateClothes(){
    return [
      Clothes('Gucci oversize', '170.99TL', 'assets/images/arrival1.png',),
      Clothes('T-shirt oversize', '280.99TL', 'assets/images/arrival2.png',),




      ];
  }
}