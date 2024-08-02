import 'package:flutter/material.dart';
import 'package:flutter_capacitaciones/modules/news/data/models/category.dart';
import 'package:flutter_capacitaciones/modules/news/ui/widgets/base_text.dart';

class CustomTabBar extends StatefulWidget {
  final List<Categoria> categorias;
  final Categoria? selectedCategory;
  final ValueChanged<Categoria?> onChanged;

  const CustomTabBar({
    super.key,
    required this.categorias,
    this.selectedCategory,
    required this.onChanged,
  });

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Categoria? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.selectedCategory;
    _tabController =
        TabController(length: widget.categorias.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _selectedCategory = widget.categorias[_tabController.index];
      });
      widget.onChanged(_selectedCategory);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: widget.categorias.map((Categoria categoria) {
              return Tab(text: categoria.nombre);
            }).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.categorias.map((Categoria categoria) {
              return Center(
                child: BaseText(
                  textTitle: categoria.nombre,
                  color: Colors.black,
                  fontSize: 23,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
