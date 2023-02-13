import 'package:flutter/material.dart';
import 'package:max_way/data/global/api.dart';
import 'package:max_way/data/global/di.dart';

import '../model/data_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

enum _STATUS { initial, loading, success, error }

class _HomeBodyState extends State<HomeBody> {
  final api = di.get<Api>();
  PageProps? data;
  var status = _STATUS.initial;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    if(status==_STATUS.loading){

    }else if(status == _STATUS.error){

    }else{

    }
  }

  Future loadData() async {
    status = _STATUS.loading;
    setState(() {});
    try {
      data = await api.getAllData();
      status = _STATUS.success;
      setState(() {});
    } catch (e) {
      status = _STATUS.error;
      setState(() {});
    }
  }
}
