import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:pocketdot/models/chain.dart';
import 'package:pocketdot/pages/status.dart';
import 'package:provider/provider.dart';
import './terminal_view.dart';

ValueNotifier<int> pageIndex = ValueNotifier(0);
ValueNotifier<String> chainName = ValueNotifier<String>('Vara');

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            title: ValueListenableBuilder<String>(
		valueListenable: chainName,
		builder: (context, value, child) {
		  return Text('$title::<$value>');
		},
            ),
            flexibleSpace: GestureDetector(
                onTap: () {
		    FocusManager.instance.primaryFocus?.unfocus();
                },
            ),
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.pink, fontFamily: 'Syncopate-Bold')),
        body: ValueListenableBuilder(
	    valueListenable: pageIndex,
	    builder: (context, value, child) {
		return IndexedStack(
		    index: pageIndex.value,
		    children: [
			Center(
			    child: Consumer<Chains>(
				builder: (context, chains, child) => const ChainSyncStatus(),
			    ),
			),
			HostTerminalView(),
			Center(child: Text("Settings")),
		    ],
		);
	    },
	),
        bottomNavigationBar: ValueListenableBuilder(
            valueListenable: pageIndex,
            builder: (context, value, child) {
                return BottomNavigationBar(
                    currentIndex: pageIndex.value,
		    onTap: (index) {
			debugPrint('tapped on page $index');
			pageIndex.value = index;
			FocusManager.instance.primaryFocus?.unfocus();
		    },
		    items: [
			BottomNavigationBarItem(label: "Light Client", icon: Icon(Icons.flash_on)),
			BottomNavigationBarItem(label: "Full Node", icon: Icon(Icons.monitor)),
			BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings)),
		    ],
                );
            },
        ),
        drawer: Drawer(
            child: TextButtonTheme(
                data: TextButtonThemeData(
                  style: TextButton.styleFrom(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.zero,
                      foregroundColor: Colors.grey.shade300),
                ),
                child: ListView(padding: EdgeInsets.zero, children: [
                  SizedBox(
                      height: MediaQuery.of(context).padding.top +
                          kToolbarHeight +
                          8,
                      child: DrawerHeader(
                        decoration: const BoxDecoration(
                          color: Colors.pink,
                        ),
                        child: Text('Chains',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: Colors.white,
                                    fontFamily: 'Syncopate-Bold')),
                      )),
                  // Add configured chains from provider
		  ListTile(
		      // leading: e.logo,
		      title: Text("Terminal",
			  style: Theme.of(context)
			      .textTheme
			      .titleMedium!
			      .copyWith(
				  color: Colors.black,
				  fontFamily: 'Syncopate-Bold')),
		      onTap: () async {
		          FocusManager.instance.primaryFocus?.unfocus();
			  // Select the chain
			  // await context.read<Chains>().select(e);
			  // Then close the drawer
			  Navigator.pop(context);
		      },
		  ),
                  // Add configured chains from provider
                  ...context.read<Chains>().chains.map((e) => e is RelayChain ? ExpansionTile(
                        title: TextButton.icon(
                          icon: e.logo,
                          label: Text(e.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Colors.black,
                                      fontFamily: 'Syncopate-Bold')),
                          onPressed: () async {
                            // Select the chain
                            await context.read<Chains>().select(e);
                            chainName.value = e.name; // relaychain
                            // Then close the drawer
                            Navigator.pop(context);
                          },
                        ),
                        initiallyExpanded: true,
                        children: e.parachains
                            .map((e) => ListTile(
                                  leading: e.logo,
                                  title: Text(e.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              fontFamily: 'Syncopate-Bold')),
				  contentPadding:
				      const EdgeInsets.only(left: 25),
                                  onTap: () async {
		                    FocusManager.instance.primaryFocus?.unfocus();
                                    // Select the chain
                                    await context.read<Chains>().select(e);
                                    // Then close the drawer
                                    chainName.value = e.relayChain.name + '::' + e.name; // parachain
                                    Navigator.pop(context);
                                  },
                                ))
                            .toList(),
                      ) : ListTile(
			  leading: e.logo,
			  title: Text(e.name,
			      style: Theme.of(context)
				  .textTheme
				  .titleMedium!
				  .copyWith(
				      color: Colors.black,
				      fontFamily: 'Syncopate-Bold')),
			  onTap: () async {
			    FocusManager.instance.primaryFocus?.unfocus();
			    // Select the chain
			    await context.read<Chains>().select(e);
			    // Then close the drawer
                            chainName.value = e.name; // solochain
			    Navigator.pop(context);
			  },
		     ))
                ]))));
  }
}
