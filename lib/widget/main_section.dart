import 'package:flutter/material.dart';
import 'package:web_music/widget/second_main.dart';
import 'package:web_music/widget/section_bottom.dart';
import 'package:web_music/widget/top_chart.dart';

import 'header.dart';

class MainSection extends StatelessWidget {
  var wid;

  MainSection(this.wid);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0,left: 20.0),
      width: wid,
      child: Column(
        children: [
          Header(),
          TopChart(),
          SecondMain(wid),
          SectionBottom(wid)
        ],
      ),
    );
  }
}
