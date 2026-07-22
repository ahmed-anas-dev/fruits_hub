
import 'package:fruits_hub/core/entity/product_entity.dart';

ProductEntity getDummyProdust(){

  return ProductEntity(
      code: "123",
      name: "test",
      description: "test",
      price: 100,
      imageurl: null,
      expirationsMonths: 1,
      isOrganic: true,
      numberOfCalories: 100,
      unitAmount: 1,
      isFeatured: true,
      reviews: [],
  );
}
List<ProductEntity>getDummyProdusts(){
  return [
    getDummyProdust(),
    getDummyProdust(),
    getDummyProdust(),
    getDummyProdust(),
    getDummyProdust(),  
    
    


    ];

}

  

