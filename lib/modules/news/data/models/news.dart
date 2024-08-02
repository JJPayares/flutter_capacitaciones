class Noticia {
  final String titulo;
  final String descripcion;
  final String fecha;
  final String imagen;
  final int categoria;

  Noticia({
    required this.titulo,
    required this.descripcion,
    required this.fecha,
    required this.imagen,
    required this.categoria,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      fecha: json['fecha'],
      imagen: json['imagen'],
      categoria: json['categoria'],
    );
  }
}

