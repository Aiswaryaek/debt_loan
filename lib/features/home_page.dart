import 'package:debt_loan/models/horizontal_model.dart';
import 'package:flutter/material.dart';
import '../core/ui_state.dart';
import '../providers/debt_providers.dart';
import '../repositories/debt_repositories.dart';
import 'package:provider/provider.dart';
import '../styles/colors.dart';
import '../styles/text_style.dart';
import '../widgets/main_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final optionItems = <DebtModels>[];
  GetDebtProvider getDebtProvider =
      GetDebtProvider(debtRepository: DebtRepository());
  final int _page = 0;


  @override
  void initState() {
    getDebtProvider.getMyDebts(_page);
    super.initState();
    optionItems.add(DebtModels('assets/images/bottom_left_arrow.png', 'Owe me',
        '\$ 1 250', '2 debts', tileColorGreen));
    optionItems.add(DebtModels('assets/images/top_right_arrow.png', 'I owe',
        '\$ 1 130', '2 debts', tileColorOrange));
    optionItems.add(DebtModels('assets/images/bottom_left_arrow.png', 'Owe me',
        '\$ 1 250', '2 dents', tileColorGreen));
    optionItems.add(DebtModels('assets/images/top_right_arrow.png', 'I owe',
        '\$ 1 130', '2 dents', tileColorOrange));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: gradientEndColor,
        appBar: mainAppBar(context, 'Home'),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: optionItems.length,
                      separatorBuilder: (context, _) =>
                          const SizedBox(width: 11),
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                        height: 160,
                        width: 147,
                        decoration: BoxDecoration(
                            color: optionItems[index].color,
                            border: Border.all(
                              color: optionItems[index].color,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(optionItems[index].title,
                                    style: cartTitleStyle),
                                Image.asset(
                                  optionItems[index].image,
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                            const SizedBox(height: 9),
                            Text(optionItems[index].subtitle,
                                style: cartSubtitleStyle),
                            const SizedBox(height: 9),
                            Text(optionItems[index].count,
                                style: cartTitleStyle),
                            const SizedBox(height: 2),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(22, 75, 22, 10),
                      decoration: const BoxDecoration(
                        color: sheetColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: sheetColor,
                              spreadRadius: 0,
                              blurRadius: 3),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('My debts', style: myDebtStyle),
                              Text(
                                'See All',
                                style: seeAllStyle,
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Expanded(child: myDebts()),
                        ],
                      ),
                    ),
                  ),
                ))
              ],
            ),
            Positioned(
              top: 137.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 72,
                        width: 73,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: backgroundColor),
                        child: CircleAvatar(
                          backgroundColor: roundTileColor,
                          child:
                              Image.asset('assets/images/plus.png', height: 13),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text('NEW', style: avatarTextStyle),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 72,
                        width: 73,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: backgroundColor),
                        child: CircleAvatar(
                          backgroundColor: roundTileColor,
                          child: Image.asset('assets/images/topright-arrow.png',
                              height: 13),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text('PAY OFF', style: avatarTextStyle),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 72,
                        width: 73,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: backgroundColor),
                        child: CircleAvatar(
                          backgroundColor: roundTileColor,
                          child: Image.asset(
                              'assets/images/bottomleft_arrow.png',
                              height: 13),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text('LEND', style: avatarTextStyle),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 72,
                        width: 73,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: backgroundColor),
                        child: CircleAvatar(
                          backgroundColor: roundTileColor,
                          child:
                              Image.asset('assets/images/grid.png', height: 13),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text('MORE', style: avatarTextStyle),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  myDebts() {
    return ChangeNotifierProvider<GetDebtProvider>(
      create: (ctx) {
        return getDebtProvider;
      },
      child: Consumer<GetDebtProvider>(builder: (ctx, data, _) {
        var state = data.getMyDebtsLiveData().getValue();
        if (state is IsLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            child: const Center(
              child: CircularProgressIndicator(
                color: tileHalfBlue,
              ),
            ),
          );
        } else if (state is Initial) {
          return const Text('This List Is Empty');
        } else if (state is Success) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: data.getDebt.data!.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: tileColor,
                        border: Border.all(
                          color: tileColor,
                        ),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5))),
                    child: ListTile(
                      horizontalTitleGap: 2,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 12.0),
                      leading: Transform.translate(
                          offset: const Offset(-0, 2),
                          child: Image.network(
                            data.getDebt.data![index].img!,
                            height: 30,
                          )),
                      title: Text(
                        data.getDebt.data![index].name!,
                        style: listTitleTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                ],
              ));
        } else if (state is Failure) {
          return Center(
            child: Text('${state.error}'),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
