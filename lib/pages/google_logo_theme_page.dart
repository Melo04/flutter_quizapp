import 'package:flutter/material.dart';

class ColorItem {
  ColorItem(
    this.name,
    this.positionColorOne,
    this.positionColorTwo,
    this.positionColorThree,
    this.positionColorFour,
  );

  final String name;
  final Color positionColorOne;
  final Color positionColorTwo;
  final Color positionColorThree;
  final Color positionColorFour;
}

final List<ColorItem> items = [
  ColorItem("Default", Colors.red, Colors.amber, Colors.green.shade600,
      Colors.blue.shade600),
  ColorItem("Monotone", Colors.black, Color.fromARGB(255, 206, 206, 206),
      Colors.black, Color.fromARGB(255, 211, 211, 211)),
  ColorItem("Sea", Colors.blue[900]!, Colors.blue[700]!, Colors.blue[500]!,
      Colors.blue[300]!),
  ColorItem("Dracula", Colors.purple, Color.fromARGB(255, 189, 127, 200),
      Color.fromARGB(255, 77, 45, 83), Color.fromARGB(255, 255, 91, 198)),
  ColorItem(
      "Sunset", Colors.orange, Colors.yellow.shade200, Colors.red, Colors.pink),
  ColorItem("Forest", Colors.green, Colors.lightGreen, Colors.green.shade800,
      Colors.lightGreen.shade400),
  ColorItem("Sunrise", Colors.yellow[800]!, Colors.yellow[600]!, Colors.orange,
      Colors.red),
];


class GoogleLogoThemePage extends StatefulWidget {
  const GoogleLogoThemePage({super.key});

  @override
  State<GoogleLogoThemePage> createState() => _GoogleLogoThemePageState();
}

class _GoogleLogoThemePageState extends State<GoogleLogoThemePage> {
  var _selector = ValueNotifier<String>("Default");
  late ColorItem currentChoice;

  @override
  void initState() {
    currentChoice = items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          CustomPaint(
            painter: GoogleLogoPainter(notifier:_selector),
            size: Size.square(100),
          ),
          SizedBox(
            height: 200,
          ),
          Container(
            margin: EdgeInsets.all(30),
            constraints: BoxConstraints(minHeight: 45),
            child: DropdownButton(
              isExpanded: true,
              style: Theme.of(context).textTheme.headlineMedium,
              value: currentChoice,
              selectedItemBuilder:(context) => items.map<Widget>((ColorItem item) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.color_lens),
                  ),
                  Text(item.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              )).toList(),
              items: items.map<DropdownMenuItem<ColorItem>>((ColorItem item) {
                return DropdownMenuItem<ColorItem>(
                  value: item,
                  child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(minHeight: 48),
                    child: Text(item.name, 
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (ColorItem? value) {
                setState(() {
                  currentChoice = value!;
                });
              }
            ),
          ),
        ],
      ),
    );
  }
}

class GoogleLogoPainter extends CustomPainter {
  GoogleLogoPainter({required this.notifier}) : super(repaint: notifier);

  final ValueNotifier<String> notifier;
  var _state = false;

  @override
  void paint(Canvas canva, Size size) {
    var paintOne;
    var paintTwo;
    var paintThree;
    var paintFour;

    for(ColorItem item in items){
      if(item.name == notifier.value){
        paintOne = item.positionColorOne;
        paintTwo = item.positionColorTwo;
        paintThree = item.positionColorThree;
        paintFour = item.positionColorFour;
      }
    }

    final length = size.width;
    final verticalOffset = size.height / 2;
    final bound = Offset(0, verticalOffset) & Size.square(length);
    final center = bound.center;
    final arcThickness = size.width / 4.5;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = arcThickness;

    void drawCustomArc(double startAngle, double sweepAngle, Color color) {
      final _paint = paint..color = color;
      canva.drawArc(bound, startAngle, sweepAngle, false, _paint);
    }

    _state = !_state;
    drawCustomArc(3.5, 1.9, paintOne);
    drawCustomArc(2.5, 1.0, paintTwo);
    drawCustomArc(0.9, 1.6, paintThree);
    drawCustomArc(-0.18, 1.1, paintFour);

    canva.drawRect(
      Rect.fromLTRB(
          center.dx,
          center.dy - (arcThickness / 2),
          bound.centerRight.dx + (arcThickness / 2) - 4,
          bound.centerRight.dy + (arcThickness / 2)),
      paint
        ..color = paintFour
        ..style = PaintingStyle.fill
        ..strokeWidth = 0,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}