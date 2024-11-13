import 'package:country_app/models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCountryScreen extends ConsumerStatefulWidget {
  @override
  _AddCountryScreenState createState() => _AddCountryScreenState();
}

class _AddCountryScreenState extends ConsumerState<AddCountryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _addCountry() async {
    if (_formKey.currentState!.validate()) {
      // Tạo đối tượng Country mới
      Country newCountry = Country(
        id: '', // ID sẽ được tạo tự động hoặc quản lý từ bên phía provider
        name: _nameController.text,
        code: _codeController.text,
        description: _descriptionController.text,
      );

      // Quay lại màn hình trước và trả về giá trị true
      Navigator.pop(context, newCountry);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Country')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Country Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the country name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _codeController,
                decoration: InputDecoration(labelText: 'Country Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the country code';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addCountry,
                child: Text('Add Country'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
