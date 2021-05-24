import 'package:flutter/material.dart';

import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewPage extends StatelessWidget {
  static final String routeName = 'pdf_view';

  @override
  Widget build(BuildContext context) {
    final String pdf = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Informe técnico'),
        centerTitle: true,
      ),
      body: PDF(autoSpacing: true, enableSwipe: true)
            .cachedFromUrl(
              pdf,
              placeholder: (progress) => Center(child: Text('$progress %')),
              errorWidget: (error) => Center(child: Text(error.toString())
            )),
    );
  }
}