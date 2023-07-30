import 'package:flutter/cupertino.dart';
import 'package:localizer/localizer.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(t.pageNumber(num: '2', pearent: t.graph)),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text(t.nextPage),
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute<void>(
                builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      middle: Text(t.pageNumber(num: '2', pearent: t.graph)),
                    ),
                    child: Center(
                      child: CupertinoButton(
                        child: Text(t.back),
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
