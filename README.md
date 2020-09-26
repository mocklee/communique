# **communique**

**[work-in-progress]**
A web platform that enables sharing, browsing & generation of email message templates via `mailto` links.

[Figma mock (still WIP)](https://www.figma.com/file/RcjBRpAkK7W0aDx0J9XVGQ/communique?node-id=26495%3A29379)

![communique mock image](./mockWIP.png)

## Stack

- [Flutter](https://flutter.dev/)
- [Firebase](https://firebase.google.com/)

## Running locally for development

1. Install dependencies & ensure Chrome browser is visible with the`flutter devices` command
2. Run the app with `flutter run -d chrome`
   i. or use Visual Studio Code with the [official Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) to debug & run

### _Dependencies:_

- [Flutter SDK](https://flutter.dev/docs/get-started/install)

### _To enable Flutter web support:_

```bash
 flutter channel beta
 flutter upgrade
 flutter config --enable-web
```
