import 'package:flutter/material.dart';
import 'package:localizer/localizer.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pageNumber(num: '2', parent: t.graph)),
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
                        S.of(context).pageNumber(num: '2', parent: t.graph),
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
