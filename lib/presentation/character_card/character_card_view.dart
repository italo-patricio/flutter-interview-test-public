import 'package:flutter/material.dart';
import 'package:flutter_interview_test/core/resources/colors.dart';
import 'package:flutter_interview_test/core/resources/styles.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/presentation/base/section_widget.dart';
import 'package:flutter_interview_test/presentation/base/status_widget.dart';
import 'package:flutter_interview_test/presentation/character_details/character_details_view.dart';

class CharacterCardView extends StatelessWidget {
  final double _height = 150.0;
  final Character character;

  const CharacterCardView({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CharacterDetailsView(character),
          ),
        ),
        child: Container(
          height: _height,
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: AppColors.elavatedItemColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (character.imageUrl != null) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      character.imageUrl!,
                      fit: BoxFit.cover,
                      width: _height,
                      height: _height,
                    ),
                  ),
                  SizedBox(width: 16),
                ],
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(character.name ?? '', style: Styles.title),
                      StatusWidget(status: character.status),
                      SectionWidget(
                        hint: 'Species:',
                        label: character.species ?? '',
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ),
      );
}
