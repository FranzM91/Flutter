import 'package:flutter/material.dart';
import 'package:movie_flutter/src/providers/peliculas_providers.dart';
import 'package:movie_flutter/src/search/search_delegate.dart';
import 'package:movie_flutter/src/widgets/card_swiper_widget.dart';
import 'package:movie_flutter/src/widgets/movie.horizontal.dart';

class HomePage extends StatelessWidget {
  final service = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    service.getPortada();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Peliculas de CINE"),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DataSearch(),
                  // query: 'Hola'
                );
              })
        ],
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _swiperTarjetas(),
          _footer(context),
        ],
      )),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: service.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child:
                Text("Populares", style: Theme.of(context).textTheme.subtitle1),
          ),
          SizedBox(height: 5.0),
          // FutureBuilder(
          //   future: service.getPortada(),
          //   builder: (context, AsyncSnapshot<List> snapshot) {
          //     if (snapshot.hasData) {
          //       return MovieHorizontal(peliculas: snapshot.data);
          //     } else {
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )
          StreamBuilder(
            stream: service.popularesStream,
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                    peliculas: snapshot.data,
                    siguientePagina: service.getPortada);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
