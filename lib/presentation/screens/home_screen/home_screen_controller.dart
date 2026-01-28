import 'package:flutter/material.dart';
import 'package:livingspirit/domain/entities/app_error.dart';
import 'package:livingspirit/domain/entities/banner_entity.dart';
import 'package:livingspirit/domain/entities/product_entity.dart';

class HomeScreenController extends ChangeNotifier {
  AppError? appError;

  List<BannerEntity> homeBanner = [];
    List<ProductEntity> newArrivals = [];


  getData() async {
    appError = null;

    homeBanner = const [
      BannerEntity(
        imageId: "1",
        imageUrl: "https://img.pikbest.com/origin/06/39/82/47ppIkbEsT7dJ.jpg!w700wp",
        
      ),
      BannerEntity(
        imageId: "2",
        imageUrl: "https://img.pikbest.com/origin/06/39/82/47ppIkbEsT7dJ.jpg!w700wp",
      ),
      BannerEntity(
        imageId: "3",
        imageUrl: "https://img.pikbest.com/origin/06/39/82/47ppIkbEsT7dJ.jpg!w700wp",
      ),
    ];

    


     newArrivals = const [
      ProductEntity(
          productId: "5",
          productName: "Nike Full Force Low Men's Shoes",
          productType: "Shoes",
          productPrice: "149.99",
          productCutPrice: "534,33",
          productOffer: "24% Off",
          productImage:
              "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_300,h_300/global/310147/11/sv01/fnd/IND/fmt/png/PWR-NITRO%E2%84%A2-SQD-2-Women's-Training-Shoes", 
              productArabicName: ''),
      ProductEntity(
          productId: "6",
          productName: "Nike Full Force Low Men's Shoes",
          productType: "Accessories",
          productPrice: "149.99",
          productCutPrice: "534,33",
          productOffer: "24% Off",
          productImage:
              "https://m.media-amazon.com/images/I/612Td6jh-QL._UY900_.jpg",
               productArabicName: ''),
      ProductEntity(
          productId: "4",
          productName: "Nike Full Force Low Men's Shoes",
          productType: "Accessories",
          productPrice: "149.99",
          productCutPrice: "534,33",
          productOffer: "24% Off",
          productImage:
              "https://m.media-amazon.com/images/I/612Td6jh-QL._UY900_.jpg",
               productArabicName: ''),
      ProductEntity(
          productId: "2",
          productName: "Nike Full Force Low Men's Shoes",
          productType: "Shoes",
          productPrice: "149.99",
          productCutPrice: "534,33",
          productOffer: "24% Off",
          productImage:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC5hPoNj8dxAcHwFSM9NgA8DdumzNahfGsOg&s",
               productArabicName: ''),
    ];
  }
}
