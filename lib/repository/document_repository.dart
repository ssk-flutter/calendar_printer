import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

class DocumentRepository {
  DocumentRepository();

  Document createNew({
    required Uint8List bytes,
  }) {
    final result = Document();

    var page = Page(
        pageFormat: PdfPageFormat.a4,
        build: (Context context) {
          return pw.Image(pw.MemoryImage(bytes));
        });

    result.addPage(
      page,
    );

    return result;
  }
}
