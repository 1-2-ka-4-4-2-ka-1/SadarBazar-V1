import 'package:bazar/assets/colors/ThemeColors.dart';
import 'package:bazar/models/TestModels/_ProductItem.dart';
import 'package:bazar/ui/screens/LaunchScreenWith/CategoryResultsView.dart';
import 'package:bazar/ui/widgets/large/CustomSilverAppBar.dart';
import 'package:bazar/ui/widgets/large/ProductWidgets/ShopItemHorizontal.dart';
import 'package:bazar/util/loader/ProductLoadUtil.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchResultsView extends StatefulWidget {
  final List<ProductItem> products;
  final Function searchCallBack;

  SearchResultsView({this.products, this.searchCallBack});

  @override
  _SearchResultsViewState createState() => _SearchResultsViewState();
}

class _SearchResultsViewState extends State<SearchResultsView> {
  List<String> _similar = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _similar.clear();
    for (int i = 0; i < widget.products.length; i++) {
      _similar.addAll(widget.products[i].productTags);
      if (_similar.length > 20) break;
    }
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: _height,
          width: _width,
          child: Column(
            children: [
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        debugPrint("Similar Item Tapped");
                        widget.searchCallBack(context, _similar[index]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        margin: EdgeInsets.only(
                          left: 5,
                          right: 5,
                          top: 10,
                          bottom: 4,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Orange, width: 0.4)),
                        child: Text(
                          _similar[index],
                          style: TextStyle(color: Orange, fontSize: 12),
                        ),
                      ),
                    );
                  },
                  itemCount: _similar.length,
                ),
              ),
              Container(
                  width: _width,
                  height: _height * 0.8,
                  alignment: Alignment.center,
                  child: widget.products.length == 0
                      ? Text("No results found")
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return ShopItemHorizontal(
                              productItem: widget.products[index],
                              code: [1, 1, 1, 1, 0],
                              width: _width,
                              height: 120,
                            );
                          },
                          itemCount: widget.products.length,
                        )),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: _width,
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.filter_list,
                      color: Maroon,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(Icons.sort),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
