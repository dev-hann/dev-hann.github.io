import 'package:blog/model/user.dart';
import 'package:blog/widget/body_layout.dart';
import 'package:blog/widget/post_card.dart';
import 'package:blog/widget/post_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
    required this.user,
  });
  final User user;

  Widget headerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox.square(
          dimension: 296.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  user.imageURL,
                ),
              ),
            ),
          ),
        ),
        Text(user.name),
        Text(user.bio),
        Text(user.email),
      ],
    );
  }

//   '''## Hi! <img src='https://qpluspicture.oss-cn-beijing.aliyuncs.com/6LjjQA/Hi.gif' alt='Hi' width="24"/>  I'm Hann.
// ### :earth_asia: I live in  ![](https://img.shields.io/badge/OS-Linux-informational?style=flat&logo=linux&logoColor=white&color=9cf)
// ### 🚀 My Mother Language is ![](https://img.shields.io/badge/Code-Dart-informational?style=flat&logo=dart&logoColor=white&color=9cf) ![](https://img.shields.io/badge/Code-Golang-informational?style=flat&logo=go&logoColor=white&color=9cf) ![](https://img.shields.io/badge/Code-CSharp-informational?style=flat&logo=csharp&logoColor=white&color=9cf)
// ### 👽️ My Favorite IDE is ![](https://img.shields.io/badge/Editor-VSCode-informational?style=flat&logo=visualstudiocode&logoColor=white&color=9cf) ![](https://img.shields.io/badge/Editor-Vim-informational?style=flat&logo=vim&logoColor=white&color=9cf)
// ## 🙈 Currently Interested In ![](https://img.shields.io/badge/Code-Rust-informational?style=flat&logo=rust&logoColor=white&color=9cf)
// ## :package: I've been to
// ![](https://img.shields.io/badge/Tools-Firebase-informational?style=flat&logo=firebase&logoColor=white&color=9cf)
// ![](https://img.shields.io/badge/Tools-Docker-informational?style=flat&logo=docker&logoColor=white&color=9cf)
// ![](https://img.shields.io/badge/CICD-Fastlane-informational?style=flat&logo=fastlane&logoColor=white&color=9cf) ![](https://img.shields.io/badge/CICD-Jenkins-informational?style=flat&logo=jenkins&logoColor=white&color=9cf)
// ---
// ## 👔 [Work With Me](https://superficial-spur-efa.notion.site/Han-469da5ad95f54949b8cd1e55e0541a3e?pvs=4)
// ''',
  Widget readmeTextWidget() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: MarkdownBody(
            shrinkWrap: true,
            extensionSet: md.ExtensionSet.gitHubWeb,
            data:
                '''## Hi! ![Hi](https://qpluspicture.oss-cn-beijing.aliyuncs.com/6LjjQA/Hi.gif)  I'm Hann.
### :earth_asia: I live in  ![](https://img.shields.io/badge/OS-Linux-informational?style=flat&logo=linux&logoColor=white&color=9cf)
### 🚀 My Mother Language is ![](https://img.shields.io/badge/Code-Dart-informational?style=flat&logo=dart&logoColor=white&color=9cf) ![](https://img.shields.io/badge/Code-Golang-informational?style=flat&logo=go&logoColor=white&color=9cf) ![](https://img.shields.io/badge/Code-CSharp-informational?style=flat&logo=csharp&logoColor=white&color=9cf)
### 👽️ My Favorite IDE is ![](https://img.shields.io/badge/Editor-VSCode-informational?style=flat&logo=visualstudiocode&logoColor=white&color=9cf) ![](https://img.shields.io/badge/Editor-Vim-informational?style=flat&logo=vim&logoColor=white&color=9cf)
## 🙈 Currently Interested In ![](https://img.shields.io/badge/Code-Rust-informational?style=flat&logo=rust&logoColor=white&color=9cf)
## :package: I've been to
![](https://img.shields.io/badge/Tools-Firebase-informational?style=flat&logo=firebase&logoColor=white&color=9cf)
![](https://img.shields.io/badge/Tools-Docker-informational?style=flat&logo=docker&logoColor=white&color=9cf)
![](https://img.shields.io/badge/CICD-Fastlane-informational?style=flat&logo=fastlane&logoColor=white&color=9cf) ![](https://img.shields.io/badge/CICD-Jenkins-informational?style=flat&logo=jenkins&logoColor=white&color=9cf)
---
## 👔 [Work With Me](https://superficial-spur-efa.notion.site/Han-469da5ad95f54949b8cd1e55e0541a3e?pvs=4)
''',
            imageBuilder: (url, title, alt) {
              double? size;
              if (alt == "Hi") {
                size = 24.0;
              }
              return Image.network(
                url.toString(),
                width: size,
                height: size,
              );
            },
            // styleSheet: MarkdownStyleSheet(
            //   h2: TextStyle(
            //     color: Colors.red,
            //   ),
            //   h3: TextStyle(
            //     color: Colors.blue,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }

  Widget pinnedWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pinned"),
        PostGridView(
          itemList: List.generate(6, (index) {
            return index;
          }),
        ),
      ],
    );
  }

  Widget contributeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Contribute"),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 113,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0,
                  crossAxisCount: 7,
                  childAspectRatio: 1.0,
                ),
                itemCount: 364,
                itemBuilder: (context, index) {
                  return const ColoredBox(
                    color: Colors.white,
                    child: SizedBox.square(
                      dimension: 10,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DevBodyLayout(
      header: headerWidget(),
      child: Column(
        children: [
          readmeTextWidget(),
          const SizedBox(height: 16.0),
          pinnedWidget(),
          const SizedBox(height: 16.0),
          contributeWidget(),
        ],
      ),
    );
  }
}
