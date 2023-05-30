import 'package:flutter/material.dart';
import 'package:mobile_flutter/models/api/product_api.dart';
import 'package:mobile_flutter/models/product_model.dart';

enum ProductState {
  none,
  loading,
  error
}

class ProductProvider extends ChangeNotifier {

  List<ProductModel> _products = [
    const ProductModel(
      id: 'id-01',
      name: 'Xiaomi Mi Desktop Monitor 27" Xiaomi Mi Desktop Monitor 27" ',
      description: '''
Spesifikasi:

No. Produk model: RMMNT27NF
Input daya: 12V, 2A
Nilai daya*: 24W maks.
Ukuran layar: 27 inci
Ukuran layar (diagonal): 685,98mm
Dot pitch: 0,3114 x 0,3114
Kecerahan: 300cd/m2 (TYP)
Kontras: 1000:1 (TYP)
Kontras dinamis: 1000000:1
      ''',
      stock: 20,
      price: 1670000,
      imgUrl: 'https://down-id.img.susercontent.com/file/1402d21a89613a0813a8f1dbf4044ad5'
    ),
    const ProductModel(
      id: 'id-02',
      name: 'Xiaomi Mi Desktop Monitor 27"',
      description: '''
Spesifikasi:

No. Produk model: RMMNT27NF
Input daya: 12V, 2A
Nilai daya*: 24W maks.
Ukuran layar: 27 inci
Ukuran layar (diagonal): 685,98mm
Dot pitch: 0,3114 x 0,3114
Kecerahan: 300cd/m2 (TYP)
Kontras: 1000:1 (TYP)
Kontras dinamis: 1000000:1
''',
      stock: 20,
      price: 1670000,
      imgUrl: 'https://down-id.img.susercontent.com/file/1402d21a89613a0813a8f1dbf4044ad5'
    ),
    const ProductModel(
      id: 'id-03',
      name: 'Xiaomi Mi Desktop Monitor 27"',
      description: '''
Spesifikasi:

No. Produk model: RMMNT27NF
Input daya: 12V, 2A
Nilai daya*: 24W maks.
Ukuran layar: 27 inci
Ukuran layar (diagonal): 685,98mm
Dot pitch: 0,3114 x 0,3114
Kecerahan: 300cd/m2 (TYP)
Kontras: 1000:1 (TYP)
Kontras dinamis: 1000000:1
      ''',
      stock: 20,
      price: 1670000,
      imgUrl: 'https://down-id.img.susercontent.com/file/1402d21a89613a0813a8f1dbf4044ad5'
    ),
        const ProductModel(
      id: 'id-04',
      name: 'Xiaomi Mi Desktop Monitor 27"',
      description: '''
Spesifikasi:

No. Produk model: RMMNT27NF
Input daya: 12V, 2A
Nilai daya*: 24W maks.
Ukuran layar: 27 inci
Ukuran layar (diagonal): 685,98mm
Dot pitch: 0,3114 x 0,3114
Kecerahan: 300cd/m2 (TYP)
Kontras: 1000:1 (TYP)
Kontras dinamis: 1000000:1
      ''',
      stock: 20,
      price: 1670000,
      imgUrl: 'https://down-id.img.susercontent.com/file/1402d21a89613a0813a8f1dbf4044ad5'
    ),
        const ProductModel(
      id: 'id-05',
      name: 'Xiaomi Mi Desktop Monitor 27"',
      description: '''
Spesifikasi:

No. Produk model: RMMNT27NF
Input daya: 12V, 2A
Nilai daya*: 24W maks.
Ukuran layar: 27 inci
Ukuran layar (diagonal): 685,98mm
Dot pitch: 0,3114 x 0,3114
Kecerahan: 300cd/m2 (TYP)
Kontras: 1000:1 (TYP)
Kontras dinamis: 1000000:1
      ''',
      stock: 20,
      price: 1670000,
      imgUrl: 'https://down-id.img.susercontent.com/file/1402d21a89613a0813a8f1dbf4044ad5'
    ),
        const ProductModel(
      id: 'id-06',
      name: 'Xiaomi Mi Desktop Monitor 27"',
      description: '''
Spesifikasi:

No. Produk model: RMMNT27NF
Input daya: 12V, 2A
Nilai daya*: 24W maks.
Ukuran layar: 27 inci
Ukuran layar (diagonal): 685,98mm
Dot pitch: 0,3114 x 0,3114
Kecerahan: 300cd/m2 (TYP)
Kontras: 1000:1 (TYP)
Kontras dinamis: 1000000:1
      ''',
      stock: 20,
      price: 1670000,
      imgUrl: 'https://down-id.img.susercontent.com/file/1402d21a89613a0813a8f1dbf4044ad5'
    ),
        const ProductModel(
      id: 'id-07',
      name: 'Xiaomi Mi Desktop Monitor 27"',
      description: '''
Spesifikasi:

No. Produk model: RMMNT27NF
Input daya: 12V, 2A
Nilai daya*: 24W maks.
Ukuran layar: 27 inci
Ukuran layar (diagonal): 685,98mm
Dot pitch: 0,3114 x 0,3114
Kecerahan: 300cd/m2 (TYP)
Kontras: 1000:1 (TYP)
Kontras dinamis: 1000000:1
      ''',
      stock: 20,
      price: 1670000,
      imgUrl: 'https://down-id.img.susercontent.com/file/1402d21a89613a0813a8f1dbf4044ad5'
    ),
        const ProductModel(
      id: 'id-08',
      name: 'Xiaomi Mi Desktop Monitor 27"',
      description: '''
Spesifikasi:

No. Produk model: RMMNT27NF
Input daya: 12V, 2A
Nilai daya*: 24W maks.
Ukuran layar: 27 inci
Ukuran layar (diagonal): 685,98mm
Dot pitch: 0,3114 x 0,3114
Kecerahan: 300cd/m2 (TYP)
Kontras: 1000:1 (TYP)
Kontras dinamis: 1000000:1
      ''',
      stock: 20,
      price: 1670000,
      imgUrl: 'https://down-id.img.susercontent.com/file/1402d21a89613a0813a8f1dbf4044ad5'
    ),
        const ProductModel(
      id: 'id-09',
      name: 'Xiaomi Mi Desktop Monitor 27"',
      description: '''
Spesifikasi:

No. Produk model: RMMNT27NF
Input daya: 12V, 2A
Nilai daya*: 24W maks.
Ukuran layar: 27 inci
Ukuran layar (diagonal): 685,98mm
Dot pitch: 0,3114 x 0,3114
Kecerahan: 300cd/m2 (TYP)
Kontras: 1000:1 (TYP)
Kontras dinamis: 1000000:1
      ''',
      stock: 20,
      price: 1670000,
      imgUrl: 'https://down-id.img.susercontent.com/file/1402d21a89613a0813a8f1dbf4044ad5'
    ),
        const ProductModel(
      id: 'id-10',
      name: 'Xiaomi Mi Desktop Monitor 27"',
      description: '''
Spesifikasi:

No. Produk model: RMMNT27NF
Input daya: 12V, 2A
Nilai daya*: 24W maks.
Ukuran layar: 27 inci
Ukuran layar (diagonal): 685,98mm
Dot pitch: 0,3114 x 0,3114
Kecerahan: 300cd/m2 (TYP)
Kontras: 1000:1 (TYP)
Kontras dinamis: 1000000:1
      ''',
      stock: 20,
      price: 1670000,
      imgUrl: 'https://down-id.img.susercontent.com/file/1402d21a89613a0813a8f1dbf4044ad5'
    ),
  ];
  ProductState _state = ProductState.none;

  List<ProductModel> get products => _products;
  ProductState get state => _state;

  Future<void> getAllProducts() async {
    setProductState(state: ProductState.loading);
    ProductAPI api = ProductAPI();
    _products = await api.getAllProducts();
    if (_products.isEmpty) {
      setProductState(state: ProductState.error);
    } else {
      setProductState(state: ProductState.none);
    }
  }

  void setProductState({required ProductState state}) {
    _state = state;
    notifyListeners();
  }

}