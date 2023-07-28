import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopcard/CartProvider.dart';
import 'package:shopcard/card.dart';
import 'package:shopcard/cartScreen.dart';
import 'package:shopcard/items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      
    
   
      theme: ThemeData(
        
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        
      ),
      home:  MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        appBar: AppBar(
          
          actions: 
            badge(
     badgeContent: Consumer<CartProvider>(
       builder: (context, value, child) {
         return Text(
           value.getCounter().toString(),
           style: const TextStyle(
               color: Colors.white, fontWeight: FontWeight.bold),
         );
       },
     ),
     position:  BadgePosition.bottomEnd( bottom: 30), child:
            IconButton(onPressed: (){
            
         Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) => const CartScreen()));
       
            
            }, icon: Icon(Icons.card_membership)),
    
   ),
  
        
 centerTitle: true,
 title: Text('Product List'),
 
 
),
        body: ListView.builder(
   padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
   shrinkWrap: true,
   itemCount: products.length,
   itemBuilder: (context, index) {
     return Card(
       color: Colors.blueGrey.shade200,
       elevation: 5.0,
       child: Padding(
         padding: const EdgeInsets.all(4.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           mainAxisSize: MainAxisSize.max,
           children: [
             Image(
               height: 80,
               width: 80,
               image: AssetImage(products[index].image.toString()),
             ),
             SizedBox(
               width: 130,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const SizedBox(
                     height: 5.0,
                   ),
                   RichText(
                     overflow: TextOverflow.ellipsis,
                     maxLines: 1,
                     text: TextSpan(
                         text: 'Name: ',
                         style: TextStyle(
                             color: Colors.blueGrey.shade800,
                             fontSize: 16.0),
                         children: [
                           TextSpan(
                               text:
                                   '${products[index].name.toString()}\n',
                               style: const TextStyle(
                                   fontWeight: FontWeight.bold)),
                         ]),
                   ),
                   RichText(
                     maxLines: 1,
                     text: TextSpan(
                         text: 'Unit: ',
                         style: TextStyle(
                             color: Colors.blueGrey.shade800,
                             fontSize: 16.0),
                         children: [
                           TextSpan(
                               text:
                                   '${products[index].unit.toString()}\n',
                               style: const TextStyle(
                                   fontWeight: FontWeight.bold)),
                         ]),
                   ),
                   RichText(
                     maxLines: 1,
                     text: TextSpan(
                         text: 'Price: ' r"$",
                         style: TextStyle(
                             color: Colors.blueGrey.shade800,
                             fontSize: 16.0),
                         children: [
                           TextSpan(
                               text:
                                   '${products[index].price.toString()}\n',
                               style: const TextStyle(
                                   fontWeight: FontWeight.bold)),
                         ]),
                   ),
                 ],
               ),
             ),
             ElevatedButton(
                 style: ElevatedButton.styleFrom(
                     primary: Colors.blueGrey.shade900),
                 onPressed: () {
                   saveData(index);
                 },
                 child: const Text('Add to Cart')),
                 
           ],
         ),
       ),
     );
   }),
      ),actions: 
            badge(
     badgeContent: Consumer<CartProvider>(
       builder: (context, value, child) {
         return Text(
           value.getCounter().toString(),
           style: const TextStyle(
               color: Colors.white, fontWeight: FontWeight.bold),
         );
       },
     ),
     position:  BadgePosition.bottomEnd( bottom: 30), child:
            IconButton(onPressed: (){
            
         Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) => const CartScreen()));
       
            
            }, icon: Icon(Icons.card_membership)),
    ));
  }
}

badge({required Consumer<CartProvider> badgeContent, required BadgePosition position, required IconButton child}) {
}

