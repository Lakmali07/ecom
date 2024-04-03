
import 'package:http/http.dart' as http;

class ProductRepository{

  ProductRepository();

  Future<dynamic> getProducts()async{
    try {
      final response = await http.get(
        Uri.parse(
          'https://8c155025-93d6-4ead-a36d-9afdf9c1f291.mock.pstmn.io/recommend/items?page={{int}}',
        ),
      );
      return response;
    } catch (e) {
      print(e.toString());
      return e;
    }
  }
}