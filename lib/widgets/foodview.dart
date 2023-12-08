import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:search/provider/foood_provider.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    
    final provider = Provider.of<ProductProvider>(context, listen: false);
    return Consumer(
            builder: (context, ProductProvider petsProvider, child){
               final products = petsProvider.serachedProduct.food;
              return   Container(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemCount: petsProvider.serachedProduct.food.length,
                    itemBuilder: (context, index) {
                      final product = products![index];
                      return Column(
                        children: [
                          Expanded(child: Image.network(petsProvider.serachedProduct.food[index].image), ),
                         
                                Text(petsProvider.serachedProduct.food[index].productName),
                                Text(petsProvider.serachedProduct.food[index].price)
                        ],
                      );

              } 
            ),
                   );
              }
                );
            }
               
        
     
  }
