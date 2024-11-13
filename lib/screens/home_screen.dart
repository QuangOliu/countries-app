import 'package:country_app/models/country.dart';
import 'package:country_app/screens/CountryDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:country_app/country_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Gọi API để tải danh sách quốc gia khi màn hình khởi tạo
    ref.read(countryProvider.notifier).fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    final countries = ref.watch(countryProvider); // Lắng nghe danh sách quốc gia

    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách Quốc gia'),
      ),
      body: countries.isEmpty
          ? Center(child: Text('Không có quốc gia nào.'))
          : ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];
          return ListTile(
            title: Text(country.name),
            subtitle: Text(country.description),
            onTap: () {
              // Điều hướng đến màn hình chi tiết quốc gia
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountryDetailScreen(country: country),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Điều hướng đến màn hình AddCountryScreen và nhận đối tượng Country
          final newCountry = await Navigator.pushNamed(context, '/addCountry');

          // Kiểm tra xem có nhận được đối tượng Country không
          if (newCountry != null && newCountry is Country) {
            // Gọi phương thức addCountry từ CountryNotifier để thêm quốc gia
            await ref.read(countryProvider.notifier).addCountry(newCountry);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
