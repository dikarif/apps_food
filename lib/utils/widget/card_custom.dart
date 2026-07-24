import 'package:flutter/material.dart';

class CardCustomForm extends StatelessWidget {
  final Widget? widgetCardForm;
  final Color? colorBg;
  final double? tinggiCard;
  final BorderRadius? radiusBorder;

  const CardCustomForm({
    Key? key,
    this.widgetCardForm,
    this.colorBg,
    this.tinggiCard,
    this.radiusBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tinggiCard,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: colorBg,
        borderRadius: radiusBorder,
        border: Border.all(width: 1, color: Color(0xFF5A6376)),
      ),
      child: widgetCardForm,
    );
  }
}

class CardCustomShadow extends StatelessWidget {
  final Widget? widgetCardCustom;
  final Color? colorBg;
  final BorderRadius? radiusBorder;

  const CardCustomShadow({
    Key? key,
    this.widgetCardCustom,
    this.colorBg,
    this.radiusBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: colorBg,
        borderRadius: radiusBorder,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 190, 190, 190).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: widgetCardCustom,
    );
  }
}

class CardCustom extends StatelessWidget {
  final Widget? widgetCardCustom;
  final Color? colorBg;
  final BorderRadius? radiusBorder;
  final borderColor;
  final width;

  const CardCustom({
    Key? key,
    this.widgetCardCustom,
    this.colorBg,
    this.radiusBorder,
    this.width,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: colorBg,
        borderRadius: radiusBorder,
        border: Border.all(
          width: width ?? 1.0,
          color: borderColor ?? Color.fromARGB(255, 211, 205, 205),
        ),
      ),
      child: widgetCardCustom,
    );
  }
}

class CardCustom2 extends StatelessWidget {
  final Widget? widgetCardCustom;
  final Color? colorBg;
  final Color? colorBorder;
  final BorderRadius? radiusBorder;
  final size;

  const CardCustom2({
    Key? key,
    this.widgetCardCustom,
    this.colorBg,
    this.colorBorder,
    this.radiusBorder,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: colorBg,
        borderRadius: radiusBorder,
        border: Border.all(width: 0.5, color: colorBorder!),
      ),
      child: widgetCardCustom,
    );
  }
}
