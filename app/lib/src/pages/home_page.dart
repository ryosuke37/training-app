import 'package:flutter/material.dart';
import 'package:localizer/localizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pageNumber(num: '1', parent: t.home)),
      ),
      body: Center(
        child: MaterialButton(
          child: Text(S.of(context).nextPage),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(
                        S.of(context).pageNumber(num: '2', parent: t.home),
                      ),
                    ),
                    body: Center(
                      child: MaterialButton(
                        child: Text(S.of(context).back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
