import 'package:flutter/material.dart';

class ShowDialog extends StatefulWidget {
  @override
  _ShowDialogState createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {

  void showOptionsDialog() {
    showDialog(
        barrierDismissible: false, // Para nao clicar fora para sair do jogo
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Mais opções",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        FlatButton(
                            onPressed: () {},
                            child: Text('Trending')
                        ),
                        FlatButton(
                            onPressed: () {},
                            child: Text('Animais')
                        ),
                        FlatButton(
                            onPressed: () {},
                            child: Text('Memes')
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FlatButton(
                            onPressed: () {},
                            child: Text('Cachorro')
                        ),
                        FlatButton(
                            onPressed: () {},
                            child: Text('Gato')
                        ),
                        FlatButton(
                            onPressed: () {},
                            child: Text('Bom dia')
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FlatButton(
                            onPressed: () {},
                            child: Text('Gato')
                        ),
                        FlatButton(
                            onPressed: () {},
                            child: Text('Séries')
                        ),
                        FlatButton(
                            onPressed: () {},
                            child: Text('Futebol')
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

