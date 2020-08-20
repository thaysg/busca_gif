import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {

  final String text;

  const CustomDropDown({Key key, @required this.text}) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {

  GlobalKey actionKey;

  double height, width, xPosition, yPosition;

  bool isDrownDownOpened = false;

  OverlayEntry floatingDropdown;


  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData(){
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  OverlayEntry _createFloatingDropdown(){
    return OverlayEntry(builder: (context){
      return Positioned(
        left: xPosition - width,
        width: 4 * width + 40,
        /*left: xPosition,
        width: width,*/
        top: yPosition + height,
        height: 4 * height + 40,
        child: DropDown(
          itemHeight: height,

        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: (){
        setState(() {
          if(isDrownDownOpened){
            floatingDropdown.remove();
          }else{
            findDropdownData();

            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context).insert(floatingDropdown);
          }

          isDrownDownOpened =! isDrownDownOpened;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(begin: Alignment.center, colors: [
              Colors.blue[700],
              Colors.blueAccent[700],
              Colors.blueGrey[300],
            ])),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Text(
                widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatelessWidget {

  final double itemHeight;

  const DropDown({Key key, this.itemHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5,),
        Align(
          alignment: Alignment(-0.85, 0),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              height: 20,
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.blue[700]),

            ),
          ),
        ),
        Container(
          height: 4 * itemHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(begin: Alignment.center, colors: [
                Colors.blue[700],
                Colors.blueAccent[700],
                Colors.blueGrey[300],
              ])
          ),
          child: Column(
            children: [
              DropDownItem(
                text: 'Cachorros',
                iconData: Icons.do_not_disturb,
              ),
              DropDownItem(
                  text: 'Gatos',
                iconData: Icons.do_not_disturb,
              ),
              DropDownItem(
                  text: 'Bom Dia',
                iconData: Icons.do_not_disturb,
              ),
              DropDownItem(
                  text: 'Aniversário',
                iconData: Icons.do_not_disturb,
              ),

            ],
          ),
        )
      ],
    );
  }
}

class DropDownItem extends StatelessWidget {

  final String text;
  final IconData iconData;
  final bool isSelected;

  const DropDownItem({Key key, this.text, this.isSelected, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.center, colors: [
            Colors.blue[700],
            Colors.blueAccent[700],
            Colors.blueGrey[300],
          ])),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          Spacer(),
          Icon(
            iconData,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}


class ArrowClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width/2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}
