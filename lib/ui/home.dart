import 'dart:convert';
import 'package:busca_gif/services/gif_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:transparent_image/transparent_image.dart';
import 'gif_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var gifService = GifService();

    String _search;


  int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null || _search.isEmpty)
      response = await http.get("https://api.giphy.com/v1/gifs/trending?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=60&rating=g");
    else
      response = await http.get("https://api.giphy.com/v1/gifs/search?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=$_search&limit=59&"
          "offset=$_offset&rating=g&lang=en");

    return json.decode(response.body);
  }

  //FILTROS

  String filter;

  String _animals = "https://api.giphy.com/v1/gifs/search?"
      "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=animals&limit=60&"
      "offset=0&rating=g&lang=en";

  String _dogs = 'https://api.giphy.com/v1/gifs/search?'
      'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=dog&limit=25&'
      'offset=0&rating=g&lang=en';

  String _cats = 'https://api.giphy.com/v1/gifs/search?'
      'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=cats&limit=25&'
      'offset=0&rating=g&lang=en';

  String _trending = 'https://api.giphy.com/v1/gifs/trending?'
      'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=25&rating=g';

  String _memes = 'https://api.giphy.com/v1/gifs/search?'
      'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=memes&limit=60&'
      'offset=0&rating=g&lang=en';

  String _goodMorning = 'https://api.giphy.com/v1/gifs/search?'
      'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=good morning&limit=60&'
      'offset=0&rating=g&lang=en';

  String _goodNight = 'https://api.giphy.com/v1/gifs/search?'
      'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=boa noite&limit=60&'
      'offset=0&rating=g&lang=pt';

  String _emojis = 'https://api.giphy.com/v1/gifs/search?'
      'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=emojis&limit=60&'
      'offset=0&rating=g&lang=pt';

  String _avengers = 'https://api.giphy.com/v1/gifs/search?'
      'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=avengers&limit=60&'
      'offset=0&rating=g&lang=en';


  bool searchForAnimal = false;

  bool searchForDogs = false;

  bool searchForCats = false;

  bool searchForTrending = false;

  bool searchForMemes = false;

  bool searchForGoodMorning = false;

  bool searchForGoodNight = false;

  bool searchForEmojis = false;

  bool searchForAvengers = false;

  Future<Map> _selectedAnimal({String filter}) async {
    http.Response response;

    if (_animals.isNotEmpty)
      response = await http.get("https://api.giphy.com/v1/gifs/search?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=animals&limit=60&"
          "offset=0&rating=g&lang=en");
    else
      response = await http.get("https://api.giphy.com/v1/gifs/trending?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=60&rating=g");

    return json.decode(response.body);
  }

  Future<Map> _selectedDog({String filter}) async {
    http.Response response;

    if (_dogs.isNotEmpty)
      response = await http.get('https://api.giphy.com/v1/gifs/search?'
          'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=dog&limit=60&'
          'offset=0&rating=g&lang=en');
    else
      response = await http.get("https://api.giphy.com/v1/gifs/trending?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=60&rating=g");

    return json.decode(response.body);
  }

  Future<Map> _selectedCat({String filter}) async {
    http.Response response;

    if (_cats.isNotEmpty)
      response = await http.get('https://api.giphy.com/v1/gifs/search?'
          'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=cats&limit=60&'
          'offset=0&rating=g&lang=en');
    else
      response = await http.get("https://api.giphy.com/v1/gifs/trending?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=60&rating=g");

    return json.decode(response.body);
  }

  Future<Map> _selectedTrending({String filter}) async {
    http.Response response;

    if (_trending.isNotEmpty)
      response = await http.get('https://api.giphy.com/v1/gifs/trending?'
          'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=60&rating=g');
    else
      response = await http.get("https://api.giphy.com/v1/gifs/trending?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=60&rating=g");

    return json.decode(response.body);
  }

  Future<Map> _selectedMemes({String filter}) async {
    http.Response response;

    if (_memes.isNotEmpty)
      response = await http.get('https://api.giphy.com/v1/gifs/search?'
          'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=memes&limit=60&'
          'offset=0&rating=g&lang=en');
    else
      response = await http.get("https://api.giphy.com/v1/gifs/trending?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=60&rating=g");

    return json.decode(response.body);
  }

  Future<Map> _selectedGoodMorning({String filter}) async {
    http.Response response;

    if (_goodMorning.isNotEmpty)
      response = await http.get('https://api.giphy.com/v1/gifs/search?'
          'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=good morning&limit=60&'
          'offset=0&rating=g&lang=en');
    else
      response = await http.get("https://api.giphy.com/v1/gifs/trending?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=60&rating=g");

    return json.decode(response.body);
  }

  Future<Map> _selectedGoodNight({String filter}) async {
    http.Response response;

    if (_goodNight.isNotEmpty)
      response = await http.get('https://api.giphy.com/v1/gifs/search?'
          'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=boa noite&limit=60&'
          'offset=0&rating=g&lang=pt');
    else
      response = await http.get("https://api.giphy.com/v1/gifs/trending?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=60&rating=g");

    return json.decode(response.body);
  }

  Future<Map> _selectedEmojis({String filter}) async {
    http.Response response;

    if (_emojis.isNotEmpty)
      response = await http.get('https://api.giphy.com/v1/gifs/search?'
          'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=emojis&limit=60&'
          'offset=0&rating=g&lang=pt');
    else
      response = await http.get("https://api.giphy.com/v1/gifs/trending?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=60&rating=g");

    return json.decode(response.body);
  }

  Future<Map> _selectedAvengers({String filter}) async {
    http.Response response;

    if (_avengers.isNotEmpty)
      response = await http.get('https://api.giphy.com/v1/gifs/search?'
          'api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=avengers&limit=60&'
          'offset=0&rating=g&lang=en');
    else
      response = await http.get("https://api.giphy.com/v1/gifs/trending?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=60&rating=g");

    return json.decode(response.body);
  }


  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
      });

    _selectedAnimal().then((map) {
      print(map);
    });

    _selectedDog().then((map){
      print(map);
    });

    _selectedCat().then((map){
      print(map);
    });

    _selectedTrending().then((map){
      print(map);
    });

    _selectedMemes().then((map){
      print(map);
    });

    _selectedGoodMorning().then((map){
      print(map);
    });

    _selectedGoodNight().then((map){
      print(map);
    });

    _selectedEmojis().then((map){
      print(map);
    });

    _selectedAvengers().then((map){
      print(map);
    });
  }

  void showOptionsDialog() {
    showDialog(
      //barrierDismissible: false, // Para nao clicar fora para sair do jogo
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Mais opções",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  searchForTrending = true;
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Trending')
                          ),
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  searchForAnimal = true;
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Animais')
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                searchForMemes = true;
                                Navigator.pop(context);
                              });
                            },
                            child: Text('Memes'),
                          ),
                        ],
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  searchForDogs = true;
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Cachorro')
                          ),
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  searchForCats = true;
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Gato')
                          ),
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  searchForGoodMorning = true;
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Bom dia')
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //  mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  searchForAvengers = true;
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Avengers')
                          ),
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  searchForEmojis = true;
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Emojis')
                          ),
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  searchForGoodNight = true;
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Boa Noite')
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.center, colors: [
                      Colors.blue[700],
                      Colors.blueAccent[700],
                      Colors.blueGrey[300],
                    ])),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                                'https://media3.giphy.com/media/'
                                    '47GTKznyEywUBLgR0x/200w.webp?cid=ecf05e47gsfeptb'
                                    'rka31ykpbokdk2qyjdptg8zh9tqztx89p&rid=200w.webp')
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Buscador de Gifs',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                        ),
                      ]),
                )),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.center, colors: [
                    Colors.blue[700],
                    Colors.blueAccent[700],
                    Colors.blueGrey[300],
                  ])),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 2, 50, 0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Pesquise Aqui!',
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder()),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                      onSubmitted: (text) {
                        _search = text;
                        setState(() {
                          _search = text;
                        });
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 5),
                        /*padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),*/
                        child: FlatButton.icon(
                            onPressed: () {
                              showOptionsDialog();
                            },
                            icon: Icon(
                              Icons.arrow_drop_down, color: Colors.white,
                              size: 30,
                            ),
                            label: Text(
                              'Mais Opções',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                              ),
                            )
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: FutureBuilder(
                future: searchForAnimal ? _selectedAnimal(filter: _animals)
                    : searchForDogs ? _selectedDog(filter: _dogs)
                    : searchForCats ? _selectedCat(filter: _cats)
                    : searchForTrending ? _selectedTrending(filter: _trending)
                    : searchForMemes ? _selectedMemes(filter: _memes)
                    : searchForGoodMorning ? _selectedGoodMorning(filter: _goodMorning)
                    : searchForGoodNight ? _selectedGoodNight(filter: _goodNight)
                    : searchForEmojis ? _selectedEmojis(filter: _emojis)
                    : searchForAvengers ? _selectedAvengers(filter: _avengers) : _getGifs(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if (snapshot.hasError)
                        return Container();
                      else
                        return _createGifTable(context, snapshot);
                  }
                }),
          ),
        ],
      ),
    );
  }


  int _getCount(List data) {
    if (_search == null) {
      return data.length;
    }  else if (_avengers.isNotEmpty)
      return data.length + 1;
    else if (_emojis.isNotEmpty)
      return data.length + 1;
    else if (_goodNight.isNotEmpty)
      return data.length + 1;
    else if (_goodMorning.isNotEmpty)
      return data.length + 1;
    else if (_memes.isNotEmpty)
      return data.length + 1;
    else if (_trending.isNotEmpty)
      return data.length + 1;
    else if (_cats.isNotEmpty)
      return data.length + 1;
    else if (_dogs.isNotEmpty)
      return data.length + 1;
    else if (_animals.isNotEmpty)
      return data.length + 1;
    else {
      return data.length + 1;
    }

  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        itemCount: _getCount(
            snapshot.data["data"]
        ),
        itemBuilder: (context, index) {
          if (_search == null || _search.isEmpty || index < snapshot.data["data"].length){
            return SizedBox(
              width: 200,
              child: Hero(
                tag: index,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      navigateToSubPage(snapshot, context, index);
                    },
                    child: FadeInImage.memoryNetwork(
                      key: Key(new DateTime.now().millisecondsSinceEpoch.toString() +
                          snapshot.data['data'][index]['images']['fixed_height']['mp4_size']),
                      image: snapshot.data['data'][index]['images']['fixed_height']['url'],
                      placeholder: kTransparentImage,
                      height: 300.0,
                      fit: BoxFit.cover,
                    ),
                    onLongPress: (){
                      HapticFeedback.mediumImpact();
                      gifService.onImageShared(snapshot.data['data'][index]);
                    },
                  ),
                ),
              ),
            );
          } else {
            return Container(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add, color: Colors.blue, size: 50.0),
                    Text(
                      "Carregar mais..",
                      style: TextStyle(color: Colors.blue, fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    _offset += 20;
                  });
                },
              ),
            );
          }
        },
    );

  }



  Future navigateToSubPage(AsyncSnapshot snapshot ,context, index) async {
    bool data = await Navigator.push(context, MaterialPageRoute( builder: (context) => GifPage(gifData:snapshot.data['data'][index])  ) );
    print( data);
  }
}




