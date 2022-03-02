import 'package:calendar_printer/view_model/date_controller_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

import '../repository/document_repository.dart';
import '../widget/classic_calendar/classic_calendar.dart';

class CalendarViewModel with ChangeNotifier {
  CalendarViewModel() : super();

  final DocumentRepository _document = DocumentRepository();

  Future printPreview(BuildContext context) async {
    final controller = ScreenshotController();
    final bytes = await controller
        .captureFromWidget(buildPreviewWidgetForCapture(context));

    await Printing.layoutPdf(
      usePrinterSettings: true,
      onLayout: (format) => _document
          .createNew(
            bytes: bytes,
          )
          .save(),
    );
  }

  Future share(BuildContext context) async {
    final controller = ScreenshotController();
    final bytes = await controller
        .captureFromWidget(buildPreviewWidgetForCapture(context));

    final dateController = context.read<DateControllerViewModel>();
    final titleDocument = '${dateController.year}-${dateController.month}';

    await Printing.sharePdf(
      bytes: await _document
          .createNew(
            bytes: bytes,
          )
          .save(),
      filename: '$titleDocument.pdf',
    );
  }

  Widget buildPreviewWidgetForCapture(BuildContext context) {
    final dateController = context.read<DateControllerViewModel>();
    final previewWidth = 500.0;
    return Material(
      child: SizedBox(
        width: previewWidth,
        height: previewWidth,
        child: ClassicCalendar(
          year: dateController.year,
          month: dateController.month,
        ),
      ),
    );
  }
}
