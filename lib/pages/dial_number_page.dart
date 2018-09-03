import 'package:flutter/material.dart';

class DialNumberPage extends StatefulWidget {
  @override
  _DialNumberPageState createState() => _DialNumberPageState();
}

class _DialNumberPageState extends State<DialNumberPage> {
  static List<String> numbers = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '*',
    '0',
    '#'
  ];

  static List<String> letters = [
    '',
    'ABC',
    'DEF',
    'GHI',
    'JKL',
    'MNO',
    'PQRS',
    'TUV',
    'WXYZ',
    '',
    '+',
    ''
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconButton(
        icon: Icon(Icons.call),
        onPressed: () => _showBottomSheet(),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
                trailing:
                    IconButton(icon: Icon(Icons.cancel), onPressed: () {}),
              ),
              Divider(
                height: 5.0,
              ),
              Container(
                height: 90.0,
                padding: EdgeInsets.all(8.0),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: double.minPositive,
                  ),
                  children: _buildDialKeys(context),
                  shrinkWrap: true,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'Call Number',
                    child: Icon(Icons.call),
                  ),
                ),
              ),
            ],
          );
        });
  }

  List<Widget> _buildDialKeys(BuildContext context) {
    var keys = <Widget>[];
    for (int i = 0; i < numbers.length; i++) {
      keys.add(
        Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Theme.of(context).accentColor)),
          child: GestureDetector(
            onTap: () {},
            onLongPress: () {},
            child: ListTile(
              title: Text(
                numbers.elementAt(i),
              ),
              subtitle: i == 0
                  ? Icon(Icons.voicemail)
                  : Text(
                      letters.elementAt(i),
                    ),
            ),
          ),
        ),
      );
    }
    return keys;
  }
}
