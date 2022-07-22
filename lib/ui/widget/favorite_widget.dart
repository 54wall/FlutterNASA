import 'package:flutter/material.dart';

import '../../data/bean/apod_image.dart';
import '../../data/database/database_manager.dart';

class FavoriteWidget extends StatefulWidget {
  final ApodImage apodImage;

  const FavoriteWidget({
    super.key,
    required this.apodImage,
  });

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.yellow[500],
            //不可使用onPressed: _toggleFavorite(widget.apodImage),
            // 方法2：onPressed: () {
            //   _toggleFavorite(widget.apodImage);
            // },
            onPressed: () => _toggleFavorite(widget.apodImage),
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }

  void _toggleFavorite(ApodImage apodImage) {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
        DatabaseManager.getInstance()?.insertApod(apodImage);
      }
    });
  }
}
