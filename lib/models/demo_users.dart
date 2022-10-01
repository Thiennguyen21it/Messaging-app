import 'package:flutter/material.dart';

const users = [
  userGordon,
  userSalvatore,
  userSacha,
  userDeven,
  userSahil,
  userReuben,
  userNash,
];

const userGordon = DemoUser(
  id: 'gordon',
  name: 'Gordon Hayes',
  image:
      'https://kenh14cdn.com/thumb_w/660/2020/5/28/0-1590653959375414280410.jpg',
);

const userSalvatore = DemoUser(
  id: 'salvatore',
  name: 'Salvatore Giordano',
  image:
      'https://vienthammydiva.vn/wp-content/uploads/2022/05/gai-xinh-trung-quoc-1-1.jpg',
);

const userSacha = DemoUser(
  id: 'sacha',
  name: 'Sacha Arbonel',
  image: 'https://luv.vn/wp-content/uploads/2021/08/hinh-anh-gai-xinh-71.jpg',
);

const userDeven = DemoUser(
  id: 'deven',
  name: 'Deven Joshi',
  image:
      'https://image-us.24h.com.vn/upload/3-2022/images/2022-07-11/21-1657535366-24-width650height650.jpg',
);

const userSahil = DemoUser(
  id: 'sahil',
  name: 'Sahil Kumar',
  image:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTrfd8l5FImvomzASgdtEbDksrT_pO4AooRaz5zeU&s',
);

const userReuben = DemoUser(
  id: 'reuben',
  name: 'Reuben Turner',
  image:
      'https://gamek.mediacdn.vn/133514250583805952/2021/9/17/photo-1-1631856680040545802895.jpg',
);

const userNash = DemoUser(
  id: 'nash',
  name: 'Nash Ramdial',
  image: 'https://danviet.mediacdn.vn/2021/5/5/2-16201893641302021299674.jpg',
);

@immutable
class DemoUser {
  final String id;
  final String name;
  final String image;

  const DemoUser({
    required this.id,
    required this.name,
    required this.image,
  });
}
