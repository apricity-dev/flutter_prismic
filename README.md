A package that provides a model to parse annd display Prismic articles 

## Features

#### FlutterPrismicArticle

A class to parse Prismic article.

A Prismic article contains :<br/>
    - Title<br/>
    - Content (a list of items)<br/>
    - Url (an optional field to specifiy the url on which the article is displayed - used to differentiate internal link from external link)

#### PrismicUI

A class to display article data.

## Getting started

Add Flusmic in your pubspec.yaml file.

```dart
dependencies:
  flusmic: ^0.0.1 /// latest version
```

## Usage

Create an instance of FlutterPrismicArticle

```dart
FlutterPrismicArticleData articleData = FlutterPrismicArticleData.fromJson(
    article.data as Map<String, dynamic>);

FlutterPrismicArticle article = FlutterPrismicArticle("article_exemple", articleData));
```

Create an instance of FlutterUI and get the list of Widgets to display

```dart
PrismicUI prismicUI = PrismicUI(context, articleData);

List<Widget> articleWidgets = prismicUI.buildContent();
```
# flutter_prismic
