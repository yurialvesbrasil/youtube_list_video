
import 'package:camera_app/core/models/lista.dart';
import 'package:camera_app/core/view_model/youtube_view_model.dart';
import 'package:camera_app/ui/util/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabPlayLists extends StatefulWidget {
  final Function(int) tabSelected;
  final PlayList playLists;


  const TabPlayLists({Key key, this.tabSelected, this.playLists})
      : super(key: key);

  @override
  _TabPlayListsState createState() => _TabPlayListsState();
}

class _TabPlayListsState extends State<TabPlayLists> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _getListCategory();
  }

  Widget _getListCategory() {
    ListView listCategory = new ListView.builder(
        itemCount: widget.playLists.items.length-1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if(index == 1)
            return Container();
          else
            return _buildCategoryItem(index);
        });

    return new Container(
      height: 50.0,
      child: listCategory,
      color: Colors.transparent,
    );
  }

  Widget _buildCategoryItem(index) {
    final youtubeViewModel = Provider.of<YouTubeViewModel>(context);
    return new InkWell(
      onTap: () {
        setSelectedItem(index);
        print("click");
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(left: 10.0),
            child: new Material(
              elevation: 2.0,
              color: youtubeViewModel.tabId == index
                  ? HexColor("#C52222")
                  : Colors.transparent,
              borderRadius: const BorderRadius.all(const Radius.circular(6.0)),
              child: new Container(
                padding: new EdgeInsets.only(
                    left: 12.0, top: 12.0, bottom: 12.0, right: 12.0),
                child: new Text(
                  widget.playLists.items[index].snippet.title,
                  style: new TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void setSelectedItem(index) {
    final youtubeViewModel = Provider.of<YouTubeViewModel>(context);
    if (index != youtubeViewModel.tabId) {
      widget.tabSelected(index);
      youtubeViewModel.setTabId(index);
    }
  }
}
