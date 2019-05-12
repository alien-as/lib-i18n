i18n
===

![](https://img.shields.io/badge/astro-0.1.0-green.svg)

Basic internationalization library in ActionScript.

# Usage

Construct a box:

```as
import i18n.*
const box = new I18nBox
```

Within `box` you can access language groups:

```as
const en = box.group('en-us')

// Basic stuff

en.map({
    'tm-action': 'Ação'
})

trace(en.get('tm-action'))
```

## Array mapping

The last example assigned strings dinamically, certainly inefficient. Arrays are supported. Let's define an enum:

```as
final class AppString {
    static private var i: uint
    static public const FILE         : uint = i++
                    ,   EDIT         : uint = i++
                    ,   SAVE_AS      : uint = i++;
}
```

Now let's add English for that:

```
// Some arbitrary id
const appStringsId: uint = 0x30

en.arraySet(appStringsId, new <String> [
    'File',
    'Edit',
    'Save as',
])

// Trace 'File'
trace(en.arrayGet(appStringsId, AppString.FILE))
```

## Late fetch

Wish to load strings only when needed? If so, you might use the condition:

```as
const loaded = group.arrayHas(enumId)
```

Desire to flush a group? Write `group.clear()`.

## Facilities

i18n is all about mapping, though extra functionality is found.

- You can add fallback languages by calling `group.fallback(g)`.

To-add:

- Date formatting
- Singulars/plurals formatting