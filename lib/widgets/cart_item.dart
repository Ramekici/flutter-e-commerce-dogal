import 'package:e_commerce_dogal_flutter/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {Key key, this.id, this.productId, this.price, this.quantity, this.title})
      : super(key: key);

  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Emin misin'),
                  content: Text('Ürünü sepetten silmek mi istiyorsunuz?'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: Text('Hayır')),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: Text('Evet'))
                  ],
                ));
      },
      direction: DismissDirection.endToStart,
      onDismissed: (ctx) {
        Provider.of<Cart>(context, listen: false).removeItems(productId);
      },
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: ListTile(
              leading: CircleAvatar(
                  child: FittedBox(
                child: Text('${price} ₺'),
              )),
              title: Text(title),
              subtitle: Text('Toplam: ${price * quantity} ₺'),
              trailing: Text('${quantity}x'),
            ),
          )),
    );
  }
}
