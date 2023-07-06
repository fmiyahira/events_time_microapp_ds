import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DSColors.neutral.s100,
      appBar: DSNavBar(
        leading: DSIconButton(
          icon: Icons.arrow_back_ios,
          onPressed: () {},
          theme: DSIconButtonTheme(iconPadding: 0, buttonSize: 0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DSButton(
              size: DSButtonSize.SMALL,
              text: 'HELLO WORLD',
              onPressed: () {},
              buttonStyle: DSButtonStyle.LINK,
            ),
            DSButton(
              size: DSButtonSize.MICRO,
              text: 'HELLO WORLD',
              onPressed: () {},
              buttonStyle: DSButtonStyle.LINK,
            ),
            const SizedBox(height: 16),
            DSButton(
              size: DSButtonSize.SMALL,
              text: 'HELLO WORLD',
              onPressed: () {},
              buttonStyle: DSButtonStyle.MILKED,
            ),
            const SizedBox(height: 16),
            DSButton(
              size: DSButtonSize.SMALL,
              text: 'HELLO WORLD',
              onPressed: () {},
              buttonStyle: DSButtonStyle.OUTLINED,
            ),
            const SizedBox(height: 16),
            DSButton(
              size: DSButtonSize.SMALL,
              text: 'HELLO WORLD',
              onPressed: () {},
              buttonStyle: DSButtonStyle.SECONDARY,
            ),
            const SizedBox(height: 16),
            DSButton(
              size: DSButtonSize.SMALL,
              text: 'HELLO WORLD',
              onPressed: () {},
              buttonStyle: DSButtonStyle.PRIMARY,
            ),
            const SizedBox(height: 16),
            DSButton(
              size: DSButtonSize.SMALL,
              text: 'HELLO WORLD',
              onPressed: () {},
              buttonStyle: DSButtonStyle.SECONDARY,
            ),
            DSButton(
              size: DSButtonSize.SMALL,
              text: 'HELLO WORLD',
              onPressed: () {},
              buttonStyle: DSButtonStyle.SECONDARY_MILKED,
            ),
            dividerWithPadding(),
            DSAccordion(
              title: 'Accordion',
              caption: 'Test with caption',
              child: DSText(
                'Test Accordion',
                type: DSTextType.BODY,
              ),
            ),
            DSAccordion(
              title: 'Accordion',
              child: DSText(
                'Test Accordion',
                type: DSTextType.BODY,
              ),
            ),
            const SizedBox(height: kComponentSpacerXL),
            const SizedBox(height: kComponentSpacerXL),
            dividerWithPadding(),
            const SizedBox(height: kComponentSpacerXL),
            DSDivider(size: DSDividerSize.LARGE),
            const SizedBox(height: kComponentSpacerXL),
            DSDivider(size: DSDividerSize.EXTRA_LARGE),
            const SizedBox(height: kComponentSpacerXL),
            DSText('Just a text with type: BODY', type: DSTextType.BODY),
            DSText('Just a text with type: BODY_CAPTION',
                type: DSTextType.BODY_CAPTION),
            DSText('Just a text with type: BODY_SMALL',
                type: DSTextType.BODY_SMALL),
            DSText('Just a text with type: BODY_SMALLER',
                type: DSTextType.BODY_SMALLER),
            DSText('Just a text with type: HEADING1',
                type: DSTextType.HEADING1),
            DSText('Just a text with type: HEADING2',
                type: DSTextType.HEADING2),
            DSText('Just a text with type: HEADING3',
                type: DSTextType.HEADING3),
            DSText('Just a text with type: HEADING4',
                type: DSTextType.HEADING4),
            DSText('Just a text with type: HERO', type: DSTextType.HERO),
            DSText('Just a text with type: INPUT', type: DSTextType.INPUT),
            DSText('Just a text with type: LABEL', type: DSTextType.LABEL),
            DSText('Just a text with type: LABEL_SMALL',
                type: DSTextType.LABEL_SMALL),
            DSText('Just a text with type: NUMBER', type: DSTextType.NUMBER),
            DSText('Just a text with type: NUMBER_SMALL',
                type: DSTextType.NUMBER_SMALL),
            dividerWithPadding(),
            DSText(
              'Just a text with style: ERROR',
              type: DSTextType.HEADING1,
              style: DSTextStyle.ERROR,
            ),
            DSText(
              'Just a text with style: INFO',
              type: DSTextType.HEADING1,
              style: DSTextStyle.INFO,
            ),
            DSText(
              'Just a text with style: SUCCESS',
              type: DSTextType.HEADING1,
              style: DSTextStyle.SUCCESS,
            ),
            DSText(
              'Just a text with style: MILKED',
              type: DSTextType.HEADING1,
              style: DSTextStyle.MILKED,
            ),
            DSText(
              'Just a text with style: WARNING',
              type: DSTextType.HEADING1,
              style: DSTextStyle.WARNING,
            ),
            dividerWithPadding(),
            DSIconButton(icon: Icons.abc, onPressed: () {}),
            DSIconButton(icon: Icons.refresh, onPressed: () {}),
            dividerWithPadding(),
            DSFeedbackMessage(
              title: 'Feedback message title',
              message: 'With message',
              label: 'With label',
              size: DSFeedbackMessageSize.LARGE,
              icon: Icons.refresh,
            ),
            dividerWithPadding(),
            DSFeedbackMessage(
              title: 'Feedback message title',
              message: 'With message',
              size: DSFeedbackMessageSize.SMALL,
              buttonSmallText: 'Button text',
              buttonSmallAction: () {},
              icon: Icons.refresh,
            ),
            dividerWithPadding(),
            DSLinkButton(
              text: 'Bottom sheet',
              onPressed: () {
                DSBottomSheet(
                  // size: DSBottomSheetSize.LARGE,
                  screenContext: context,
                  title: 'Just a title',
                  type: DSBottomSheetType.LEAN,
                  child: const Text('Testing bottomsheet'),
                ).show();
              },
            ),
            DSLinkButton(
              text: 'Dialog error',
              onPressed: () {
                DSDialog(
                  buttonText: 'Dialog button',
                  message: 'Dialog message',
                  title: 'Dialog title',
                  parentContext: context,
                  buttonOnPressed: () {
                    Navigator.of(context).pop();
                  },
                  label: 'Dialog label',
                  type: DSDialogType.ERROR,
                ).show();
              },
            ),
            DSLinkButton(
              text: 'Dialog warning',
              onPressed: () {
                DSDialog(
                  buttonText: 'Dialog button',
                  message: 'Dialog message',
                  title: 'Dialog title',
                  parentContext: context,
                  buttonOnPressed: () {
                    Navigator.of(context).pop();
                  },
                  label: 'Dialog label',
                  type: DSDialogType.WARNING,
                ).show();
              },
            ),
            DSLinkButton(
              text: 'Dialog success',
              onPressed: () {
                DSDialog(
                  buttonText: 'Dialog button',
                  message: 'Dialog message',
                  title: 'Dialog title',
                  parentContext: context,
                  buttonOnPressed: () {
                    Navigator.of(context).pop();
                  },
                  label: 'Dialog label',
                  type: DSDialogType.SUCCESS,
                ).show();
              },
            ),
            DSLinkButton(
              text: 'Dialog info',
              onPressed: () {
                DSDialog(
                  buttonText: 'Dialog button',
                  message: 'Dialog message',
                  title: 'Dialog title',
                  parentContext: context,
                  buttonOnPressed: () {
                    Navigator.of(context).pop();
                  },
                  label: 'Dialog label',
                  type: DSDialogType.INFO,
                ).show();
              },
            ),
            DSLinkButton(
              text: 'Dialog time',
              onPressed: () {
                DSDialog(
                  buttonText: 'Dialog button',
                  message: 'Dialog message',
                  title: 'Dialog title',
                  parentContext: context,
                  buttonOnPressed: () {
                    Navigator.of(context).pop();
                  },
                  label: 'Dialog label',
                  type: DSDialogType.TIME,
                ).show();
              },
            ),
            DSLinkButton(
              text: 'Confirm dialog',
              onPressed: () {
                DSConfirmDialog(
                  message: 'Dialog message',
                  title: 'Dialog title',
                  parentContext: context,
                  label: 'Dialog label',
                  type: DSDialogType.SUCCESS,
                  primaryButtonText: 'Primary button',
                  primaryOnPressed: () {},
                  secondaryButtonText: 'Secondary button',
                  secondaryOnPressed: () {},
                ).show();
              },
            ),
            dividerWithPadding(),
            DSFeedbackMessageActionDialog(
              firstButtonAction: () {},
              firstButtonText: 'First Action Button',
              message: 'Feedback Action Dialog Message',
              title: 'Feedback Action Dialog Title',
              secondButtonAction: () {},
              secondButtonText: 'Second Action Button',
              type: DSFeedbackMessageActionDialogType.DOUBLE,
            ),
            dividerWithPadding(),
            DSFeedbackMessageActionDialog(
              firstButtonAction: () {},
              firstButtonText: 'Action Dialog Button',
              message: 'Feedback Message Action Message',
              title: 'Feedback Message Action Title',
              label: 'Feedback Message Action Label',
              icon: Icons.refresh,
            ),
            dividerWithPadding(),
            DSJumboIcon(Icons.refresh),
            dividerWithPadding(),
            DSCheckbox(
              label: 'Checkbox label',
              caption: 'Checkbox caption',
              onChange: (bool value) {},
            ),
            dividerWithPadding(),
            DSRadioButton(
              buttons: <RadioButtonContent>[
                RadioButtonContent('Azul', caption: 'azul'),
                RadioButtonContent('Vermelho', caption: 'vermelho'),
                RadioButtonContent('Verde', caption: 'verde'),
              ],
              onChanged: (int value) {
                debugPrint(value.toString());
              },
            ),
            dividerWithPadding(),
            DSSelect(
              labelText: 'Select country',
              screenContext: context,
              suffixIcon: const Icon(Icons.flag),
              children: const <Map<DSSelectKeys, dynamic>>[
                <DSSelectKeys, dynamic>{
                  DSSelectKeys.TITLE: 'Brasil',
                  DSSelectKeys.VALUE: 'BR',
                },
                <DSSelectKeys, dynamic>{
                  DSSelectKeys.TITLE: 'Japão',
                  DSSelectKeys.VALUE: 'JP',
                },
              ],
              onSelected: (Map<DSSelectKeys, dynamic> value) {
                print(value);
                Navigator.of(context).pop();
              },
            ),
            dividerWithPadding(),
            const DSTextField(
              labelText: 'Name',
              prefixIcon: Icon(Icons.abc),
              suffixIcon: Icon(Icons.close),
              helperText: 'Heeeeelp',
            ),
            const SizedBox(height: kComponentSpacerM),
            const DSTextField(
              labelText: 'Name',
              prefixIcon: Icon(Icons.abc),
              suffixIcon: Icon(Icons.close),
              helperText: 'Heeeeelp',
              errorText: 'Error',
            ),
            const SizedBox(height: kComponentSpacerM),
            const DSTextField(
              labelText: 'Name',
              prefixIcon: Icon(Icons.abc),
              suffixIcon: Icon(Icons.close),
              initialValue: 'Miyahira',
            ),
            dividerWithPadding(),
            DSIterator(
              scrollEnabled: false,
              size: DSIteratorSize.MINIMAL,
              children: <Widget>[
                DSNavListItemElement(
                  title: 'Brasil',
                  caption: 'Brasília',
                ),
                DSNavListItemElement(
                  title: 'Japão',
                  category: 'Ásia',
                ),
                DSNavListItemElement(
                  title: 'Estados Unidos',
                  category: 'NA',
                ),
                DSNavListItemElement(
                  title: 'Canadá',
                  selected: true,
                ),
                DSNavListItemElement(
                  title: 'China',
                ),
              ],
            ),
            dividerWithPadding(),
            DSIterator(
              scrollEnabled: false,
              size: DSIteratorSize.MINIMAL,
              children: <Widget>[
                DSNavListItemBase(
                  title: 'Brasil',
                  size: DSNavListItemBaseSize.LARGE,
                ),
                DSNavListItemBase(
                  title: 'Japão',
                  size: DSNavListItemBaseSize.LARGE,
                ),
                DSNavListItemBase(
                  title: 'Estados Unidos',
                ),
                DSNavListItemBase(
                  title: 'Canadá',
                ),
                DSNavListItemBase(
                  title: 'China',
                ),
              ],
            ),
            DSIterator(
              scrollEnabled: false,
              size: DSIteratorSize.MINIMAL,
              children: <Widget>[
                DSNavListItemIcon(
                  title: 'Brasil',
                  caption: 'Brasília',
                  leading: Icons.flag,
                ),
                DSNavListItemIcon(
                  title: 'Japão',
                  leading: Icons.flag,
                ),
              ],
            ),
            dividerWithPadding(),
            DSIterator(
              scrollEnabled: false,
              size: DSIteratorSize.MINIMAL,
              children: <Widget>[
                DSNavListItemChevron(
                  title: 'Brasil',
                  caption: 'Brasília',
                  leading: Icons.flag,
                ),
                DSNavListItemChevron(
                  title: 'Japão',
                  leading: Icons.flag,
                ),
              ],
            ),
            dividerWithPadding(),
            DSSwitcher(text: 'Its ok?'),
            dividerWithPadding(),
            DSLinkButton(
              text: 'Toast',
              onPressed: () {
                DSToast.show('Showing toast', context);
              },
            ),
            dividerWithPadding(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DSCircleButton(
                  icon: Icons.abc,
                  onPressed: () {},
                ),
                DSCircleButton(
                  icon: Icons.refresh,
                  onPressed: () {},
                ),
                DSCircleButton(
                  icon: Icons.check_circle,
                  onPressed: () {},
                ),
              ],
            ),
            dividerWithPadding(),
            const SizedBox(height: kComponentSpacerXXXXL),
          ],
        ),
      ),
      bottomNavigationBar: DSButtonBar.withTwoButtons(
        primaryButtonText: 'Login',
        primaryOnPressed: () {},
        secondaryButtonText: 'Cancel',
        secondaryOnPressed: () {},
      ),
    );
  }

  Widget dividerWithPadding() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: DSDivider(),
    );
  }
}
