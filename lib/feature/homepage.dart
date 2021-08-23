import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_example/app/application/ablum_controller.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  void initState() {
    context.read(albumController).getAlbumData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Api Data Call from Freezed package'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read(albumController).getAlbumData();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: HookBuilder(
          builder: (context) {
            final data = useProvider(albumController.state);
            return data.maybeMap(
                loading: (_) => CircularProgressIndicator(),
                orElse: () => const SizedBox(),
                success: (user) {
                  return ListView.builder(
                      itemCount: user.data!.length,
                      itemBuilder: (context, index) {
                        final data = user.data;
                        return ListTile(
                          title: Text(data[index].title),
                          subtitle: Text(data![index].id.toString()),
                        );
                      });
                });
          },
        ),
      ),
    );
  }
}
