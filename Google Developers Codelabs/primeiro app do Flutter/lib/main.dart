import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Hello Word',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[]; //propriedade é inicializada com uma lista vazia

  void toggleFavorite() {
    //remove o par de palavras atual da lista de favoritos (se já estiver lá) ou o adiciona (se ainda não estiver) 
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { //O sublinhado (_) no início de _MyHomePageState torna essa classe privada e é aplicado pelo compilador
  var selectedIndex = 0; //variável

  @override
  Widget build(BuildContext context) {
    Widget page; //declara uma nova variável, page, do tipo Widget
    switch (selectedIndex) { //atribui uma tela a page, de acordo com o valor atual em selectedIndex
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
   
    return LayoutBuilder(
      builder: (context, constraints) { // consultar as constraints atuais para decidir se mostra o rótulo
        return Scaffold(
          body: Row(
            children: [
              SafeArea( // garante que os filhos não sejam ocultos por um entalhe de hardware ou uma barra de status.
                child: NavigationRail( // evitar que os botões de navegação sejam ocultos por uma barra de status móvel
                  extended: constraints.maxWidth >=600, // mostra os rótulos ao lado dos ícones.
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  // callback que atribui ao selectedIndex dentro da chamada setState()
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //centro da janela/tela do app.
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min, //para não ocupar todo o espaço horizontal disponível.
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {

  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); //o código solicita o tema atual do app
    final style = theme.textTheme.displayMedium!.copyWith( //acessa o tema da fonte do app
    // displayMedium = diz que "estilos de exibição são reservados para textos curtos e importantes"
    // copyWith = retorna uma cópia do estilo de texto com as mudanças definidas
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary, //define a cor do card para ser a mesma da propriedade colorScheme do tema
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase, 
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
          ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    // Se a lista de favoritos estiver vazia, a mensagem centralizada: 'nenhum favorito' vai aparecer.
    // Caso contrário, aparecerá uma lista (rolável)
    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('nenhum favorito.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('Você tem: '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
          
      ],
    );
  }
}

