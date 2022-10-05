import '../database/moor_database.dart';
import '../models/Medicine.dart';
import 'package:flutter/material.dart';
import 'MedicineCard.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:medicinereminder/animations/fade_animation.dart';

class MedicineGridView extends StatelessWidget {
  final List<MedicinesTableData> list;
  MedicineGridView(this.list);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MedicineModel>(
        builder: (context, child, model) {
      return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        children: list.map((medicine) {
          return InkWell(
            onTap: () {
              // details screen
            },
            child: buildLongPressDraggable(medicine, model),
          );
        }).toList(),
      );
    });
  }

  LongPressDraggable<MedicinesTableData> buildLongPressDraggable(
      medicine, MedicineModel model) {
    return LongPressDraggable<MedicinesTableData>(
      data: medicine,
      onDragStarted: () {
        // show the delete icon
        model.toggleIconState();
      },
      onDragEnd: (v) {
        // hide the delete icon
        model.toggleIconState();
      },
      child: FadeAnimation(
        .05,
        Card(
          margin: EdgeInsets.all(10),
          child: MecicineCard(medicine, Colors.white),
        ),
      ),
      childWhenDragging: Container(
        color: Color(0xff3EB16E).withOpacity(.3),
      ),
      feedback: Card(
        child: MecicineCard(medicine, Colors.transparent),
      ),
    );
  }
}
