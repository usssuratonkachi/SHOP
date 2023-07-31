import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:shop/presentation/cubits/order_cubit/order_cubit.dart';
import 'package:shop/presentation/widgets/input_fields.dart';
import 'package:shop/presentation/widgets/order_page_message.dart';

class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => OrderCubit(context.read<OrderRepository>()))
    ], child: const CreateOrderPageView());
  }
}

class CreateOrderPageView extends StatefulWidget {
  const CreateOrderPageView({super.key});

  @override
  State<CreateOrderPageView> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPageView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 0,
        title: const Text('Заказ'),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
        return SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: height / 1.8 ,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InputField(
                      labelText: 'name',
                      controller: _nameController,
                      width: 250,
                    ),
                    InputField(
                        labelText: 'address',
                        controller: _addressController,
                        textInputType: TextInputType.streetAddress,
                        width: 250),
                    InputField(
                        labelText: 'phone',
                        controller: _phoneController,
                        textInputType: TextInputType.phone,
                        width: 250),
                    InputField(
                        labelText: 'email',
                        controller: _emailController,
                        textInputType: TextInputType.emailAddress,
                        width: 250),
                    InputField(
                        labelText: 'comment',
                        controller: _commentController,
                        width: 250),
                    SizedBox(
                        width: 100,
                        height: 30,
                        child: CupertinoButton(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 5),
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(80),
                            child: const Text('заказать'),
                            onPressed: () {
                              context.read<OrderCubit>().createOrder(
                                  name: _nameController.text.trim(),
                                  address: _addressController.text.trim(),
                                  phone: _phoneController.text.trim(),
                                  email: _emailController.text.trim(),
                                  comment: _commentController.text.trim());
                              setState(() {});
                            })),
                  ],
                ),
              ),
            ),
            const OrderPageMessage()
          ]),
        );
      }),
    );
  }
}
