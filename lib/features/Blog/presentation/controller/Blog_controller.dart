
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../../core/common/data/Category/Categorie.dart';
import '../../../More/data/models/Order/Order.dart';
import '../../../More/data/models/Order/OrderResponse.dart';
import '../../data/models/Blog/Blog.dart';
import '../../data/models/Blog/BlogDetailsResponse.dart';
import '../../data/models/Blog/BlogResponse.dart';
import '../../domain/entities/Blog.dart';
import '../../domain/usecase/Blog_use_case.dart';
import 'package:flutter/material.dart';

class BlogController extends GetxController implements GetxService{
 final BlogUseCase? blogUseCase;
  BlogController({ this.blogUseCase });


 Rx<BlogDetailsResponse?> blogDetailsResponse = Rx<BlogDetailsResponse?>(null);
 final blogDetailsCircle = false.obs;

 ///=========Blogs with pagination========///////
 final blogCircle = false.obs;
 List<Blog> list = [];
 List<Blog> listCopy = [];
 Rx<BlogResponse?> blogResponse = Rx<BlogResponse?>(null);
 Rx<Categorie?> selectedcategory = Rx<Categorie?>(null);
 ScrollController controller = ScrollController();
 int listLength = 10;
 int page = 1;
 final blogPagingCirculer = false.obs;


 addItems() async {
  controller.addListener(() {
   if (controller.position.maxScrollExtent == controller.position.pixels) {
    listLength++;
    page++;
    getBlogsPagingData(page: page.toString());
    update();
   }
  });
 }

 Future getBlog({String? idx, String? pagex}) async {
  blogCircle.value = true;
  list.clear();
  listCopy.clear();
  page = 1;
  addItems();
var rs=  await blogUseCase?.getBlogs(
   20,
   pagex ?? '1',
  );
  rs!.fold((l){
   Fluttertoast.showToast(
       msg: l.message,
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM,
       timeInSecForIosWeb: 2,
       backgroundColor: Colors.red,
       textColor: Colors.white,
       fontSize: 16.0
   );
   blogCircle.value=false;
  }, (r){
   blogCircle.value = false;
   blogResponse.value = r;
   for (var i = 0; i < r.blogs!.data!.length; i++) {
    list.add(r.blogs!.data![i]);
    listCopy.add(r.blogs!.data![i]);
   }
  });

 }

 getBlogsPagingData({String? page}) async {
  blogPagingCirculer.value = true;
 var rs= await blogUseCase!.getBlogs(
   20,
   page ?? '1',
  );

  rs.fold((l){
   Fluttertoast.showToast(
       msg: l.message,
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM,
       timeInSecForIosWeb: 2,
       backgroundColor: Colors.red,
       textColor: Colors.white,
       fontSize: 16.0
   );
   blogCircle.value=false;
  }, (r){
   for (var i = 0; i < r.blogs!.data!.length; i++) {
    list.add(r.blogs!.data![i]);
    listCopy.add(r.blogs!.data![i]);
   }
   update();
   blogPagingCirculer.value = false;
  });
 }



///================================


 Future getBlogDetails(num? id)  async{
  blogDetailsCircle.value=true;
  blogDetailsResponse.value=null;
  var rs= await blogUseCase!.getBlogDetails(id!.toInt());
  rs.fold((l){
   Fluttertoast.showToast(
       msg: l.message,
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM,
       timeInSecForIosWeb: 2,
       backgroundColor: Colors.red,
       textColor: Colors.white,
       fontSize: 16.0
   );
  }, (r){
   blogDetailsResponse.value=r;
  });
  blogDetailsCircle.value=false;
 }


}


