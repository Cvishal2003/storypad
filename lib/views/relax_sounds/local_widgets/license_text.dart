part of '../relax_sounds_view.dart';

class _LicenseText extends StatelessWidget {
  const _LicenseText();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 16.0,
        left: MediaQuery.of(context).padding.left + 16.0,
        right: MediaQuery.of(context).padding.right + 16.0,
      ),
      child: buildText(context),
    );
  }

  Widget buildText(BuildContext context) {
    Color foregroundColor = ColorScheme.of(context).onSurface;
    return SpTapEffect(
      effects: [SpTapEffectType.touchableOpacity],
      onTap: () => showLicenseDialog(context),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            WidgetSpan(
              child: Container(
                margin: EdgeInsets.only(right: MediaQuery.textScalerOf(context).scale(4.0)),
                child: Icon(
                  SpIcons.license,
                  size: MediaQuery.textScalerOf(context).scale(16.0),
                  color: foregroundColor,
                ),
              ),
            ),
            TextSpan(
              text: tr("list_tile.licenses.title"),
              style: TextTheme.of(context).titleMedium?.copyWith(
                color: foregroundColor,
                decorationColor: foregroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showLicenseDialog(BuildContext context) {
    return showAdaptiveDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog.adaptive(
          content: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SelectableText(
              tr(
                "sounds.credits",
                context: context,
                namedArgs: {
                  'ALBUM_BACKGROUND_LINK': "freepik.com",
                  'ORIGINAL_SOUND_LINK': "freesound.org",
                  'APP_NAME': kAppName,
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
