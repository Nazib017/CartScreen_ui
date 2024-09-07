import 'package:flutter/material.dart';
import 'package:update_ui/service.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  List<CartItem> item = [
    CartItem(
        TshirtTitle: "Pullover",
        TshirtColor: "Black",
        TshirtSize: "L",
        TshirtQuantity: 1,
        perTshirtPrice: 51),
    CartItem(
        TshirtTitle: "T-Shirt",
        TshirtColor: "Gray",
        TshirtSize: "L",
        TshirtQuantity: 1,
        perTshirtPrice: 30),
    CartItem(
        TshirtTitle: "Sport Dress",
        TshirtColor: "Black",
        TshirtSize: "M",
        TshirtQuantity: 1,
        perTshirtPrice: 43),
  ];

  int calculateTotalCartPrice() {
    int totalCartPrice = 0;
    for (var cartItem in item) {
      totalCartPrice += cartItem.totalPrice;
    }

    return totalCartPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: buildListView(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total amount:",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "${calculateTotalCartPrice()}\$",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildCheckOutButton(context),
          ),
        ],
      ),
    );
  }

  Widget buildCheckOutButton(BuildContext context) {
    return SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Check Out Successful")));
              },
              child: const Text(
                "Check Out",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
            ),
          );
  }

  Widget buildListView() {
    return ListView.separated(
        itemBuilder: (context, index) {
          CartItem items = item[index];

          return ListTile(
            leading: buildImage(),
            title: Text(
              "${items.TshirtTitle}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(children: [
              Row(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Color: ",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    TextSpan(
                        text: items.TshirtColor,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.black))
                  ])),
                  const SizedBox(
                    width: 20,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "Size: ",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    TextSpan(
                        text: items.TshirtSize,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.black))
                  ])),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (item[index].TshirtQuantity > 1) {
                          item[index].TshirtQuantity--;
                        }
                      });
                    },
                    child: const Text(
                      "-",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text("${items.TshirtQuantity}"),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        item[index].TshirtQuantity++;
                      });
                    },
                    child: const Text(
                      "+",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                  ),
                ],
              )
            ]),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.more_vert),
                Text(
                  "${items.totalPrice}\$",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 20,
          );
        },
        itemCount: 3);
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Cart Screen"),
      centerTitle: true,
    );
  }

  Widget buildImage() {
    return Image.network(
      "https://tse2.mm.bing.net/th?id=OIP.WAPLqRJ2jyWMWAqyPXDeLgHaHh&pid=Api&P=0&h=220",
      height: 100,
      fit: BoxFit.fitHeight,
    );
  }
}
