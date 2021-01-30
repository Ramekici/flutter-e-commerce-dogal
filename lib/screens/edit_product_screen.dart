import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static String routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imgUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _editedProduct =
      Product(id: null, title: '', description: '', price: 0, imageurl: '');
  var _initFonk = true;
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageurl': ''
  };

  @override
  void initState() {
    print('intial');
    _imgUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('intialdii');
    if (_initFonk) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      print(productId);
      if (productId != null) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        print(_editedProduct);
        _initValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          'imageurl': ''
        };
        _imageUrlController.text = _editedProduct.imageurl;
      }
    }
    _initFonk = false;
    super.didChangeDependencies();
  }

  void _updateImageUrl() {
    if (!_imgUrlFocusNode.hasFocus) {
      if (_imageUrlController.text.isEmpty ||
          (!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('png') &&
              !_imageUrlController.text.endsWith('jpg') &&
              !_imageUrlController.text.endsWith('jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

   @override
    void dispose() {
      _imgUrlFocusNode.removeListener(_updateImageUrl);
      _priceFocusNode.dispose();
      _descFocusNode.dispose();
      _imageUrlController.dispose();
      _imgUrlFocusNode.dispose();
      super.dispose();
    }

   void _saveForm() {
      final isValid = _form.currentState.validate();
      if (!isValid) {
        return;
      }
      _form.currentState.save();
      if (_editedProduct.id != null) {
        Provider.of<Products>(context, listen: false)
            .updateProduct(_editedProduct.id, _editedProduct);
      } else {
        Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct);
      }
      Navigator.of(context).pop();
    }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.save), onPressed: _saveForm),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  initialValue: _initValues['title'],
                  decoration: InputDecoration(labelText: 'Başlık'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Başlık Alanı Boş Bırakılmamalıdır.';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _editedProduct = Product(
                        id: _editedProduct.id,
                        title: val,
                        description: _editedProduct.description,
                        price: _editedProduct.price,
                        imageurl: _editedProduct.imageurl,
                        isFavorite: _editedProduct.isFavorite);
                  },
                ),
                TextFormField(
                  initialValue: _initValues['price'],
                  decoration: InputDecoration(labelText: 'Fiyat'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Fiyat Alanı Boş Bırakılmamalıdır.';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Fiyat Alanı geçerli rakam gir.';
                    }
                    if (double.parse(value) < 0) {
                      return 'Fiyat Alanı 0 üzerinde gir.';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _editedProduct = Product(
                        id: _editedProduct.id,
                        title: _editedProduct.title,
                        description: _editedProduct.description,
                        price: double.parse(val),
                        imageurl: _editedProduct.imageurl,
                        isFavorite: _editedProduct.isFavorite);
                  },
                ),
                TextFormField(
                  initialValue: _initValues['description'],
                  decoration: InputDecoration(labelText: 'Açıklama'),
                  maxLines: 3,
                  textInputAction: TextInputAction.next,
                  focusNode: _descFocusNode,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Açıklama Alanı Boş Bırakılmamalıdır.';
                    }
                    if (value.length < 10) {
                      return '10 Karakterden fazla değer gir.';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _editedProduct = Product(
                        id: _editedProduct.id,
                        title: _editedProduct.title,
                        description: val,
                        price: _editedProduct.price,
                        imageurl: _editedProduct.imageurl,
                        isFavorite: _editedProduct.isFavorite);
                  },
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(top: 8, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          )),
                          child: _imageUrlController.text.isEmpty
                              ? Text('Geçerli Url Adresi girin')
                              : FittedBox(
                                  child: Image.network(
                                  _imageUrlController.text,
                                  fit: BoxFit.cover,
                                ))),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Resim Url'),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.url,
                          controller: _imageUrlController,
                          focusNode: _imgUrlFocusNode,
                          onSaved: (val) {
                            _editedProduct = Product(
                                id: _editedProduct.id,
                                title: _editedProduct.title,
                                description: _editedProduct.description,
                                price: _editedProduct.price,
                                imageurl: val,
                                isFavorite: _editedProduct.isFavorite);
                          },
                          onFieldSubmitted: (_) {
                            _saveForm();
                          },
                        ),
                      ),
                    ])
              ],
            ),
          ),
        ));
  }
}
