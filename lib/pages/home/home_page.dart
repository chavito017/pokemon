import 'package:flutter/material.dart';
import 'package:pokemon/services/pokedex_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  String _capitalizerString(String text) {
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: PokedexService().getPokemonList(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot snapshot){
        List<dynamic> pokemons = snapshot.data['results'];
        return ListView.builder(
          itemCount: pokemons.length,
          itemBuilder: (BuildContext context, int index){
            // Utiliza _capitalizerString para capitalizar el nombre del Pokémon
            String capitalizedPokemonName = _capitalizerString(pokemons[index]['name']);
            return ListTile(title: Text(capitalizedPokemonName),);
          },
        );
      }, 
    );
  }
}
