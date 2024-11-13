import 'package:flutter/material.dart';
import 'package:country_app/models/country.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  // Nhận đối tượng Country từ constructor
  CountryDetailScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name), // Hiển thị tên quốc gia trên AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên: ${country.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Mã: ${country.code}', // Hiển thị mã quốc gia
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Mô tả: ${country.description}', // Hiển thị mô tả
              style: TextStyle(fontSize: 16),
            ),
            // Thêm các thông tin khác nếu cần
          ],
        ),
      ),
    );
  }
}