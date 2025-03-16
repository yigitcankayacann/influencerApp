import 'package:flutter/material.dart';
import 'package:influencer/renkler.dart';

class Kategoriler extends StatefulWidget {
  const Kategoriler({super.key});

  @override
  State<Kategoriler> createState() => _KategorilerState();
}

class _KategorilerState extends State<Kategoriler> {
  final List<Map<String, dynamic>> categories = const [
    {
      'title': 'Tümü',
      'image': 'https://images.pexels.com/photos/1037992/pexels-photo-1037992.jpeg',
      'count': 55
    },
    {
      'title': 'Makyaj',
      'image': 'https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg',
      'count': 4
    },
    {
      'title': 'Araba',
      'image': 'https://images.pexels.com/photos/846741/pexels-photo-846741.jpeg',
      'count': 4
    },
    {
      'title': 'Teknoloji',
      'image': 'https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg',
      'count': 4
    },
    {
      'title': 'Moda',
      'image': 'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg',
      'count': 3
    },
    {
      'title': 'Spor',
      'image': 'https://images.pexels.com/photos/1547248/pexels-photo-1547248.jpeg',
      'count': 3
    },
    {
      'title': 'Yemek',
      'image': 'https://images.pexels.com/photos/887827/pexels-photo-887827.jpeg',
      'count': 3
    },
    {
      'title': 'Seyahat',
      'image': 'https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg',
      'count': 3
    },
    {
      'title': 'Oyun',
      'image': 'https://images.pexels.com/photos/1205033/pexels-photo-1205033.jpeg',
      'count': 3
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      appBar: AppBar(
        title: Text("Kategoriler", style: TextStyle(color: beyaz)),
        backgroundColor: koyuMavi,
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              koyuMavi,
              beyaz,
            ],
            stops: const [0.0, 0.2],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(40),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            category['image'],
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withAlpha(160),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            left: 12,
                            right: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  category['title'],
                                  style: TextStyle(
                                    color: beyaz,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${category['count']} influencer',
                                  style: TextStyle(
                                    color: beyaz.withAlpha(200),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: null,
    );
  }
} 