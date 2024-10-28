import 'package:flutter/material.dart';

class ProduitBox extends StatelessWidget {
  final String nomProduit;

  const ProduitBox({super.key, required this.nomProduit});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        nomProduit,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
