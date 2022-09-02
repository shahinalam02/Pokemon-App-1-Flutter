import 'package:flutter/material.dart';
import 'package:routing_app/pages/details_page.dart';

import 'power_badge.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final List<String> types;
  final String imageUrl;
  final Map? pokemonMap;
  const PokemonCard({
    Key? key,
    required this.name,
    required this.types,
    required this.imageUrl,
    required this.pokemonMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => DetailsPage(data: pokemonMap)),
        );
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff4ad0b0),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            Hero(
              tag: "pokecard1-${name}",
              child: Image.network(
                "$imageUrl",
              ),
            ),
            Text(
              "$name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PowerBadge(text: "${types[0]}"),
                // PowerBadge(text: "${types[1]}"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
