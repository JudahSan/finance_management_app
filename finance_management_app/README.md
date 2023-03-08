# finance_management_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

App Setup Android
-

- MaterialApp
- Scaffold

Layout
-

- Container
- Row
- Column

Row/Column Children
-

- Flexible
- Expanded

Content Containers
-

- Stack
- Card

Repeat Elements
-

- ListView
- GridView
- ListTile

Content Types
-

- Text
- Image
- Icon

UserInput
-

- TextField
- ElevateButton
- GestureDetector
- InkWell

Containers vs Column / Row
=

|Container|Column/Row|
|-------------------------|--------------------------|
|Takes exactly one child widget|Takes multiple (unlimited) child widgets|
|Rich alignment & styling options | Alignment but no styling options|
|Flexible width (e.g child width, available width, ...)| Always takes full available height (column) / width (row)
|Perfect for custom styling & alignment | Must-use if widgets sit next to/ above each other

Date Formatting
-

- Required package: [intl](https://pub.dev/packages/intl)

DateFormat Patterns
-

- The [intl](https://pub.dev/packages/intl) package supports a broad range of date formatting patterns. Here's a list (taken from the official docs):

|DAY           |               d|
|--------------------|------------|
 |ABBR_WEEKDAY              |   E|
 |WEEKDAY            |          EEEE|
 |ABBR_STANDALONE_MONTH  |      LLL|
 |STANDALONE_MONTH     |        LLLL|
 |NUM_MONTH          |          M||
 |NUM_MONTH_DAY    |            Md|
 |NUM_MONTH_WEEKDAY_DAY  |      MEd|
 |ABBR_MONTH          |         MMM|
 |ABBR_MONTH_DAY     |          MMMd|
 |ABBR_MONTH_WEEKDAY_DAY   |    MMMEd|
 |MONTH                 |       MMMM|
 |MONTH_DAY               |     MMMMd|
 |MONTH_WEEKDAY_DAY        |    MMMMEEEEd|
 |ABBR_QUARTER      |           QQQ|
 |QUARTER            |          QQQQ|
 |YEAR                |         y|
 |YEAR_NUM_MONTH       |        yM|
 |YEAR_NUM_MONTH_DAY    |       yMd|
 |YEAR_NUM_MONTH_WEEKDAY_DAY|   yMEd|
 |YEAR_ABBR_MONTH       |       yMMM|
 |YEAR_ABBR_MONTH_DAY    |      yMMMd|
 |YEAR_ABBR_MONTH_WEEKDAY_DAY|  yMMMEd|
 |YEAR_MONTH        |           yMMMM|
 |YEAR_MONTH_DAY     |          yMMMMd|
 |YEAR_MONTH_WEEKDAY_DAY|       yMMMMEEEEd|
 |YEAR_ABBR_QUARTER      |      yQQQ|
 |YEAR_QUARTER            |     yQQQQ|
 |HOUR24                   |    H|
 |HOUR24_MINUTE             |   Hm|
 |HOUR24_MINUTE_SECOND|         Hms|
 |HOUR                 |        j|
 |HOUR_MINUTE           |       jm|
 |HOUR_MINUTE_SECOND     |      jms|
 |HOUR_MINUTE_GENERIC_TZ  |     jmv|
 |HOUR_MINUTE_TZ           |    jmz|
 |HOUR_GENERIC_TZ           |   jv|
 |HOUR_TZ                    |  jz|
 |MINUTE        |               m|
 |MINUTE_SECOND  |              ms|
 |SECOND          |             s|


Examples Using the US Locale:

 |Pattern                |     |      Result|
 |----------------     |  ---- |          -------|
 |new DateFormat.yMd()          |   -> |7/10/1996|
| new DateFormat("yMd")          |  -> |7/10/1996|
| new DateFormat.yMMMMd("en_US") |  -> |July 10, 1996|
| new DateFormat.jm()            |  -> |5:08 PM|
| new DateFormat.yMd().add_jm()  |  -> |7/10/1996 5:08 PM|
| new DateFormat.Hm()            |  ->| 17:08 // force 24 hour time|


ListView
-

    - `ListView(children: [])`
    - `ListView.builder()` - only load what's visible

Flutter Basics
-

- Compose UI from built-in and custom Widgets.
- Custom Widgets are also composed from built-in and other custom Widgets.
- Style and configure via arguments.
- Use the docs and IDE support.

Styling and Configuring Widgets
-

- Styling and layout options are very different: `EdgeInsets.all()`, `BoxDecoration()`, enums, ... => Docs + IDE support help you.
- Often, there's more than one Widget or option to get the job done.

Theming
-

- Define a global theme for colors and text to then tap into it from anywhere in the app via Theme.of(context)
- Built-in Widgets use Theme settings automatically.

Business Logic
-

- Lift state up and use stateful widgets only when needed.
- Pass functions references and data around.
- Adjust the UI to your logic.
    
Respinsive and Adaptive User Interfaces
-

`textScaleFactor`
-

```dart
final curScaleFactor = MediaQuery.of(context).textScaleFactor;
```

- `textScaleFactor` tells you by how much text output in the app should be scaled. Users can change this in their mobile phone / device settings.
- Depending on your app, you might want to consider using this piece of information when setting font sizes.

- Consider this example:

 - Text('Always the same size!', style: TextStyle(fontSize: 20));
 - This text ALWAYS has a size of 20 device pixels, no matter what the user changed in his / her device settings.

  ```dart
  Text('This changes!', style: TextStyle(fontSize: 20 * curScaleFactor));
  ```

 - This text on the other hand also has a size of 20 if the user didn't change anything in the settings (because textScaleFactor by default is 1). But if changes were made, the font size of this text respects the user settings.



Resources
-

- [More on Layouting (with Column(), Row() etc.): ](https://flutter.dev/docs/development/ui/layout)

- [More on Images & Assets:](https://flutter.dev/docs/development/ui/assets-and-images)

- [Official Widget Catalog: ](https://flutter.dev/docs/development/ui/widgets)

- [Material Design Docs: ](https://material.io/design/)

- [Flutter Theming: ](https://flutter.dev/docs/cookbook/design/themes)

- [Constraints](https://docs.flutter.dev/development/ui/layout/constraints)