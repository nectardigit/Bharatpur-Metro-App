import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gandakimun/controllers/appcontroller.dart';

import '../../constants.dart';
import '../../utils/validators.dart';
import '../../widget/appbar.dart';
import '../../widget/drawer.dart';
import '../../widget/inputfield.dart';

class ViewForm extends StatefulWidget {
  const ViewForm({Key? key}) : super(key: key);

  @override
  State<ViewForm> createState() => _ViewFormState();
}

class _ViewFormState extends State<ViewForm> {
  final formController = Get.put(AppController());
  final _formKey = GlobalKey<FormState>();
  String? pdfName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundClr,
      appBar: buildAppbar(controller.isNepali.value ? "फारम" : 'Form'),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: MyInputField(
                  hint: 'Enter form name',
                  controller: formController.name,
                  validator: (value) => validateIsEmpty(string: value),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: MyInputField(
                  hint: 'Enter form  information',
                  controller: formController.info,
                  validator: (value) => validateIsEmpty(string: value),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(pdfName!)),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: _pickFiles,
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text("upload document"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<FilePickerResult?> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg'],
    );
    if (result != null) {
      PlatformFile? file = result.files.first;
      print(file.name);
      pdfName = file.name;
    }
    if (_formKey.currentState!.validate()) {
      // controller.addFormData();
    }
    return result;
  }
}
