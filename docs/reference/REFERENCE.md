# BPAEngine API Reference

This is the API Reference for **Better Plymouth Animations Engine (BPAEngine)**. See the [README](https://github.com/BPAEngine/BPAEngine/blob/master/README.md) for more info.

Follow the links below to see each component of the BPAEngine:

+ [Namespace and Globals](#namespace-and-globals)
  * [Constants](#constants)
  * [Callbacks](#callbacks)

+ [Helpers](#helpers)
  * [Array](#array)
  * [Color](#color)
  * [Debug](#debug)
  * [String](#string)
  * [Window](#window)

+ [Basic](#basic)
  * [Object](#object)
  * [SpriteAnimation](#sprite_animation)
  * [Variator](#variator)
  * [World](#world)

+ [Actions](#actions)
  * [Action](#action)
  * [AnimationAction](#animation_action)
  * [MoveAction](#move_action)
  * [SpawnAction](#spawn_action)

+ [Objects](#objects)
  * [Background](#background)
  * [Box](#box)
  * [BulletedPassword](#bulleted_password)
  * [Dialog](#box)
  * [Dimmer](#box)
  * [MessageScroll](#box)
  * [PasswordDialog](#box)
  * [ProgressBar](#box)
  * [Spawner](#box)
  * [StaticImage](#box)
  * [Text](#box)

********

## Namespace and Globals

Every part of the engine is inside the namespace `BPAE`, there are some global stuff outside the engine like [boolean constants](#constants) and [helpers](#helpers).

### Constants

Plymouth doesn't provide a boolean type, so we define `TRUE` and `FALSE` values as constants (1 and 0 respectively).

Also some constants related to Z levels are defined:

```js
BPAE.TOP_Z = 10000;
BPAE.DIALOG_Z = 1000;
BPAE.BACKGROUND_Z = -10000;
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/00_Header/Z_Constants.script)

### Callbacks

Callbacks for Plymouth hooks are globaly defined, each calls the global defined `WORLD` with the proper method:

```js
Plymouth.SetBootProgressFunction() // Calls global.WORLD.Update(time, progress);
Plymouth.SetRefreshFunction() // Calls global.WORLD.Tick();
Plymouth.SetUpdateStatusFunction() // Calls global.WORLD.UpdateStatus(status);
Plymouth.SetMessageFunction() // Calls global.WORLD.ProcessMessage(message);
Plymouth.SetDisplayQuestionFunction() // Calls global.WORLD.DisplayQuestion(prompt, entry);
Plymouth.SetDisplayPasswordFunction() // Calls global.WORLD.AskPassword(prompt, bullets_size);
Plymouth.SetDisplayNormalFunction() // Calls global.WORLD.DisplayNormal();
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/05_Callbacks/Callbacks.script)

## Helpers

Helpers are just global classes with util methods in it.

[[View Source]](https://github.com/BPAEngine/BPAEngine/tree/master/lib/BPAEngine/01_Helpers)

### Array

Plymouth lacks of an Array class, it only defines a Hash type that can have sequential integer indexes. To manage hashes as arrays we define some basic methods.

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script)

---

#### Array.Size

Calculates the length of an array based on sequential integer indexes.

###### Signature

```js
Array.Size(array) => integer
```

###### Examples

A very basic example with sequential indexes implicitly created:
```js
my_array = [3, 2, 6];
Array.Size(my_array); // It returns 3
```
When the indexes are not sequentially added the method will return the longest sequence:
```js
my_array[0] = "a";
my_array[1] = "b";
my_array[8] = "c";
Array.Size(my_array); // It returns 2
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L6-L14)

---

##### Array.Add

Add the element given at the end of the array. Returns the changed array.

###### Signature

```js
Array.Add(array, element) => Array
```

###### Examples

A very basic example with sequential indexes implicitly created:
```js
my_array = [3, 2, 6];
Array.Add(my_array, 5); // It returns [3, 2, 6, 5]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L16-L20)

---

##### Array.Pop

Removes the element in the first position of the given array. Returns the element removed.

###### Signature

```js
Array.Pop(array) => element
```

###### Examples

A very basic example with sequential indexes implicitly created:
```js
my_array = [3, 2, 6];
Array.Pop(my_array); // It returns 3 and my_array = [2, 6]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L22-L32)

---

##### Array.Push

Add the element given at the first position of the array. Returns the changed array.

###### Signature

```js
Array.Push(array, element) => Array
```

###### Examples

A very basic example with sequential indexes implicitly created:
```js
my_array = [3, 2, 6];
Array.Push(my_array, 5); // It returns [5, 3, 2, 6]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L34-L43)

---

##### Array.Join

Creates a string using the elements joined by `joint`.

###### Signature

```js
Array.Push(array, joint) => String
```

###### Examples

A very basic example with sequential indexes implicitly created:
```js
my_array = ["Hi", "my", "friend"];
Array.Push(my_array, ", "); // It returns "Hi, my, friend"
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L45-L53)

---

##### Array.Clear

Clears the passed array leaving it empty. Returns the empty array.

###### Signature

```js
Array.Clear(array) => Array
```

###### Examples

A very basic example with sequential indexes implicitly created:
```js
my_array = [4, 6, 7];
Array.Clear(my_array); // It returns []
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L55-L63)

---

### Color

This class holds all related methods for managing colors in BPAEngine.

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Color.script)

---

##### Color.FromRGB

Creates the color from the given RGB color components. Returns the color array.

###### Signature

```js
Color.FromRGB(red, green, blue) => Array
```

###### Examples

Some basic colors:
```js
Color.FromRGB(255, 0, 0);     // RED: It returns [1, 0, 0]
Color.FromRGB(0, 255, 0);     // GREEN: It returns [0, 1, 0]
Color.FromRGB(0, 0, 255);     // BLUE: It returns [0, 0, 1]
Color.FromRGB(0, 0, 0);       // BLACK: It returns [0, 0, 0]
Color.FromRGB(255, 255, 255); // WHITE: It returns [1, 1, 1]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L55-L63)

---

##### Color.FromHex

Creates the color from the given hexadecimal string. Returns the color array.

###### Signature

```js
Color.FromHex(hex) => Array
```

###### Examples

Some basic colors:
```js
Color.FromRGB("#FF0000"); // RED: It returns [1, 0, 0]
Color.FromRGB("#00FF00"); // GREEN: It returns [0, 1, 0]
Color.FromRGB("#0000FF"); // BLUE: It returns [0, 0, 1]
Color.FromRGB("#000000"); // BLACK: It returns [0, 0, 0]
Color.FromRGB("#FFFFFF"); // WHITE: It returns [1, 1, 1]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L55-L63)

---

##### Color.Palette

It holds every color in hexadecimal format indexed by tags. Those colors and tags are defined at https://www.w3schools.com/colors/colors_hex.asp

###### Signature

```js
Color.Palette => Hash
Color.Palette[tag] => String
```

###### Examples

Some basic colors:
```js
Color.Palette["Black"] = "#000000";
Color.Palette["Navy"] = "#000080";
Color.Palette["DarkBlue"] = "#00008B";
Color.Palette["MediumBlue"] = "#0000CD";
Color.Palette["Blue"] = "#0000FF";
Color.Palette["DarkGreen"] = "#006400";
Color.Palette["Green"] = "#008000";
Color.Palette["Teal"] = "#008080";
```


[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L55-L63)

---

##### Color.FromPalette

Creates the color from the given hexadecimal string at the [Palette](#colorpalette). Returns the color array.

###### Signature

```js
Color.FromPalette(color) => Array
```

###### Examples

Some basic colors:
```js
Color.FromPalette("Red");   // It returns [1, 0, 0]
Color.FromPalette("Lime");  // It returns [0, 1, 0]
Color.FromPalette("Blue");  // It returns [0, 0, 1]
Color.FromPalette("Black"); // It returns [0, 0, 0]
Color.FromPalette("White"); // It returns [1, 1, 1]
```

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L55-L63)

---

### Debug

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Debug.script)


### String

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/String.script)


### Window

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Window.script)
