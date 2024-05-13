# CustomToggleView

### Requirements
* iOS 14.0+
* Xcode 13.0+
* Swift Swift 5.5

### Content
* [기본적인 형태](#intro_usage_example)
* [Documentation](#documentation)
  * [Custom](#Custom)
  

<a name="intro_usage_example"></a>
## 기본적인 형태

```swift
NewToggle(isOn: $state) {
    Text(state ? "ON" : "OFF")
}
```

![스크린샷 2024-05-10 오후 5 14 55](https://github.com/sanggab/CustomToggleView/assets/82999377/a4d2cc47-fe3c-42dc-be52-ed6d4ce426a2)

<a name="documentation"></a>
## Documentation

CustomToggleView는 기본적인 ToggleView하고 동작은 같지만 자유도가 더 높습니다. Text와 Switch의 간격, Switch의 Size, Color, Background, Knob의 Size, Color, Overlay등 자유롭게 구현 가능합니다.

<a name="Custom"></a>
## 1. Custom

### custom(model:ToggleModel)
Text와 Switch 사이의 Spacing, Switch의 Size, Switch의 CornerRadius, Switch의 isOn State에 따른 background Color를 정할 수 있는 Model를 적용시키는 Modifier.

### ToggleModel
| Value | Description | Default Value |
|---------------------|:------------------:|---------|
| **spacing** | Text와 Switch의 간격 | 10 |
| **size** | Switch의 Size | CGSize(width: 36, Height: 20) |
| **radius** | Switch의 CornerRadius | 20 |
| **isOnColor** | isOn이 True일때, Switch의 Color | yellow |
| **isOffColor** | isOn이 False일때, Switch의 Color | gray |

ToggleModel은 기본적인 default value들을 가지고 있는데 만약 기본 style로 사용할 경우 custom Modifier을 적용안시켜도 된다.

##### Usage examples:

```swift
NewToggle(isOn: $state) {
    Text(state ? "ON" : "OFF")
}
.custom(ToggleModel(spacing: 20))
```
