import 'package:flutter/cupertino.dart';
import 'package:localizer/localizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(t.pageNumber(num: '1', pearent: t.home)),
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
                      middle: Text(t.pageNumber(num: '2', pearent: t.home)),
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
