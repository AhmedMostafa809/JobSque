import 'package:flutter/material.dart';

import '../../../utilities/theme/app_themes.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Help Center',
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: AppTheme.darkGrey)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children:const [
          ExpansionTile(
            title: Text('Lorem ipsum dolor sit amet'),
            textColor: Colors.black87,
            iconColor: Colors.black87,
            trailing: Icon(
                Icons.keyboard_arrow_down
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    " Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante,"
                    " suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate."
                    " Curabitur ornare velit nec fringilla finibus. Phasellus mollis "
                    "pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris."),
              )

              // ListTile(title: Text('This is tile number 2')),
            ],
            // onExpansionChanged: (bool expanded) {
            //   setState(() => _customTileExpanded = expanded);
            // },
          ),
        ExpansionTile(
            title: Text('Lorem ipsum dolor sit amet'),
            textColor: Colors.black87,
            iconColor: Colors.black87,
            trailing: Icon(
                Icons.keyboard_arrow_down
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    " Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante,"
                    " suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate."
                    " Curabitur ornare velit nec fringilla finibus. Phasellus mollis "
                    "pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris."),
              )

              // ListTile(title: Text('This is tile number 2')),
            ],
            // onExpansionChanged: (bool expanded) {
            //   setState(() => _customTileExpanded = expanded);
            // },
          ),
        ExpansionTile(
            title: Text('Lorem ipsum dolor sit amet'),
            textColor: Colors.black87,
            iconColor: Colors.black87,
            trailing: Icon(
                Icons.keyboard_arrow_down
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    " Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante,"
                    " suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate."
                    " Curabitur ornare velit nec fringilla finibus. Phasellus mollis "
                    "pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris."),
              )

              // ListTile(title: Text('This is tile number 2')),
            ],
            // onExpansionChanged: (bool expanded) {
            //   setState(() => _customTileExpanded = expanded);
            // },
          ),
        ExpansionTile(
            title: Text('Lorem ipsum dolor sit amet'),
            textColor: Colors.black87,
            iconColor: Colors.black87,
            trailing: Icon(
                Icons.keyboard_arrow_down
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    " Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante,"
                    " suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate."
                    " Curabitur ornare velit nec fringilla finibus. Phasellus mollis "
                    "pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris."),
              )

              // ListTile(title: Text('This is tile number 2')),
            ],
            // onExpansionChanged: (bool expanded) {
            //   setState(() => _customTileExpanded = expanded);
            // },
          ),
        ExpansionTile(
            title: Text('Lorem ipsum dolor sit amet'),
            textColor: Colors.black87,
            iconColor: Colors.black87,
            trailing: Icon(
                Icons.keyboard_arrow_down
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    " Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante,"
                    " suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate."
                    " Curabitur ornare velit nec fringilla finibus. Phasellus mollis "
                    "pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris."),
              )

              // ListTile(title: Text('This is tile number 2')),
            ],
            // onExpansionChanged: (bool expanded) {
            //   setState(() => _customTileExpanded = expanded);
            // },
          ),
        ExpansionTile(
            title: Text('Lorem ipsum dolor sit amet'),
            textColor: Colors.black87,
            iconColor: Colors.black87,
            trailing: Icon(
                Icons.keyboard_arrow_down
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    " Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante,"
                    " suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate."
                    " Curabitur ornare velit nec fringilla finibus. Phasellus mollis "
                    "pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris."),
              )

              // ListTile(title: Text('This is tile number 2')),
            ],
            // onExpansionChanged: (bool expanded) {
            //   setState(() => _customTileExpanded = expanded);
            // },
          ),
        ExpansionTile(
            title: Text('Lorem ipsum dolor sit amet'),
            textColor: Colors.black87,
            iconColor: Colors.black87,
            trailing: Icon(
                Icons.keyboard_arrow_down
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                    " Fusce ultricies mi enim, quis vulputate nibh faucibus at. Maecenas est ante,"
                    " suscipit vel sem non, blandit blandit erat. Praesent pulvinar ante et felis porta vulputate."
                    " Curabitur ornare velit nec fringilla finibus. Phasellus mollis "
                    "pharetra ante, in ullamcorper massa ullamcorper et. Curabitur ac leo sit amet leo interdum mattis vel eu mauris."),
              )

              // ListTile(title: Text('This is tile number 2')),
            ],
            // onExpansionChanged: (bool expanded) {
            //   setState(() => _customTileExpanded = expanded);
            // },
          ),
        ],
      ),
    );
  }
}
