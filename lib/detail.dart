import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class Detail extends StatefulWidget {
  final String? title;
  final String? contenido;
  const Detail({Key? key, this.title, this.contenido}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      body: ListView(
        children: [Padding(
          padding: EdgeInsets.all(10),
          child: HtmlWidget('${widget.contenido}',customStylesBuilder: (element) {

            // Vinculos verde
            if (element.classes.contains('link')) {
              return {'color': '#42b983', 'font-weight': 'bold'};
            }

            // Azul codigo
            if (element.classes.contains('tag') || element.classes.contains('name')) {
              return {'color': '#418fd8'};
            }

            // Verde Codigo
            if (element.classes.contains('string')) {
              return {'color': '#42b983'};
            }

            // Codigo entre el texto anaranjado
            if (element.classes.contains('naranja')) {
              return {'color': '®', 'font-weight': 'bold'};
            }

            // comentario en codigo
            if (element.classes.contains('comment')) {
              return {'color': '#b3b3b3'};
            }

            // variable en codigo
            if (element.classes.contains('keyword')) {
              return {'color': '#e96900'};
            }

            // key de codigo de funcion built_in
            if (element.classes.contains('fkeyword')) {
              return {'color': '#0092db'};
            }

            // Codigo console verde
            if (element.classes.contains('built_in')) {
              return {'color': '#42b983'};
            }

            // Code color naranja
            if (element.localName == 'code') {
              return {'color': '#e96900'};
            }

            if (element.localName == 'pre') {
              return {'font-weight': '600'};
            }

            return null;
          },),
        )],
      )
    );
  }
}
