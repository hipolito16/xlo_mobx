import 'package:xlo_mobx/stores/page_store.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CreateAdButton extends StatefulWidget {
  const CreateAdButton(this.scrollController, {Key? key}) : super(key: key);

  final ScrollController? scrollController;

  @override
  State<CreateAdButton> createState() => _CreateAdButtonState();
}

class _CreateAdButtonState extends State<CreateAdButton> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? buttonAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    buttonAnimation = Tween<double>(begin: 0, end: 66).animate(CurvedAnimation(parent: controller!, curve: const Interval(0.4, 1, curve: Curves.easeOut)));
    widget.scrollController!.addListener(scrollChanged);
  }

  void scrollChanged() {
    if (widget.scrollController!.position.userScrollDirection == ScrollDirection.forward) {
      controller!.forward();
    } else {
      controller!.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: buttonAnimation!,
        builder: (_, __) {
          return FractionallySizedBox(
            widthFactor: 0.6,
            child: Container(
                height: 50,
                margin: EdgeInsets.only(bottom: buttonAnimation!.value),
                child: ElevatedButton(
                    onPressed: () {
                      GetIt.I<PageStore>().setPage(1);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.orange,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt, color: Colors.white),
                        SizedBox(width: 8),
                        Expanded(child: Text('Anunciar agora', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600))),
                      ],
                    ))),
          );
        });
  }
}
