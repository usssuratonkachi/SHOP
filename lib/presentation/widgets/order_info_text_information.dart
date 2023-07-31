import 'package:flutter/material.dart';

class OrderInfoTextInformation extends StatelessWidget {
  const OrderInfoTextInformation({super.key,
    required this.orderId,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.totalPrice,
    required this.status});

  final int? orderId;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final int? totalPrice;
  final String? status;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 350,
        height: 250,
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          child: Wrap(
            direction: Axis.vertical,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 10,
            children: [
              RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(
                            text: 'номер заказа:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: ' '),
                        TextSpan(text: '$orderId'),
                      ])),
              const Text(
                'Контактная информация:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('имя: $name'),
              Text('адрес: $address'),
              Text('телефон: $phone'),
              Text('email: $email'),
              RichText(
                  text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(
                            text: 'сумма заказа:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const TextSpan(text: ' '),
                        TextSpan(text: '$totalPrice'),
                      ])),
              const Text(
                'статус заказа:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('$status')
            ],
          ),
        ),
      ),
    );
  }
}
