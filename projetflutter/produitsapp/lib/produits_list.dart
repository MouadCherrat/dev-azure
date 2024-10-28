import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'produit_box.dart';

class ProduitsList extends StatefulWidget {
  const ProduitsList({super.key});

  @override
  _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  List<String> produits = ['Produit A', 'Produit B', 'Produit C'];

  void _ajouterProduit(String produit) {
    if (produit.isNotEmpty) {
      setState(() {
        produits.add(produit);
      });
    }
  }

  void _confirmerSuppression(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirmer la suppression"),
          content: const Text("Voulez-vous supprimer ce produit ?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Annuler", style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                // Ferme le dialogue et appelle la fonction de suppression
                Navigator.of(context).pop();
                _supprimerProduit(index);
              },
              child: const Text("Supprimer", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _supprimerProduit(int index) {
    setState(() {
      produits.removeAt(index); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liste des Produits',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.teal.shade700,
        elevation: 4.0,
      ),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: Slidable(
              key: ValueKey(produits[index]),
              startActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => _confirmerSuppression(index),
                    backgroundColor: Colors.red.shade600,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Supprimer',
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade100, Colors.teal.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: ProduitBox(nomProduit: produits[index]),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade600,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return _buildAddProductDialog();
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildAddProductDialog() {
    TextEditingController controller = TextEditingController();

    return AlertDialog(
      backgroundColor: Colors.teal.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text(
        'Ajouter un Produit',
        style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
      ),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Nom du produit',
          hintStyle: TextStyle(color: Colors.teal.shade200),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.teal.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.teal),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            _ajouterProduit(controller.text);
            Navigator.of(context).pop();
          },
          child: const Text('Ajouter', style: TextStyle(color: Colors.teal)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Annuler', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
