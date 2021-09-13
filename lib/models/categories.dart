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
