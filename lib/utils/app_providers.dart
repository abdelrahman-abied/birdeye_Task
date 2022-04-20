import 'package:birdeye_task/view_model/details_view_model.dart';
import 'package:birdeye_task/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (context) => HomeVM()),
  ChangeNotifierProvider(create: (context) => DetailsVM()),
];
