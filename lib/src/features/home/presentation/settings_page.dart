import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loomi_challenge/src/core/extensions/colors.dart';
import 'package:loomi_challenge/src/core/utils/custom_textstyles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Container(
        color: CustomColors.imperioGrayBackground,
        child: Column(children: [
          Row(
            children: [
              const Spacer(),
              IconButton(
                  onPressed: () {
                    print("Settings button pressed");
                  },
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Image.asset("assets/images/default/search.png",
                        color: Colors.black, width: 20, height: 20),
                  )),
              const SizedBox(width: 16),
              IconButton(
                  onPressed: () {
                    print("Settings button pressed");
                  },
                  icon: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 12,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        Image.asset("assets/images/default/question.png",
                            color: Colors.black, width: 20, height: 20),
                        const SizedBox(width: 10),
                        Text(
                          "Ajuda e suporte",
                          style: CustomTextSyle.caption3,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  )),
            ],
          ),
          const Divider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsRowButton(
                  callbackHandle: () {
                    print("pressed on home");
                  },
                  title: "Início",
                  imageAsset: "assets/images/default/home.png"),
              SettingsRowButton(
                  callbackHandle: () {
                    print("pressed on sports");
                  },
                  title: "Esportes",
                  imageAsset: "assets/images/whistle_icon.png"),
              SettingsRowButton(
                  callbackHandle: () {
                    print("pressed on news and tips");
                  },
                  title: "Notícias e Dicas",
                  imageAsset: "assets/images/default/bookmark.png"),
              SettingsRowButton(
                  callbackHandle: () {
                    print("pressed on favorites");
                  },
                  title: "Favoritos",
                  imageAsset: "assets/images/default/star.png"),
              SettingsRowButton(
                  callbackHandle: () {
                    print("pressed on influencers");
                  },
                  title: "Influenciadores",
                  imageAsset: "assets/images/default/users_1.png"),
              SettingsRowButton(
                  callbackHandle: () {
                    print("pressed on odds comparating");
                  },
                  title: "Comparador de odds",
                  imageAsset: "assets/images/default/chart.png"),
            ],
          ),
          const Divider(),
          Column(
            children: [
              SettingsRowButton(
                  callbackHandle: () {
                    print("pressed on game conscience");
                  },
                  title: "Jogo consciente",
                  imageAsset: "assets/images/default/coupon.png"),
              SettingsRowButton(
                  callbackHandle: () {
                    print("pressed on privacy");
                  },
                  title: "Privacidade e segurança",
                  imageAsset: "assets/images/default/shield.png")
            ],
          ),
        ]),
      )),
    ));
  }
}

class SettingsRowButton extends StatelessWidget {
  final VoidCallback callbackHandle;
  final String title;
  final String imageAsset;

  SettingsRowButton({
    Key? key,
    required this.callbackHandle,
    required this.title,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callbackHandle,
      child: Row(
        children: [
          Image.asset(
            imageAsset,
            color: Colors.black,
            height: 20,
            width: 20,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: CustomTextSyle.caption1,
          ),
        ],
      ),
    );
  }
}
