import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_bloc.dart';
import 'package:flutter_capacitaciones/modules/posts/controller/bloc/posts_state.dart';
import 'package:flutter_capacitaciones/modules/posts/data/model/m_posts.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key, this.post});
  final Posts? post;
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final _formKey = GlobalKey<FormState>();

  late int? userId;
  late int? id;
  late String? title;
  late String? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Form'),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          // Inicializar los valores desde el estado
          userId = state.userId;
          id = state.id;
          title = state.title;
          body = state.body;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: title,
                    decoration: const InputDecoration(labelText: 'Title'),
                    onSaved: (value) => title = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    initialValue: body,
                    decoration: const InputDecoration(labelText: 'Body'),
                    maxLines: 3,
                    onSaved: (value) => body = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a body';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      final post = Posts(
        userId: userId,
        id: id,
        title: title,
        body: body,
      );

      // Manejar la lógica de envío (por ejemplo, guardar en base de datos, llamada a API)
      print('Submitted post: ${post.toJson()}');
    }
  }
}
