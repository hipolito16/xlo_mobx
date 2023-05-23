import 'package:xlo_mobx/stores/home_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'filter_store.g.dart';

enum OrderBy { DATE, PRICE }

const VENDOR_TYPE_PARTICULAR = 1 << 0;
const VENDOR_TYPE_PROFESSIONAL = 1 << 1;

class FilterStore = _FilterStore with _$FilterStore;

abstract class _FilterStore with Store {
  _FilterStore({
    this.orderBy = OrderBy.DATE,
    this.minPrice,
    this.maxPrice,
    this.vendorType = VENDOR_TYPE_PARTICULAR | VENDOR_TYPE_PROFESSIONAL,
  });

  @observable
  OrderBy orderBy;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;

  @observable
  int? minPrice;

  @action
  void setMinPrice(int value) => minPrice = value;

  @observable
  int? maxPrice;

  @action
  void setMaxPrice(int value) => maxPrice = value;

  @computed
  String? get priceError => maxPrice != null && minPrice != null && maxPrice! < minPrice! ? 'Faixa de preço inválida' : null;

  @observable
  int vendorType;

  @action
  void selectVendorType(int value) => vendorType = value;

  @action
  void setVendorType(int type) => vendorType = vendorType | type;

  @action
  void resetVendorType(int type) => vendorType = vendorType & ~type;

  @computed
  bool get isTypeParticular => (vendorType & VENDOR_TYPE_PARTICULAR) != 0;

  @computed
  bool get isTypeProfessional => (vendorType & VENDOR_TYPE_PROFESSIONAL) != 0;

  @computed
  bool get isFormValid => priceError == null;

  @action
  void save() {
    GetIt.I<HomeStore>().setFilter(this as FilterStore);
  }

  @action
  FilterStore clone() {
    return FilterStore(
      orderBy: orderBy,
      minPrice: minPrice,
      maxPrice: maxPrice,
      vendorType: vendorType,
    );
  }
}
