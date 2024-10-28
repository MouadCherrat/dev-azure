import 'package:flutter/material.dart';

class AddProduit extends StatelessWidget {
  final Function(String) onProduitAjoute;

  const AddProduit({super.key, required this.onProduitAjoute});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return AlertDialog(
      title: const Text('Ajouter un Produit'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'Nom du produit'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            onProduitAjoute(controller.text);
            Navigator.of(context).pop();
          },
          child: const Text('Ajouter'),
        ),
      ],
    );
  }
}
