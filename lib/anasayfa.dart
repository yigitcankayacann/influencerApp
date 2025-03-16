import 'package:flutter/material.dart';
import 'package:influencer/renkler.dart';
import 'package:influencer/components/filter_button.dart';
import 'package:influencer/components/search_field.dart';
import 'package:influencer/components/category_list.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      appBar: AppBar(
        title: Text("Influencer" , style: TextStyle(color: beyaz),),
        backgroundColor: koyuMavi,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: FilterButton(isBorder: true),
          ),
        ],
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
                const SecondarySearchField(),
                const SizedBox(height: 16),
                const CategoryListView(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: null,
    );
  }
}