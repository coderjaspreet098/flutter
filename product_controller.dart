import 'package:get/get.dart';
import 'product_service.dart';
import 'product_model.dart';

class HomeController extends GetxController {
  final data = <ProductModel>[];

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      final products1 = await DataService().fetchProducts();
      final productModels = products1.products?.map((product) {
        return ProductModel(
          products: [product],
          total: products1.total,
          skip: products1.skip,
          limit: products1.limit,
        );
      }).toList();

      if (productModels != null) {
        data.addAll(productModels);
      }
      update();
    } catch (e) {
      // Handle errors
      print(e);
    }
  }

}
