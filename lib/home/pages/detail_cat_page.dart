import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:test_cat_pragma/commons/widgets/custom_sliver.dart';
import 'package:test_cat_pragma/domain/entities/cat.dart';
import 'package:test_cat_pragma/home/widgets/container_image_cat.dart';

class DetailCatPage extends StatelessWidget {
  final Cat cat;

  const DetailCatPage({
    Key? key,
    required this.cat,
  }) : super(key: key);

  Widget _contentData({
    required String title,
    required String text,
    required TextStyle textStyle,
  }) {
    const _textTitleStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: _textTitleStyle),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(text, style: textStyle),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const _textStyle = TextStyle(fontSize: 13);
    return Scaffold(
      backgroundColor: Colors.white,
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return SafeArea(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: MultiSliver(
                      children: [
                        SliverAppBar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          centerTitle: true,
                          title: Text(
                            cat.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          pinned: true,
                          shadowColor: Colors.transparent,
                        ),
                        SliverPersistentHeader(
                          pinned: orientation == Orientation.portrait,
                          floating: orientation == Orientation.landscape,
                          delegate: CustomSliver(
                            child: PreferredSize(
                              preferredSize: const Size.fromHeight(500.0),
                              child: Container(
                                color: Colors.white,
                                width: double.infinity,
                                child: ContainerImageCat(
                                  imageCat: cat.image,
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ];
              },
              body: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: const PageStorageKey<String>('ScrollDetailCatKey'),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        sliver: SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _contentData(
                                title: 'Descripción',
                                text: cat.description,
                                textStyle: _textStyle,
                              ),
                              _contentData(
                                title: 'País',
                                text: cat.origin,
                                textStyle: _textStyle,
                              ),
                              _contentData(
                                title: 'Inteligencia',
                                text: '${cat.intelligence}',
                                textStyle: _textStyle,
                              ),
                              _contentData(
                                title: 'Adaptabilidad',
                                text: '${cat.adaptability}',
                                textStyle: _textStyle,
                              ),
                              _contentData(
                                title: 'Tiempo de vida',
                                text: cat.lifeSpan,
                                textStyle: _textStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
