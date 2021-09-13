import 'package:flutter/material.dart';

enum ExpenditureType{
  CARD,
  CASH
}

Map<ExpenditureType, String> expenditureTypeToString = {
  ExpenditureType.CARD: "Карта",
  ExpenditureType.CASH: "Наличные",
};

Map<String, ExpenditureType> expenditureStringToType = {
   "Карта": ExpenditureType.CARD,
   "Наличные": ExpenditureType.CASH,
};