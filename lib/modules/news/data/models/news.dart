import 'dart:convert';

class Noticia {
  int id;
  String titulo;
  String descripcion;
  String fecha;
  String imagen;
  int categoria;

  Noticia({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.fecha,
    required this.imagen,
    required this.categoria,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      id: json['id'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      fecha: json['fecha'],
      imagen: json['imagen'],
      categoria: json['categoria'],
    );
  }

  static List<Noticia> newsFromJson(String str) =>
      List<Noticia>.from(json.decode(str).map((x) => Noticia.fromJson(x)));

  toJson() {}
}
