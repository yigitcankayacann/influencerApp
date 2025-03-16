import 'package:flutter/material.dart';
import 'package:influencer/renkler.dart';

class SecondarySearchField extends StatefulWidget {
  const SecondarySearchField({super.key});

  @override
  State<SecondarySearchField> createState() => _SecondarySearchFieldState();
}

class _SecondarySearchFieldState extends State<SecondarySearchField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      radius: 10,
      color: siyah,
      child: TextField(
        onChanged: (value) {},
        style: TextStyle(fontSize: 16, color: beyaz),
        textAlignVertical: TextAlignVertical.center,
        controller: TextEditingController(),
        focusNode: _focusNode,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 3),
          border: InputBorder.none,
          suffixIcon: Container(
            width: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _isFocused ? acikMavi : koyuGri,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Icon(
              Icons.search,
              color: beyaz,
              size: 24,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: acikMavi),
          ),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: 'Reklam vermek istediğiniz ürün',
          hintStyle: TextStyle(fontSize: 14, color: koyuGri),
        ),
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  
  const PrimaryContainer({
    super.key,
    this.radius,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? siyah,
        borderRadius: BorderRadius.circular(radius ?? 30),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black.withAlpha(77),
          ),
        ],
      ),
      child: child,
    );
  }
} 