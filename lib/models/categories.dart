import 'dart:ui';

import 'package:flutter/material.dart';

enum Categories {
  PERMANENT,
  CLOTH,
  PRODUCT,
  TRANSPORT,
  ENTERTAINMENT,
  CAFE,
  HEALTH,
  FAMILY,
  PRESENTS,
  SAVE
}

Map<Categories, String> categoriesToString = {
  Categories.PERMANENT: "Постоянные траты",
  Categories.CLOTH: "Одежда",
  Categories.PRODUCT: "Продукты",
  Categories.TRANSPORT: "Транспорт",
  Categories.ENTERTAINMENT: "Развлечения",
  Categories.CAFE: "Кафе",
  Categories.HEALTH: "Здоровье",
  Categories.FAMILY: "Семья",
  Categories.PRESENTS: "Подарки",
  Categories.SAVE: "Сбережения"
};

Map<String, Categories> stringToCategories = {
  "Постоянные траты": Categories.PERMANENT,
  "Одежда": Categories.CLOTH,
  "Продукты": Categories.PRODUCT,
  "Транспорт": Categories.TRANSPORT,
  "Развлечения": Categories.ENTERTAINMENT,
  "Кафе": Categories.CAFE,
  "Здоровье": Categories.HEALTH,
  "Семья": Categories.FAMILY,
  "Подарки": Categories.PRESENTS,
  "Сбережения": Categories.SAVE
};

Map<Categories, Color> categoriesToColor = {
  Categories.PERMANENT: Color(0xFFf8bbd0),
  Categories.CLOTH: Color(0xFFe1bee7),
  Categories.PRODUCT: Color(0xFFd1c4e9),
  Categories.TRANSPORT: Color(0xFFc5cae9),
  Categories.ENTERTAINMENT: Color(0xFFbbdefb),
  Categories.CAFE: Color(0xFFb3e5fc),
  Categories.HEALTH: Color(0xFFb2ebf2),
  Categories.FAMILY: Color(0xFFb2dfdb),
  Categories.PRESENTS: Color(0xFFc8e6c9),
  Categories.SAVE: Color(0xFFdcedc8),
};
