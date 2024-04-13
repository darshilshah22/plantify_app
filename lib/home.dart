import 'package:flutter/material.dart';
import 'package:plantify_app/utils/colors.dart';
import 'package:plantify_app/utils/fonts.dart';
import 'package:plantify_app/utils/images.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: 64,
        title: Row(
          children: [
            SizedBox(width: 24),
            Image.asset(AppImages.logo, height: 48),
            SizedBox(width: 16),
            Text(
              "Plantify".toUpperCase(),
              style: TextStyle(
                fontSize: 24,
                color: AppColor.textColor,
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Image.asset(
            AppImages.notify,
            height: 24,
          ),
          SizedBox(width: 24),
          Image.asset(
            AppImages.menu,
            height: 24,
          ),
          SizedBox(width: 24),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildHero(),
            buildSearchBar(),
            TabBar(
              controller: _tabController,
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              indicator: MyIndicator(
                indicatorColor: AppColor.primary,
                tabController: _tabController,
              ),
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              dividerHeight: 0,
              padding: EdgeInsets.only(left: 32, top: 24),
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColor.primary,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColor.textColor,
              ),
              labelPadding: EdgeInsets.only(right: 32, left: 0),
              tabs: [
                Tab(text: 'Top Pick'),
                Tab(text: 'Indoor'),
                Tab(text: 'Outdoor'),
                Tab(text: 'Seeds'),
                Tab(text: 'Plants'),
                Tab(text: 'Paperomia'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return buildProductCard();
                            }),
                      )
                    ],
                  ),
                  Center(child: Text('Tab 2 Content')),
                  Center(child: Text('Tab 3 Content')),
                  Center(child: Text('Tab 4 Content')),
                  Center(child: Text('Tab 5 Content')),
                  Center(child: Text('Tab 6 Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHero() {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Stack(
        children: [
          Image.asset(AppImages.hero),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 40),
                child: Text(
                  "There’s a Plant\nfor everyone",
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 32,
                      height: 1.3,
                      color: AppColor.textColor,
                      fontFamily: 'Philosopher',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 24,
                ),
                child: Text.rich(
                  TextSpan(
                    text: "Get your 1st plant\n@ ",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColor.textColor,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "40% off",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.textColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.primary,
                          decorationThickness: 4,
                        ),
                      ),
                    ],
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: searchController,
              cursorColor: AppColor.textColor,
              decoration: InputDecoration(
                  enabledBorder: outlineBorder(),
                  focusedBorder: outlineBorder(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 16),
                    child: Image.asset(
                      AppImages.search,
                      width: 28,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Image.asset(
                      AppImages.scan,
                      width: 28,
                    ),
                  ),
                  hintText: "Search",
                  hintStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.textColor),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Image.asset(
              AppImages.filter,
              width: 36,
            ),
          )
        ],
      ),
    );
  }

  InputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        color: AppColor.textColor,
      ),
    );
  }

  Widget buildProductCard() {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 64),
          child: ClipPath(
            clipper: BackgroundClipper3(),
            child: Container(
              height: 250,
              padding: EdgeInsets.only(top: 32, left: 32, right: 32),
              width: MediaQuery.of(context).size.width / 1.25,
              color: Color(0xD19CE5CB),
              child: Stack(
                children: [
                  Image.asset(AppImages.bgLines),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Air Purifier",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 32),
                          Image.asset(AppImages.steps, height: 32)
                        ],
                      ),
                      Text(
                        "Peperomia",
                        style: TextStyle(
                            fontFamily: 'Philosopher',
                            fontSize: 48,
                            fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(height: 24,),
                      Row(
                        children: [
                          Text(
                            "\$400",
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 32),
                          Image.asset(AppImages.heart, height: 32),
                          SizedBox(width: 32),
                          Image.asset(AppImages.smile, height: 84),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 10,
          child: Image.asset(
            AppImages.peperomia,
            height: 200,
          ),
        )
      ],
    );
  }
}

class MyIndicator extends Decoration {
  final Color? indicatorColor;
  final TabController? tabController;

  const MyIndicator({this.indicatorColor, this.tabController});

  @override
  _MyPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MyPainter(this, onChanged!);
  }
}

class _MyPainter extends BoxPainter {
  final MyIndicator decoration;
  final VoidCallback onChanged;

  _MyPainter(this.decoration, this.onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = Offset(offset.dx, configuration.size!.height - 2) &
        Size(configuration.size!.width / 2, 4);
    final Paint paint = Paint()
      ..color = decoration.indicatorColor!
      ..style = PaintingStyle.fill;
    canvas.drawRect(rect, paint);
  }
}

class BackgroundClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 50.0;

    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * .3 + roundnessFactor);
    path.quadraticBezierTo(size.width, 35, size.width - 50, 30);
    path.lineTo(roundnessFactor, 0);
    path.quadraticBezierTo(0, 0, 0, roundnessFactor);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
