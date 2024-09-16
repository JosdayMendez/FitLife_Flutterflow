import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'deletecalorie_model.dart';
export 'deletecalorie_model.dart';

class DeletecalorieWidget extends StatefulWidget {
  const DeletecalorieWidget({super.key});

  @override
  State<DeletecalorieWidget> createState() => _DeletecalorieWidgetState();
}

class _DeletecalorieWidgetState extends State<DeletecalorieWidget> {
  late DeletecalorieModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeletecalorieModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
