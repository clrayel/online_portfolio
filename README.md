# online_portfolio

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Notes

### 22-07-2022
- Focus on color pallet

### 03-08-2022
- Remove all comments
- Naming convention: class name has to be the same as the file name
- put commas at the end of parameters for readability
- special_containers should either be in their own folders or as is in the widgets (since they're very atomic already)
- getters are usually used for logic/validation and widgets/methods for widgets
- turn appBarButton into a subwidget/stateless widget
- make AppBarSwitcherWidget extend PreferredSizeWidget
- place the sections into page and name them as pages ie 'contacts_page.dart'
- use an email package to give ability to send an email
- try to turn homedata into a datasource and create a bloc