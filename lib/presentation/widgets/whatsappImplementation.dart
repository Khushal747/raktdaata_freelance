import 'package:flutter/material.dart';
import 'package:raktdata_app/View_model/whatsapp_api_view_model.dart';

class WhatsappWidget extends StatelessWidget {
  final WhatsappApiViewModel viewModel = WhatsappApiViewModel();

  WhatsappWidget({super.key}); // Create an instance of the ViewModel

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await viewModel.sendWhatsAppMessage(); // Call the function from the ViewModel
      },
      child: Text('Send WhatsApp Message'),
    );
  }
}
//
// import 'package:raktdata_app/View_model/whatsapp_api_view_model.dart';
//
// void sendWhatsAppMessage() async {
//
//   List<String> phoneNumbers = ['919340953578', '919926888253'];
//
//
//   final WhatsappApiViewModel viewModel = WhatsappApiViewModel();
//   await viewModel.sendWhatsAppMessage(); // Call the function from the ViewModel
// }