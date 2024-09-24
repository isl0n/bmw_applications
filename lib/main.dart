import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Дмитриев А.Р ЭФБО-03-22',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Настроим маршруты
      routes: {
        '/': (context) => ProductListScreen(),
        '/details': (context) => ProductListScreen(),
      },
      initialRoute: '/',
    );
  }
}

class Product {
  final String name;
  final String price;
  final String location;
  final String imageUrl;
  final List<String> description;

  Product({
    required this.name,
    required this.price,
    required this.location,
    required this.imageUrl,
    required this.description,
  });
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'XM 2023',
      price: '19 490 000 ₽',
      location: 'Москва',
      imageUrl: 'assets/1.jpg',
      description: [
        'Год: 2023',
      'Цвет кузова: Saphirschwarz metallic',
      'Цвет салона: BMW Individual Leder Merino | Sakhir Orange',
      'Система курсовой устойчивости.',
      'Датчик давления в шинах.',
      'Круиз-контроль.',
      'Парктроник передний и задний.',
      'Подробное описание машины по звонку.'],
    ),
    Product(
      name: 'XM 2023',
      price: '22 832 000 ₽',
      location: 'Москва',
      imageUrl: 'assets/2.jpg',
      description: [
        'Год: 2023'
        'Цвет кузова: Mineralwei metallic',
        'Цвет салона: BMW Individual Leder Merino mit Exklusivumfngen | Deep Lagoon',
        'Антиблокировочная система.',
        'Антипробуксовочная система.',
        'Система курсовой устойчивости.'
        'Подробное описание машины по звонку.'],
    ),
    Product(
      name: 'BMW 7 2023',
      price: '17 000 000 ₽',
      location: 'Москва',
      imageUrl: 'assets/3.jpg',
      description: [
        'Год: 2023'
        'Комплектация: BMW 7 серии VII (G70) 740d xDrive 3.0d AT (286 л.с.) 4WD 740d xDrive',
        'Антиблокировочная система.',
        'Антипробуксовочная система.',
        'Система курсовой устойчивости.',
        'Подробное описание машины по звонку.'],
    ),
    Product(
      name: 'BMW 8 2020',
      price: '16 579 000 ₽',
      location: 'Москва',
      imageUrl: 'assets/4.jpg',
      description: [
        'Год: 2022'
        'Цвет кузова: Aurora Diamant Green',
        'Цвет салона: Full Merino leather trim Silverstone Silver First Edition.',
        'Расширенная отделка кожей Merino.',
        'Карбон-керамические тормоза.',
        'Подробное описание машины по звонку.'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BimmerVision'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final car = products[index];
          return GestureDetector(
            onTap: () {
              // Переход на детальный экран с передачей объекта продукта
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: car),
                ),
              );
            },
            child: Card(
              elevation: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.asset(
                        car.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          car.price,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          car.location,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product; // Получаем переданный объект продукта

  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Добавляем AspectRatio для управления соотношением сторон изображения
            AspectRatio(
              aspectRatio: 16 / 9, // Устанавливаем соотношение сторон (16:9)
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 16),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              product.price,
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              product.location,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Описание',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              product.description.join('\n'),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
