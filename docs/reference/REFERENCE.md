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

Calculates the length of an array (based on sequential integer indexes).

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

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L16-L20)

---

##### Array.Pop

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L22-L32)

---

##### Array.Push

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L34-L43)

---

##### Array.Join

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L45-L53)

---

##### Array.Empty

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Array.script#L55-L63)

---

### Color

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Color.script)


### Debug

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Debug.script)


### String

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/String.script)


### Window

[[View Source]](https://github.com/BPAEngine/BPAEngine/blob/master/lib/BPAEngine/01_Helpers/Window.script)
