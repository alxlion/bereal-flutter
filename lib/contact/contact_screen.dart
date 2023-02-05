import 'package:animate_do/animate_do.dart';
import 'package:bereal/styles/theme_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  bool _searchBoxFocused = false;
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Image.asset('assets/img/logo.png', height: 40)),
          toolbarHeight: 40,
          leading: const SizedBox(
            width: 10,
          ),
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              child: const Icon(Icons.arrow_forward_outlined),
              onPressed: () => context.pop(),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade900),
                      child: Focus(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              iconColor: Colors.grey.shade500,
                              border: InputBorder.none,
                              hintText: 'Add or search friends',
                              hintStyle: ref.watch(stylesProvider).text.hintSearchInput),
                          style: ref.watch(stylesProvider).text.body,
                        ),
                        onFocusChange: (value) {
                          setState(() {
                            if (value) {
                              _searchBoxFocused = true;
                            } else {
                              _searchController.clear();
                              _searchBoxFocused = false;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  Visibility(
                      visible: _searchBoxFocused,
                      child: FadeInRight(
                        duration: const Duration(milliseconds: 300),
                        controller: (controller) => _animationController = controller,
                        child: TextButton(
                          child: const Text("Cancel"),
                          onPressed: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                            });
                          },
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 20),
              Flexible(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(255, 24, 24, 5),
                        Color.fromARGB(255, 28, 15, 15),
                        Color.fromARGB(255, 29, 29, 29),
                      ],
                    )),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: CachedNetworkImageProvider('https://i.pravatar.cc/100?img=38'),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Invite your friends on BeReal',
                            style: ref.watch(stylesProvider).text.bodySmallBold,
                          ),
                          Text('bere.al/alice007',
                              style: ref.watch(stylesProvider).text.bodySmall.copyWith(color: Colors.grey.shade500))
                        ],
                      ),
                    ],
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.share))
                ]),
              ))
            ],
          ),
        ));
  }
}
