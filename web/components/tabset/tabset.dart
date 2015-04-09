library components.tabset;

import 'package:angular2/angular2.dart';

@Component(selector: 'tabset')
@Template(url: 'components/tabset/tabset.html', directives: const [For])
class Tabset {
  List<Tab> tabs = [];

  selectTab(Tab tab) {
    tabs.forEach((tab) => tab.active = false);
    tab.active = true;
  }

  addTab(Tab tab) {
    if (tabs.isEmpty) tab.active = true;
    tabs.add(tab);
  }
}

@Component(selector: 'tab', bind: const {'tabTitle': 'tab-title'})
@Template(url: 'components/tabset/tab.html')
class Tab {
  bool active = false;
  String tabTitle = "";
  Tabset tabset;
  Tab(@Parent() this.tabset) {
    tabset.addTab(this);
  }
}
