import 'package:flutter/material.dart';
//import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../constants/theme.dart';

class NavbarClub extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  final bool backButton;
  final bool transparent;

  final bool noShadow;
  final Color bgColor;

  NavbarClub({
    this.title = "",
    this.transparent = false,
    this.backButton = false,
    this.noShadow = false,
    this.bgColor = ArgonColors.white,
  });

  final double _prefferedHeight = 180.0;

  @override
  _NavbarClubState createState() => _NavbarClubState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarClubState extends State<NavbarClub> {
  late String activeTag;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        decoration: BoxDecoration(
            color: !widget.transparent ? widget.bgColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: !widget.transparent && !widget.noShadow
                      ? ArgonColors.initial
                      : Colors.transparent,
                  spreadRadius: -10,
                  blurRadius: 12,
                  offset: Offset(0, 5))
            ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                                !widget.backButton
                                    ? Icons.menu
                                    : Icons.arrow_back_ios,
                                color: !widget.transparent
                                    ? (widget.bgColor == ArgonColors.white
                                        ? ArgonColors.initial
                                        : ArgonColors.white)
                                    : ArgonColors.black,
                                size: 24.0),
                            onPressed: () {
                              if (!widget.backButton)
                                Scaffold.of(context).openDrawer();
                              else
                                Navigator.pop(context);
                            }),
                        Text(widget.title,
                            style: TextStyle(
                                color: !widget.transparent
                                    ? (widget.bgColor == ArgonColors.white
                                        ? ArgonColors.initial
                                        : ArgonColors.white)
                                    : ArgonColors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0)),
                      ],
                    ),

                    // if (widget.rightOptions)
                    //   Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () {
                    //           Navigator.pushNamed(context, '/pro');
                    //         },
                    //         child: IconButton(
                    //             icon: Icon(Icons.notifications_active,
                    //                 color: !widget.transparent
                    //                     ? (widget.bgColor == ArgonColors.white
                    //                         ? ArgonColors.initial
                    //                         : ArgonColors.white)
                    //                     : ArgonColors.white,
                    //                 size: 22.0),
                    //             onPressed: null),
                    //       ),
                    //       GestureDetector(
                    //         onTap: () {
                    //           Navigator.pushNamed(context, '/pro');
                    //         },
                    //         child: IconButton(
                    //             icon: Icon(Icons.shopping_basket,
                    //                 color: !widget.transparent
                    //                     ? (widget.bgColor == ArgonColors.white
                    //                         ? ArgonColors.initial
                    //                         : ArgonColors.white)
                    //                     : ArgonColors.white,
                    //                 size: 22.0),
                    //             onPressed: null),
                    //       ),
                    //],
                    //)
                  ],
                ),
                // if (widget.searchBar)
                //   Padding(
                //     padding: const EdgeInsets.only(
                //         top: 8, bottom: 4, left: 15, right: 15),
                //     child: Input(
                //         placeholder: "Tìm Kiếm Cuộc Thi và Sự Kiện",
                //         controller: widget.searchController,
                //         onChanged: widget.searchOnChanged,
                //         autofocus: widget.searchAutofocus,
                //         suffixIcon:
                //             Icon(Icons.zoom_in, color: ArgonColors.muted),
                //         onTap: () {
                //           Navigator.pushNamed(context, '/pro');
                //         },
                //         prefixIcon: Icon(Icons
                //             .design_services_sharp)), // để icon của app mình
                //   ),
                // SizedBox(
                //   height: 10.0,
                // ),
                // if (categories)
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           //Navigator.pushNamed(context, '/pro');
                //         },
                //         child: Row(
                //           children: [
                //             Icon(Icons.camera,
                //                 color: ArgonColors.initial, size: 22.0),
                //             SizedBox(width: 10),
                //             Text(widget.categoryOne,
                //                 style: TextStyle(
                //                     color: ArgonColors.initial,
                //                     fontSize: 16.0)),
                //           ],
                //         ),
                //       ),
                //       SizedBox(width: 30),
                //       Container(
                //         color: ArgonColors.initial,
                //         height: 25,
                //         width: 1,
                //       ),
                //       SizedBox(width: 30),
                //       GestureDetector(
                //         onTap: () {
                //           //Navigator.pushNamed(context, '/pro');
                //         },
                //         child: Row(
                //           children: [
                //             Icon(Icons.shopping_cart,
                //                 color: ArgonColors.initial, size: 22.0),
                //             SizedBox(width: 10),
                //             Text(widget.categoryTwo,
                //                 style: TextStyle(
                //                     color: ArgonColors.initial,
                //                     fontSize: 16.0)),
                //       ],
                //     ),
                //   )
                // ],
                // ),
                //if (tagsExist)
                // Container(
                //   height: 40,
                //   child: ScrollablePositionedList.builder(
                //     itemScrollController: _scrollController,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: widget.tags.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return GestureDetector(
                //         onTap: () {
                //           if (activeTag != widget.tags[index]) {
                //             setState(() => activeTag = widget.tags[index]);
                //             _scrollController.scrollTo(
                //                 index:
                //                     index == widget.tags.length - 1 ? 1 : 0,
                //                 duration: Duration(milliseconds: 420),
                //                 curve: Curves.easeIn);
                //             if (widget.getCurrentPage != null)
                //               widget.getCurrentPage(activeTag);
                //           }
                //         },
                //         child: Container(
                //             margin: EdgeInsets.only(
                //                 left: index == 0 ? 46 : 8, right: 8),
                //             padding: EdgeInsets.only(
                //                 top: 4, bottom: 4, left: 20, right: 20),
                //             // width: 90,
                //             decoration: BoxDecoration(
                //                 color: activeTag == widget.tags[index]
                //                     ? ArgonColors.primary
                //                     : ArgonColors.secondary,
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(4.0))),
                //             child: Center(
                //               child: Text(widget.tags[index],
                //                   style: TextStyle(
                //                       color: activeTag == widget.tags[index]
                //                           ? ArgonColors.white
                //                           : ArgonColors.black,
                //                       fontWeight: FontWeight.w600,
                //                       fontSize: 14.0)),
                //             )),
                //       );
                //     },
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}
