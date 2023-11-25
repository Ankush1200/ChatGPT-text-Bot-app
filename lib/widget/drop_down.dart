import 'package:chatgpt_bot/models/model.dart';
import 'package:chatgpt_bot/services/api_services.dart';
import 'package:chatgpt_bot/widget/text_widget.dart';
import 'package:flutter/material.dart';

import '../constant/constant.dart';

class ModelDropdownButton extends StatefulWidget {
  const ModelDropdownButton({super.key});

  @override
  State<ModelDropdownButton> createState() => _ModelDropdownButtonState();
}

class _ModelDropdownButtonState extends State<ModelDropdownButton> {
  String currentmodel = "text-search-babbage-doc-001";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelModels>>
    (future: ApiService.getModels(), 
    builder: (context,snapshot){
      if(snapshot.hasError){
        return Center(child: TextWidget(label: snapshot.error.toString()),);
      }
      return snapshot.data==null || snapshot.data!.isEmpty ? const SizedBox.shrink():
      DropdownButton(
      dropdownColor: customBackgroundColor,
      iconEnabledColor: Colors.white,
      items:  List<DropdownMenuItem<String>>.generate(
    snapshot.data!.length,
    (index) => DropdownMenuItem(
      value:snapshot.data![index].id,
      child: TextWidget( 
        label: snapshot.data![index].id,
        fontSize: 15,
      ),
    ),
  ),
      onChanged: (value) {
        setState(() {
          currentmodel = value.toString();
        });
      },
    );
    });
  }
}


/** */