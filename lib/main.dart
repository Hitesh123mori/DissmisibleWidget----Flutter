import 'package:flutter/material.dart' ;

void main(){
  runApp(Myapp()) ;
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  List<String> fruits = ["Orange",'Apple',"Banana","Mango" ,"Grape","apple"] ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple
        ) ,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Dismissible"),
        ),

        body: ListView.builder(itemCount: fruits.length,
        itemBuilder: (context,index)
        {
          final fruit = fruits[index] ;
          return Dismissible(
            onDismissed: (direction){
              if(direction==DismissDirection.startToEnd){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(fruits[index]),
                backgroundColor: Colors.red
                  ,),) ;

              }
              else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(action: SnackBarAction(
                label: "undo",
                onPressed: (){
                  print(fruit[index]) ;
                },
              ),
                content: Text(fruits[index]),
              backgroundColor: Colors.green
              ,),) ;

              }
            },
              key: Key(fruit),
              background : Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 320.0),
                  child: Icon(Icons.delete,),
                ),
                color: Colors.red ,
              ) ,
            child:

              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Card(
                  color: Colors.orange,
                  child: ListTile(
                    title: Text(fruits[index],) ,
                  ),
                ),
              ) ) ;
        },),
      ),
    );
  }
}
