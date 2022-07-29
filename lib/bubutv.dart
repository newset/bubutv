import "package:flutter/material.dart";
import 'api.dart';
import 'package:transparent_image/transparent_image.dart';

class Movie {
  final String title;
  Movie(this.title);
}

class MovieItem extends StatelessWidget {
  final Map<String, dynamic> data;
  const MovieItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.memoryNetwork(
              width: 100,
              height: 150,
              imageScale: 1.5,
              image: data['cover'],
              placeholder: kTransparentImage,
              fit: BoxFit.cover,
              imageErrorBuilder: (context, error, stackTrace) => Expanded(
                // color: Colors.grey,
                child: Icon(
                  Icons.error_outline,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(data["title"]),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class TVHome extends StatefulWidget {
  TVHome({Key? key}) : super(key: key);

  @override
  State<TVHome> createState() => _TVHomrState();
}

class _TVHomrState extends State<TVHome> {
  late Future<List<dynamic>> movies;

  bool isError = false;

  Future<List<dynamic>> _getRecommend() async {
    try {
      final response = await dio.get(Urls.recommend);
      return response.data['subjects'];
    } catch (e) {
      isError = true;
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    movies = _getRecommend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                crossAxisCount: 3,
                children: List.generate(
                  snapshot.data!.length,
                  (index) {
                    return TextButton(
                      onPressed: () {
                        print('ok');
                      },
                      child: MovieItem(data: snapshot.data![index]),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: movies,
        ),
      ),
    );
  }
}
