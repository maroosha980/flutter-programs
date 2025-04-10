import 'package:flutter/material.dart';


class MyShopPage extends StatelessWidget {
  const MyShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MY SHOP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const VerticalPicsScreen(),
                      ),
                    );
                  },
                  child: const Text('Vertical Pics'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HorizontalPicsScreen(),
                      ),
                    );
                  },
                  child: const Text('Horizontal Pics'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CircularPicsScreen(),
                      ),
                    );
                  },
                  child: const Text('Circular Form Pics'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Sample university image URLs
const List<String> verticalUrls = [
  'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',
  'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',
  'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',
  'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',
  'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',
  'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',
  'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',
  'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',
'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',

];

const List<String> horizontalUrls = [
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',

];

const List<String> circularUrls = [
'https://images.ctfassets.net/hrltx12pl8hq/3Z1N8LpxtXNQhBD5EnIg8X/975e2497dc598bb64fde390592ae1133/spring-images-min.jpg',
  'https://images.pexels.com/photos/2325447/pexels-photo-2325447.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.ctfassets.net/hrltx12pl8hq/3Z1N8LpxtXNQhBD5EnIg8X/975e2497dc598bb64fde390592ae1133/spring-images-min.jpg',
  'https://images.ctfassets.net/hrltx12pl8hq/3Z1N8LpxtXNQhBD5EnIg8X/975e2497dc598bb64fde390592ae1133/spring-images-min.jpg',
  'https://images.ctfassets.net/hrltx12pl8hq/3Z1N8LpxtXNQhBD5EnIg8X/975e2497dc598bb64fde390592ae1133/spring-images-min.jpg',
  'https://images.pexels.com/photos/2325447/pexels-photo-2325447.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2325447/pexels-photo-2325447.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2325447/pexels-photo-2325447.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2325447/pexels-photo-2325447.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2325447/pexels-photo-2325447.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2325447/pexels-photo-2325447.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',



];

class VerticalPicsScreen extends StatelessWidget {
  const VerticalPicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vertical Pics")),
      body: ListView.builder(
        itemCount: verticalUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            //child: Image.network(verticalUrls[index]),
            child: Image.network(
              verticalUrls[index],
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, color: Colors.red);
              },
            ),

          );
        },
      ),
    );
  }
}

class HorizontalPicsScreen extends StatelessWidget {
  const HorizontalPicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Horizontal Pics")),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: horizontalUrls.map((url) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              //child: Image.network(
               // url,
                //height: 200,
              //),
              child: Image.network(
                url,
                height: 200,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: Colors.red);
                },
              ),

            );
          }).toList(),
        ),
      ),
    );
  }
}

class CircularPicsScreen extends StatelessWidget {
  const CircularPicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Circular Form Pics")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: circularUrls.length,
        itemBuilder: (context, index) {
          return ClipOval(
            child: Image.network(
              circularUrls[index],
              fit: BoxFit.cover,
              width: 100,
              height: 100,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, color: Colors.red, size: 50);
              },
            ),
          );
        },
      ),
    );
  }
}