import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Layout Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'SourGummy', // Default font set to SourGummy
    ),
    home: Scaffold(
   appBar: AppBar(
  backgroundColor: Colors.blue, 
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.blue, 
    statusBarBrightness: Brightness.light, 
    statusBarIconBrightness: Brightness.light, 
  ),
  title: const Text('Basic Layout', style: TextStyle(color: Colors.white)),
),

      body: ListView(
        children: [
          // First Horizontal Scroller with remote images
          SizedBox(
            height: 350,width: 700,
            child: RemoteImageScroller(),
          ),
          const SizedBox(height: 8), 

          // ListTiles with different font variations
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16), 
            child: Container(
              color: Colors.lightBlueAccent, // Background color
              child: const ListTile(
                leading: Icon(Icons.star),
                title: Text(
                  'ListTile with Regular Font',
                  style: TextStyle(
                      fontFamily: 'SourGummy',
                      fontWeight: FontWeight.normal,
                      fontSize: 23),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10), 

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              color: Colors.lightBlueAccent,
              child: const ListTile(
                leading: CircleAvatar(child: Icon(Icons.flag_outlined)),
                title: Text(
                  'ListTile with SemiBold Font',
                  style: TextStyle(
                      fontFamily: 'SourGummy',
                      fontWeight: FontWeight.bold,
                      fontSize: 19),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10), 

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              color: Colors.lightBlueAccent,
              child: const ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'ListTile with Light Font',
                  style: TextStyle(
                      fontFamily: 'SourGummy',
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              color: Colors.lightBlueAccent,
              child: const ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'ListTile with Light Font',
                  style: TextStyle(
                      fontFamily: 'SourGummy',
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10), 

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              color: Colors.lightBlueAccent,
              child: const ListTile(
                leading: Icon(Icons.show_chart),
                title: Text(
                  'ListTile with Light Font',
                  style: TextStyle(
                      fontFamily: 'SourGummy',
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Second Horizontal Scroller with local asset images
          SizedBox(
            height: 350,
            child: AssetImageScroller(),
          ),
        ],
      ),
    ),
  );
}
}


// Horizontal scroller with remote images
class RemoteImageScroller extends StatelessWidget {
  final List<String> imageUrls = [
    'https://signsmag.com/wp-content/uploads/2020/03/Pg26-GettyImages-802249868.jpg',
    'https://catholicstand.com/wp-content/uploads/2017/02/3-crosses.jpg',
    'https://cdn.catholic.com/wp-content/uploads/AdobeStock_59111383-900x900.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imageUrls.length,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ClipRRect(
            
            child: Image.network(
              imageUrls[index],
              width: 365,
              height: 350,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  width: 300,
                  height: 350,
                  child: Center(
                  
                  ),
                );
              },
            
            ),
          ),
        );
      },
    );
  }
}

// Horizontal scroller with local asset images
class AssetImageScroller extends StatelessWidget {
  final List<String> assetPaths = [
    'assets/images/cross1.jpg',
    'assets/images/cross2.jpg',
    'assets/images/cross3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: assetPaths.length,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ClipRRect(
            
            child: Image.asset(
              assetPaths[index],
              width: 365,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
