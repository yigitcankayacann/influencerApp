import 'package:flutter/material.dart';
import 'package:influencer/renkler.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'title': 'En popüler',
      'profiles': [
        {'name': 'Ayşe Yılmaz', 'image': 'https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg'},
        {'name': 'Zeynep Kaya', 'image': 'https://images.pexels.com/photos/1759531/pexels-photo-1759531.jpeg'},
        {'name': 'Merve Demir', 'image': 'https://images.pexels.com/photos/1758845/pexels-photo-1758845.jpeg'},
        {'name': 'Elif Yıldız', 'image': 'https://images.pexels.com/photos/1758144/pexels-photo-1758144.jpeg'},
      ]
    },
    {
      'title': 'En yeni',
      'profiles': [
        {'name': 'Ahmet Yıldız', 'image': 'https://images.pexels.com/photos/846741/pexels-photo-846741.jpeg'},
        {'name': 'Mehmet Demir', 'image': 'https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg'},
        {'name': 'Can Özdemir', 'image': 'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg'},
        {'name': 'Murat Kaya', 'image': 'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg'},
      ]
    },
    {
      'title': 'En çok takip edilen',
      'profiles': [
        {'name': 'Ali Yılmaz', 'image': 'https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg'},
        {'name': 'Burak Kaya', 'image': 'https://images.pexels.com/photos/2182970/pexels-photo-2182970.jpeg'},
        {'name': 'Cem Özkan', 'image': 'https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg'},
        {'name': 'Deniz Acar', 'image': 'https://images.pexels.com/photos/1520760/pexels-photo-1520760.jpeg'},
      ]
    },
    {
      'title': 'En çok yorum alan',
      'profiles': [
        {'name': 'Selin Demir', 'image': 'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg'},
        {'name': 'Aylin Çelik', 'image': 'https://images.pexels.com/photos/1462637/pexels-photo-1462637.jpeg'},
        {'name': 'Ceyda Yılmaz', 'image': 'https://images.pexels.com/photos/1587009/pexels-photo-1587009.jpeg'},
      ]
    },
    {
      'title': 'En çok paylaşan',
      'profiles': [
        {'name': 'Emre Yıldız', 'image': 'https://images.pexels.com/photos/1547248/pexels-photo-1547248.jpeg'},
        {'name': 'Kemal Kaya', 'image': 'https://images.pexels.com/photos/1756959/pexels-photo-1756959.jpeg'},
        {'name': 'Ozan Demir', 'image': 'https://images.pexels.com/photos/927437/pexels-photo-927437.jpeg'},
      ]
    },
    {
      'title': 'En çok görüntülenen',
      'profiles': [
        {'name': 'Berk Şef', 'image': 'https://images.pexels.com/photos/887827/pexels-photo-887827.jpeg'},
        {'name': 'Aslı Yılmaz', 'image': 'https://images.pexels.com/photos/3338681/pexels-photo-3338681.jpeg'},
        {'name': 'Mert Aşçı', 'image': 'https://images.pexels.com/photos/3814446/pexels-photo-3814446.jpeg'},
      ]
    },
    {
      'title': 'En çok yorum alan',
      'profiles': [
        {'name': 'Kerem Gezgin', 'image': 'https://images.pexels.com/photos/1851164/pexels-photo-1851164.jpeg'},
        {'name': 'Nil Yörük', 'image': 'https://images.pexels.com/photos/2106685/pexels-photo-2106685.jpeg'},
        {'name': 'Yağmur Doğa', 'image': 'https://images.pexels.com/photos/1371360/pexels-photo-1371360.jpeg'},
      ]
    },
    {
      'title': 'En çok görüntülenen',
      'profiles': [
        {'name': 'Yiğit Gamer', 'image': 'https://images.pexels.com/photos/1205033/pexels-photo-1205033.jpeg'},
        {'name': 'Efe Pro', 'image': 'https://images.pexels.com/photos/1174746/pexels-photo-1174746.jpeg'},
        {'name': 'Kaan Player', 'image': 'https://images.pexels.com/photos/1298601/pexels-photo-1298601.jpeg'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, categoryIndex) {
        final category = categories[categoryIndex];
        final profiles = category['profiles'] as List?;
        
        if (profiles == null || profiles.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 8.0),
              child: Text(
                category['title'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: siyah,
                ),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                clipBehavior: Clip.none,
                itemCount: profiles.length,
                itemBuilder: (context, profileIndex) {
                  final profile = profiles[profileIndex];
                  return Padding(
                    padding: EdgeInsets.only(left: profileIndex == 0 ? 8.0 : 0, right: 8.0),
                    child: Container(
                      width: 140,
                      margin: const EdgeInsets.only(right: 8.0),
                      decoration: BoxDecoration(
                        color: siyah,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(77),
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
                            profile['image'],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: koyuGri,
                                child: Icon(Icons.person, color: beyaz, size: 50),
                              );
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withAlpha(180),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 8,
                            right: 8,
                            child: Text(
                              profile['name'],
                              style: TextStyle(
                                color: beyaz,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
} 