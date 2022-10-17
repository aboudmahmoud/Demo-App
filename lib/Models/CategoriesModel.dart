class CategoriesModel{
  String? _name ;
  String? _image;

  CategoriesModel({required String CaregorisesName, required String Catgoryimage }){
    this._name=CaregorisesName;
    this._image=Catgoryimage;
  }

  String? get CatgoryName{
    return _name;
  }

  String? get CatgoryImage{
    return _image;
  }
}