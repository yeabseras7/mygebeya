import 'package:flutter/material.dart';
import 'package:mygebeya/screens/home/home2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeDetail(),
                        ),
                      );
                    },
                    child: Image(
                      image: const AssetImage(
                        'assets/images/bg1.png',
                      ),
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Text(
                      'New collection',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 423,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 211.5,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width / 2,
                          child: const Center(
                            child: Text(
                              'Summer \nsale',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/images/black1.png',
                              ),
                              height: 211.5,
                              width: MediaQuery.of(context).size.width / 2,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              'Black',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image(
                          image: const AssetImage(
                            "assets/images/hoodieman.png",
                          ),
                          width: MediaQuery.of(context).size.width / 2,
                          fit: BoxFit.cover,
                        ),
                        const Text(
                          'Men\'s \nhoodies',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
              size: 30,
            ),
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.shopping_cart,
              color: Colors.blue,
              size: 30,
            ),
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.shopping_bag,
              color: Colors.blue,
              size: 30,
            ),
            icon: Icon(
              Icons.shopping_bag_outlined,
              size: 30,
            ),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.favorite,
              color: Colors.blue,
              size: 30,
            ),
            icon: Icon(
              Icons.favorite_border,
              size: 30,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.account_circle,
              color: Colors.blue,
              size: 30,
            ),
            icon: Icon(
              Icons.account_circle_outlined,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
