import 'package:bereal/styles/theme_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          toolbarHeight: 40,
          leading: TextButton(
            child: const Icon(Icons.arrow_back_outlined),
            onPressed: () => context.pop(),
          ),
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              child: const Icon(Icons.more_horiz_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Hero(
                    tag: "profile",
                    child: SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child:
                                CachedNetworkImage(fit: BoxFit.cover, imageUrl: "https://i.pravatar.cc/200?img=38")))),
              ),
              const SizedBox(height: 10),
              Text("Alice", style: ref.watch(stylesProvider).text.title),
              Text("alice007", style: ref.watch(stylesProvider).text.bodyBold),
              const SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("🔗", style: TextStyle(fontSize: 15)),
                  const SizedBox(width: 5),
                  Text("BeRe.al/alice007", style: ref.watch(stylesProvider).text.bodySmall),
                ],
              )
            ],
          ),
        ));
  }
}
