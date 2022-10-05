import 'package:flutter/material.dart';
import '../database/moor_database.dart';

class MecicineCard extends StatelessWidget {
  final MedicinesTableData medicine;
  final Color color;

  MecicineCard(this.medicine, this.color);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: 180,
      height: 180,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            width: 50,
            height: 50,
            child: Hero(
              tag: medicine.name,
              child: Image.asset(
                medicine.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  medicine.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: width * .06),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                medicine.dose.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: width * .034,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
