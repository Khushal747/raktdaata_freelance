  import 'package:http/http.dart' as http;
  import 'dart:convert';


  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raktdata_app/widgets/translate_extension.dart';

  import '../models/need_model.dart';
  import '../widgets/disposable_provider.dart';
  import '../widgets/util.dart';

  class WhatsappApiViewModel extends DisposableProvider {
    // List<NeedModel> _categories = [];
    List<NeedModel> _needDetails = [];

    List<NeedModel> get requirementDetails => _needDetails;

    Future<void> sendWhatsAppMessage() async {

        var url = Uri.parse('https://graph.facebook.com/v17.0/146538391868633/messages');

        var headers = {
          'Authorization': 'Bearer EAATDCUZAoEPYBOw97227lQ8ed7Mw4DU7dWFxsfZATxFiptqXgith71i4gVlziarZCdqYV1fUnn8cqZBxGJ0XNmJFfE4lUEXspbOpzAqcc6SwoKdi4FycQUjiGZBJh5dTbh4apX5XKZB6oXYkFarMolJbM0S7I0JjeP5g0qmFIz31HHkG88SeYhJNdIIZBU046NuGOljqRBUHkZCmmph5zu0ZD',
          'Content-Type': 'application/json',
        };

        var body = jsonEncode({
          'messaging_product': 'whatsapp',
          'to':'919340953578',
          // ['917477015841', '918770820133', '919399767395'],
          'type': 'template',
          'template': {
            'name': 'hello_world',
            'language': {'code': 'en_US'},
          },
        });


        var response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 200) {
          print('Message sent successfully!');
          print('Response: ${response.body}');
        } else {
          print('Error sending message. Status code: ${response.statusCode}');
          print('Response: ${response.body}');
        }


    }



  @override
    void disposeValues() {
      _needDetails = [];
    }
  }
