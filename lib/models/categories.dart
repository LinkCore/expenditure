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
  SAVE,
  TAXI,
  OTHER
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
  Categories.SAVE: "Сбережения",
  Categories.TAXI: "Такси",
  Categories.OTHER: "Другое"
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
  "Сбережения": Categories.SAVE,
  "Такси": Categories.TAXI,
  "Другое": Categories.OTHER
};

Map<Categories, Color> categoriesToColor = {
  Categories.PERMANENT: Color(0xFF66ffff),
  Categories.CLOTH: Color(0xFF66ccff),
  Categories.PRODUCT: Color(0xFF99ccff),
  Categories.TRANSPORT: Color(0xFFcc99ff),
  Categories.ENTERTAINMENT: Color(0xFFff99ff),
  Categories.CAFE: Color(0xFFff99cc),
  Categories.HEALTH: Color(0xFFff9999),
  Categories.FAMILY: Color(0xFFffcc99),
  Categories.PRESENTS: Color(0xFFffff99),
  Categories.SAVE: Color(0xFFccff99),
  Categories.TAXI: Color(0xFF99ff99),
  Categories.OTHER: Color(0xFF99ffcc)
};
