import 'package:flutter/material.dart';
import 'package:influencer/renkler.dart';

class Filtre extends StatefulWidget {
  const Filtre({super.key});

  @override
  State<Filtre> createState() => _FiltreState();
}

class _FiltreState extends State<Filtre> {
  RangeValues _takipciAraligi = const RangeValues(0, 1000000);
  String _secilenCinsiyet = 'Tümü';
  final List<String> _cinsiyetler = ['Tümü', 'Kadın', 'Erkek'];
  final List<String> _kategoriler = [
    'Makyaj',
    'Araba',
    'Teknoloji',
    'Moda',
    'Spor',
    'Yemek',
    'Seyahat',
    'Oyun'
  ];
  final Set<String> _secilenKategoriler = {};
  final TextEditingController _aramaController = TextEditingController();

  @override
  void dispose() {
    _aramaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beyaz,
      appBar: AppBar(
        title: Text('Filtrele', style: TextStyle(color: beyaz)),
        backgroundColor: koyuMavi,
        leading: IconButton(
          icon: Icon(Icons.close, color: beyaz),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ürününüz',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: siyah,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: acikGri,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _aramaController,
                      style: TextStyle(fontSize: 16, color: siyah),
                      decoration: InputDecoration(
                        hintText: 'Reklam vermek istediğiniz ürünü giriniz.',
                        hintStyle: TextStyle(color: siyah, fontSize: 14),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Takipçi Sayısı',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: siyah,
                    ),
                  ),
                  const SizedBox(height: 16),
                  RangeSlider(
                    values: _takipciAraligi,
                    min: 0,
                    max: 1000000,
                    divisions: 100,
                    activeColor: koyuMavi,
                    inactiveColor: acikGri,
                    labels: RangeLabels(
                      '${_takipciAraligi.start.round()}',
                      '${_takipciAraligi.end.round()}',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _takipciAraligi = values;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Min: ${_takipciAraligi.start.round()}',
                        style: TextStyle(color: koyuGri),
                      ),
                      Text(
                        'Max: ${_takipciAraligi.end.round()}',
                        style: TextStyle(color: koyuGri),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Cinsiyet',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: siyah,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: _cinsiyetler.map((cinsiyet) {
                      return ChoiceChip(
                        label: Text(cinsiyet),
                        selected: _secilenCinsiyet == cinsiyet,
                        onSelected: (selected) {
                          setState(() {
                            _secilenCinsiyet = cinsiyet;
                          });
                        },
                        selectedColor: koyuMavi,
                        backgroundColor: acikGri,
                        labelStyle: TextStyle(
                          color: _secilenCinsiyet == cinsiyet ? beyaz : siyah,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Kategori',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: siyah,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _kategoriler.map((kategori) {
                      return FilterChip(
                        label: Text(kategori),
                        selected: _secilenKategoriler.contains(kategori),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              _secilenKategoriler.add(kategori);
                            } else {
                              _secilenKategoriler.remove(kategori);
                            }
                          });
                        },
                        selectedColor: koyuMavi,
                        backgroundColor: acikGri,
                        labelStyle: TextStyle(
                          color: _secilenKategoriler.contains(kategori)
                              ? beyaz
                              : siyah,
                        ),
                        checkmarkColor: beyaz,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: beyaz,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(26),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: koyuGri),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'İptal',
                  style: TextStyle(
                    color: koyuGri,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Burada filtreleme sonuçlarını döndürebiliriz
                  Navigator.pop(context, {
                    'takipci_araligi': _takipciAraligi,
                    'cinsiyet': _secilenCinsiyet,
                    'kategoriler': _secilenKategoriler.toList(),
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: koyuMavi,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Ara',
                  style: TextStyle(
                    color: beyaz,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 