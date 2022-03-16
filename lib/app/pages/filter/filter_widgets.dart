import 'package:auto_size_text/auto_size_text.dart';
import 'package:busca_peca/app/pages/filter/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

var textStyle = const TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

FilterController controller = Get.find();

class FilterCar extends StatelessWidget {
  const FilterCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text('Carro', style: textStyle),
        ),
        Expanded(
            flex: 4,
            child: TypeAheadFormField<String>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: controller.car.value,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: const OutlineInputBorder(),
                ),
              ),
              suggestionsCallback: (pattern) {
                return controller.getSuggestionsCars(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (suggestion) {
                controller.car.value.text = suggestion;
              },
            ))
      ],
    );
  }
}

class FilterYerDrowDown extends StatelessWidget {
  const FilterYerDrowDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> ages = ['Todos'];
    for (int i = 1961; i < 2023; i++) {
      ages.add(i.toString());
    }
    ;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Ano', style: textStyle),
        Obx(() => DropdownButton<String>(
              style: textStyle,
              value: controller.year.value,
              items: ages.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {
                controller.year.value = _!;
              },
            )),
      ],
    );
  }
}

class FilterMotor extends StatelessWidget {
  const FilterMotor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mask = MaskTextInputFormatter(mask: '#.#');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text('Motor', style: textStyle),
        ),
        Expanded(
          flex: 1,
          child: TextField(
            controller: controller.motor.value,
            inputFormatters: [mask],
            keyboardType: TextInputType.number,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            decoration: InputDecoration(
              hintText: '0.0',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: const OutlineInputBorder(),
            ),
          ),
        )
      ],
    );
  }
}

class CheckBoxACD extends StatelessWidget {
  const CheckBoxACD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: AutoSizeText(
            'Ar Condicionado',
            style: textStyle,
          ),
        ),
        Expanded(
          flex: 1,
          child: Obx(() => Checkbox(
              value: controller.acd.value,
              onChanged: (value) {
                controller.acd.value = value ?? controller.acd.value;
              })),
        )
      ],
    );
  }
}

class CheckBoxDH extends StatelessWidget {
  const CheckBoxDH({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: AutoSizeText(
            'Direção Hidráulica',
            style: textStyle,
          ),
        ),
        Expanded(
          flex: 1,
          child: Obx(() => Checkbox(
              value: controller.dh.value,
              onChanged: (value) {
                controller.dh.value = value ?? controller.dh.value;
              })),
        )
      ],
    );
  }
}

class CheckBoxGNV extends StatelessWidget {
  const CheckBoxGNV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: AutoSizeText(
            'GNV',
            style: textStyle,
          ),
        ),
        Expanded(
          flex: 1,
          child: Obx(() => Checkbox(
              value: controller.gnv.value,
              onChanged: (value) {
                controller.gnv.value = value ?? controller.gnv.value;
              })),
        )
      ],
    );
  }
}

class CheckBoxABS extends StatelessWidget {
  const CheckBoxABS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: AutoSizeText(
            'Freios ABS',
            style: textStyle,
          ),
        ),
        Expanded(
          flex: 1,
          child: Obx(() => Checkbox(
              value: controller.abs.value,
              onChanged: (value) {
                controller.abs.value = value ?? controller.abs.value;
              })),
        )
      ],
    );
  }
}

class CheckBoxTA extends StatelessWidget {
  const CheckBoxTA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: AutoSizeText(
            'Transmissão Automática',
            maxLines: 1,
            style: textStyle,
          ),
        ),
        Expanded(
          flex: 1,
          child: Obx(() => Checkbox(
              value: controller.ta.value,
              onChanged: (value) {
                controller.ta.value = value ?? controller.ta.value;
              })),
        )
      ],
    );
  }
}
