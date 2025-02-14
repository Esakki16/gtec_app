import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 236, 234, 234),
          child: Icon(Icons.apps, color: Colors.pink),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Esakkiraja",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              "Esakkiraja",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink.shade200),
                child: Icon(
                  Icons.sort,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                height: 175,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                    color: Colors.pink.shade200,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: [
                    Expanded(flex: 3, child: Container()),
                    Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Big Sale",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              Text(
                                "jhvadjhw dsjcbhdihbc djbhciwbc dsjcbsdyuc sdncbvuydvhfkjn dsvibgsduycgs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Positioned(
                left: 30,
                top: 5,
                child: Image.asset(
                  "assets/img1.png",
                  height: 200,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
