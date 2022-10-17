
class OffersModel {
  String? _ImageAdders;
  String? _Type;
  String? _Name;
  String? _AvablielTime;
  int? _DealPrice;
  int? _OrgnalPrice;
  OffersModel(String Type,String ImageAdders , String name,String AvablielTime, int DealPrice,int OrgnalPrice ){
    this._ImageAdders=ImageAdders;
    this._Type=Type;
    this._Name=name;
    this._AvablielTime=AvablielTime;
    this._DealPrice=DealPrice;
    this._OrgnalPrice=OrgnalPrice;

  }

  String get ImageAdders => _ImageAdders!;

  int get OrgnalPrice => _OrgnalPrice!;

  set OrgnalPrice(int value) {
    _OrgnalPrice = value;
  }

  int get DealPrice => _DealPrice!;

  set DealPrice(int value) {
    _DealPrice = value;
  }

  String get AvablielTime => _AvablielTime!;

  set AvablielTime(String value) {
    _AvablielTime = value;
  }

  String get Name => _Name!;

  set Name(String value) {
    _Name = value;
  }

  String get Type => _Type!;

  set Type(String value) {
    _Type = value;
  }
}