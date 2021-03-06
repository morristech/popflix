import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popflix/CORE/Models/ApiRM/GetMoviesRM.dart' as m;
import 'package:popflix/CORE/ProviderModels/DataFetcherPM.dart';
import 'package:provider/provider.dart';

import 'MovieItemCard.dart';

//ForMoviesOnly
class PopularOnList extends StatefulWidget {
  final String name;

  const PopularOnList({Key key, this.name}) : super(key: key);

  @override
  _PopularOnListState createState() => _PopularOnListState();
}

class _PopularOnListState extends State<PopularOnList> {
  @override
  Widget build(BuildContext context) {
    List<m.Movie> data;
    if (widget.name == "action")
      data = Provider
          .of<DataFetcherPM>(context)
          .popularActionMovies;
    else if (widget.name == "crime") {
      data = Provider
          .of<DataFetcherPM>(context)
          .popularCrimeMovies;
    } else {
      data = Provider
          .of<DataFetcherPM>(context)
          .popularFamilyMovies;
    }

    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Popular in Genre : ${widget.name}",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            child: ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                addAutomaticKeepAlives: true,
                itemBuilder: (context, index) {
                  return MovieItemCard(
                    item: data[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
