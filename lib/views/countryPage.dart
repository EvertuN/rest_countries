import 'package:flutter/material.dart';

class CountryPage extends StatelessWidget {
  final List country;

  const CountryPage({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          ''
          // country.common,
          // style: const TextStyle(
          //   color: Colors.white,
          // ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.network(
              'imagem.com.br/alfmla',
              // country.thumbnail,
              width: double.infinity,
              height: 300,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.book),
            ),
            const SizedBox(width: 16), //nao funciona// arruma
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    ''
                    // country.common,
                    // style: const TextStyle(
                    //     fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                // const SizedBox(height: 16),
                // Text('Autor: ${country.common}',
                //     style: const TextStyle(fontSize: 16)),
                // const SizedBox(height: 8),
                // Text('Contribuinte: ${country.common}',
                //     style: const TextStyle(fontSize: 16)),
                Center(
                  child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         WebsitePage(url: book.amazon_product_url),
                        //   ),
                        // );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
                      child: const Text('Comprar')),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
