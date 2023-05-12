<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/ShawnAlisson/auto_rtl">
    <img src="assets/auto_rtl.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">auto_rtl</h3>

  <p align="center">
    Simple package to change the direction of TextField, Text,... to RTL/LTR based on the text, and set default direction for them.</a>!
  </p>
</div>

### Built With

- Flutter
- Dart

<!-- GETTING STARTED -->

## Getting Started

1. Add auto_rtl to pubspec.yaml of your project

   ```sh
    [auto_rtl]:
      git:
        url: https://github.com/ShawnAlisson/auto_rtl
   ```

2. Wrap your widget with this

```dart
...
String yourText = "";
...
AutoRTL(
  content: yourText,
  defaultRTL: true
  #For default LTR it should be false, or it can based on the language.
  #For example, defaultRTL: Localizations.localeOf(context).toString() == "fa" ? true : false

  child: TextField(
    onChanged: (value){
      setState(() {
        yourText = value;
      });
    },
  ),
)
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>
