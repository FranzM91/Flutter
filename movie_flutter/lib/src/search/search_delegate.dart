import 'package:flutter/material.dart';
import 'package:movie_flutter/src/models/pelicula_model.dart';
import 'package:movie_flutter/src/providers/peliculas_providers.dart';

class DataSearch extends SearchDelegate {
  final peliculasProvider = new PeliculasProvider();
  final peliculas = [
    'Spiderman',
    'Capitan America',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Ironman 1',
    'Ironman 2',
    'Ironman 3',
  ];
  final peliculasRecientes = [
    'Spiderman',
    'Capitan America',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: Son las acciones de nuestro AppBar ejm X
    // throw UnimplementedError();
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: Icono a la izquierda del AppBar
    // throw UnimplementedError();
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: Crea los resiltados que vamos a mostrar
    // throw UnimplementedError();
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: Son las sugerencias que aparecen cuando la persona escribe
    // throw UnimplementedError();
    // Example 1
    // final listSugerida = (query.isEmpty)
    //     ? peliculasRecientes
    //     : peliculas
    //         .where((f) => f.toLowerCase().startsWith(query.toLowerCase()))
    //         .toList();
    // return ListView.builder(
    //     itemCount: listSugerida.length,
    //     itemBuilder: (context, i) {
    //       return ListTile(
    //         leading: Icon(Icons.movie),
    //         title: Text(listSugerida[i]),
    //         onTap: () {},
    //       );
    //     });
    // Example 2
    if (query.isEmpty) return Container();

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          final peliculas = snapshot.data;
          return ListView(
            children: peliculas.map((peli) {
              return ListTile(
                leading: FadeInImage(
                    image: NetworkImage(peli.getPosterImg()),
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    width: 50.0,
                    fit: BoxFit.contain),
                title: Text(peli.title),
                subtitle: Text(peli.originalTitle),
                onTap: () {
                  close(context, null);
                  peli.uniqueId = '';
                  Navigator.pushNamed(context, 'detalle', arguments: peli);
                },
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
