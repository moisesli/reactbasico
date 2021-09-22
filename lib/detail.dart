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
              return {'color': '#7ccedf', 'font-weight': 'bold'};
            }
            if (element.classes.contains('keyword')) {
              return {'color': '#C5A5C5'};
            }
            if (element.classes.contains('function')) {
              return {'color': '#79B6F2'};
            }
            if (element.classes.contains('tag')) {
              return {'color': '#FC929E'};
            }
            if (element.classes.contains('punctuation')) {
              return {'color': '#88C6BE'};
            }
            if (element.classes.contains('class-name')) {
              return {'color': '#FAC863'};
            }
            if (element.classes.contains('attr-name')) {
              return {'color': '#C5A5C5'};
            }
            if (element.classes.contains('attr-value')) {
              return {'color': '#8DC891'};
            }
            if (element.classes.contains('string')) {
              return {'color': '#8DC891'};
            }
            if (element.classes.contains('language-java')) {
              return {'color': '#FC929E'};
            }



            if (element.localName == 'code') {
              return {'font-weight': '550'};
            }

            // if (element.localName == 'blockquote') {
            //   return {'background-color': '#f5f7f9', 'padding': '15px'};
            // }



            return null;
          },),
        )],
      )
    );
  }
}
