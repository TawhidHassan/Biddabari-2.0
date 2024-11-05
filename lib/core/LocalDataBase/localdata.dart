
import 'package:hive/hive.dart';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';



class DBHelper{



  Future<bool> checkUserLogedIn() async{
    var users= await Hive.box('users',);
    // Logger().e("dd");
    if(users.get('token')==null){
      print("hive ");
    }else{
      print("hive "+users.get('token'));
    }
    return users.get('token')!=null;
  }

  Future<String?> getToken() async{
    var users= await Hive.box('users',);
    // Logger().e("dd");
    if(users.get('token')==null){
      print("hive ");
    }else{
      print("hive "+users.get('token'));
    }
    return users.get('token');
  }

  Future<Box> getUser() async{
    var users= await Hive.box('users',);
    // Logger().e("dd");
    if(users.get('token')==null){
      Logger().w("hive ${users.get("image")}");

    }else{
      print("hive "+users.get('token'));
      // Logger().w("hive ${users.get("image")}");
    }
    return users;
  }

  getData() async{
    var users= await Hive.openBox('users');

    if(users.get('token')==null){
      print("hive ");
    }else{
      print("hive "+users.get('token'));
    }

    return users;
  }

  Future<String> getUserId() async{
    var users= await Hive.box('users',);
    // Logger().e("dd");
    if(users.get('id')==null){
      print("hive ");
    }else{
      print("hive "+users.get('id'));
    }
    return users.get('id');
  }


  Future storeTokenUserdata(
       {String? token,
      String? image,
      String? id,
      String? name,
      String? email,
      String? mobile,
      String? deviceToken,
       }) async{
     Box? users= Hive.box('users');
     users.put("token", token);
     users.put("id", id);
     users.put("email", email);
     users.put("name", name);
     users.put("image", image);
     users.put("mobile", mobile);
     users.put("deviceToken", deviceToken);
     print(users.get('token'));

     return "done";
   }

   Future UserUpdata(
       {String? name,
         String? email,
         String? mobile}) async{

     Box? users= Hive.box('users');
     users.put("email", email);
     users.put("name", name);
     users.put("mobile", mobile);
     return "done";
   }

  Future onbordingDone() async{
    Box? users= Hive.box('users');
    users.put("onBording", true);
    return "done";
  }

  Future<bool> onbordingCheck() async{
    Box? users= Hive.box('users');
    return  users.get("onBording")!=null;
  }



  ///product=======================================================================

  // Future<String>addItem(ProductModel item,int quantity) async {
  //   var box = await Hive.openBox<ProductLocal>('productLocal');
  //   ProductLocal clone=ProductLocal(
  //     height: item.height,
  //     image: item.image,
  //     name:item.name,
  //     id: item.id,
  //     brandId:item.brandId==null?null: ProductNameLocal(
  //         id: item.brandId!.id,
  //         name: item.brandId!.name,
  //         label: item.brandId!.name),
  //     categoryId: item.categoryId==null?null: ProductNameLocal(
  //         id: item.categoryId!.id,
  //         name: item.categoryId!.name,
  //         label: item.categoryId!.name),
  //     deliveryDuration: item.deliveryDuration,
  //     gallery: item.gallery,
  //     length: item.length,
  //     longDescription: item.longDescription,
  //     regularPrice: item.regularPrice,
  //     retailerId: item.retailerId,
  //     retailerRequestStatus: item.retailerRequestStatus,
  //     salesPrice:item.salesPrice,
  //     schedule: item.schedule,
  //     shippingDeliveryNote: item.shippingDeliveryNote,
  //     shortDescription:item.shortDescription,
  //     sku: item.sku,
  //     status: item.status,
  //     stockQuantity: item.stockQuantity,
  //     tag: item.tag,
  //     unit: item.unit,
  //     weight: item.weight,
  //     width: item.width,
  //     quantity: quantity
  //   );
  //
  //
  //   String result="";
  //   if (!box.values.toList().contains(clone)) {
  //     box.add(clone);
  //     result="Successfully add to cart";
  //   }else{
  //     result="Already you add this item in cart";
  //   }
  //   return result;
  // }
  //
  //
  // List<ProductLocal> _inventoryList = <ProductLocal>[];
  // List get inventoryList => _inventoryList;
  //
  // Future<List<ProductLocal>> getItem() async {
  //   final box = await Hive.openBox<ProductLocal>('productLocal');
  //
  //   _inventoryList = box.values.toList();
  //
  //   // Logger().w(_inventoryList.length);
  //
  //   return _inventoryList;
  // }
  //
  // Future<List<ProductLocal>> checkItem(String id) async {
  //   final box = await Hive.openBox<ProductLocal>('productLocal');
  //
  //
  //   List<ProductLocal> inventoryList=await box.values.where((element) => element.id==id).toList();
  //   Logger().w( box.values.where((element) => element.id==id).toList().length);
  //
  //   return inventoryList;
  // }
  //
  //
  //
  // Future<List<ProductLocal>>  removeCart(int index) async{
  //   final box = await Hive.openBox<ProductLocal>('productLocal');
  //
  //   box.deleteAt(index);
  //   _inventoryList = box.values.toList();
  //
  //
  //   return _inventoryList;
  // }
  //
  // Future<List<ProductLocal>>  updateCart(int index,ProductLocal item,int quantity) async{
  //   final box = await Hive.openBox<ProductLocal>('productLocal');
  //   ProductLocal clone=ProductLocal(
  //     height: item.height,
  //     image: item.image,
  //     name:item.name,
  //     id: item.id,
  //     brandId: item.brandId,
  //     categoryId: item.categoryId,
  //     deliveryDuration: item.deliveryDuration,
  //     gallery: item.gallery,
  //     length: item.length,
  //     longDescription: item.longDescription,
  //     regularPrice: item.regularPrice,
  //     retailerId: item.retailerId,
  //     retailerRequestStatus: item.retailerRequestStatus,
  //     salesPrice:item.salesPrice,
  //     schedule: item.schedule,
  //     shippingDeliveryNote: item.shippingDeliveryNote,
  //     shortDescription:item.shortDescription,
  //     sku: item.sku,
  //     status: item.status,
  //     stockQuantity: item.stockQuantity,
  //     tag: item.tag,
  //     unit: item.unit,
  //     weight: item.weight,
  //     width: item.width,
  //     quantity: quantity
  //   );
  //
  //   box.putAt(index,clone);
  //   _inventoryList = box.values.toList();
  //
  //
  //   return _inventoryList;
  // }
  //
  // Future<List<ProductLocal>>  clearCart() async{
  //   final box = await Hive.openBox<ProductLocal>('productLocal');
  //
  //   box.clear();
  //   _inventoryList = box.values.toList();
  //
  //
  //   return _inventoryList;
  // }
  //
  //
  //


///product=======================================================================





  /// Adreesss ===================


   // Future<String>addAddress(String? address,devisionId,devisionName,districId,districName) async {
   //   var box = await Hive.openBox<AddressLocal>('addressLocal');
   //   AddressLocal clone=AddressLocal(
   //       address: address??"",
   //       districId: districId??"",
   //       districName: districName??"",
   //       devisionId: devisionId??"",
   //       devisionName: devisionName??"",
   //   );
   //   String result="";
   //   if (!box.values.toList().contains(clone)) {
   //     box.add(clone);
   //     result="Successfully add address";
   //   }else{
   //     result="Already you add this address";
   //   }
   //   return result;
   // }
   //
   //
   // List<AddressLocal> _addressList = <AddressLocal>[];
   // List get addressList => _addressList;
   //
   // Future<List<AddressLocal>> getAddress() async {
   //   final box = await Hive.openBox<AddressLocal>('addressLocal');
   //
   //   _addressList = box.values.toList();
   //
   //   Logger().w(_addressList.length);
   //
   //   return _addressList;
   // }
   //
   // Future<List<AddressLocal>>  removeAddress(int index) async{
   //   final box = await Hive.openBox<AddressLocal>('addressLocal');
   //
   //   box.deleteAt(index);
   //   _addressList = box.values.toList();
   //
   //
   //   return _addressList;
   // }



}