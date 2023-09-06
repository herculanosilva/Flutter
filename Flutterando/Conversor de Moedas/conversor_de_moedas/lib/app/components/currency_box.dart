import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  const CurrencyBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 56,
                    child: DropdownButton(
                      isExpanded: true,
                      underline: Container(
                        height: 1,
                        color: Colors.amber,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text('Real', overflow: TextOverflow.ellipsis,),
                        ),
                        DropdownMenuItem(
                          child: Text('Dolar'),
                          ),
                      ], 
                      onChanged: (value) {}
                      ),
                  )),
                SizedBox(width: 10),
                const Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber),),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.amber),)
                    ),
                  ),
                ),
              ],
            );
  }
}