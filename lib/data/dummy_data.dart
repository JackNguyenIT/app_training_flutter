import 'package:app_demo_flutter/data/category_model.dart';
import 'package:app_demo_flutter/resource/assets/app_images.dart';

class DummyData {
  static List<CategoryModel> categories = [
    CategoryModel(name: "Beauty", url: AppImages.imageCategoryBeauty),
    CategoryModel(name: "Fashion", url: AppImages.imageCategoryFashion),
    CategoryModel(name: "Kid", url: AppImages.imageCategoryKid),
    CategoryModel(name: "Men", url: AppImages.imageCategoryMen),
    CategoryModel(name: "Women", url: AppImages.imageCategoryWomen),
    CategoryModel(name: "Gifts", url: AppImages.imageCategoryGift),
  ];
}
