import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/category.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/base_text.dart';

class CustomDropdown extends StatefulWidget {
  final List<Categoria> categorias;
  final Categoria? selectedCategory;
  final ValueChanged<Categoria?> onChanged;

  const CustomDropdown({
    super.key,
    required this.categorias,
    this.selectedCategory,
    required this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  Categoria? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      margin: const EdgeInsets.fromLTRB(5, 10, 10, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Categoria>(
          value: _selectedCategory,
          hint: const BaseText(
            textTitle: "Selecciona una categoria",
            color: Colors.black,
            fontSize: 23,
          ),
          items: widget.categorias.map((Categoria categoria) {
            return DropdownMenuItem<Categoria>(
              value: categoria,
              child: Text(categoria.nombre),
            );
          }).toList(),
          onChanged: (Categoria? newValue) {
            setState(() {
              _selectedCategory = newValue;
            });
            widget.onChanged(newValue);
          },
          isExpanded: true,
        ),
      ),
    );
  }
}
