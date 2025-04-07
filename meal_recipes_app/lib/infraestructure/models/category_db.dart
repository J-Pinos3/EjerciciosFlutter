
class CategoryDb {
    final String idCategory;
    final String strCategory;
    final String strCategoryThumb;
    final String strCategoryDescription;

    CategoryDb({
        required this.idCategory,
        required this.strCategory,
        required this.strCategoryThumb,
        required this.strCategoryDescription,
    });

    factory CategoryDb.fromJson(Map<String, dynamic> json) => CategoryDb(
        idCategory: json["idCategory"] ?? "",
        strCategory: json["strCategory"] ?? "",
        strCategoryThumb: json["strCategoryThumb"] ?? "",
        strCategoryDescription: json["strCategoryDescription"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
    };
}
