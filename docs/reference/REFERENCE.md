# BPAEngine API Reference

This is the API Reference for **Better Plymouth Animations Engine (BPAEngine)**. See the [README](https://github.com/BPAEngine/BPAEngine/blob/master/README.md) for more info.

Follow the links below to see each component of the BPAEngine:

##### [Namespace and Globals](#namespace)
* [Constants](#constants)
* [Callbacks](#callbacks)

##### [Helpers](#helpers)
* [Array](#array)
* [Color](#color)
* [Debug](#debug)
* [String](#string)
* [Window](#window)

##### [Basic](#basic)
* [Object](#object)
* [SpriteAnimation](#sprite_animation)
* [Variator](#variator)
* [World](#world)

##### [Actions](#actions)
* [Action](#action)
* [AnimationAction](#animation_action)
* [MoveAction](#move_action)
* [SpawnAction](#spawn_action)

##### [Objects](#objects)
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

## <a name="namespace"></a>Namespace and Globals

Every part of the engine is inside the namespace `BPAE`, there are some global stuff outside the engine like some [constants](#constants) and [helpers](#helpers).

### <a name="constants"></a>Constants

Plymouth doesn't provide a boolean type, so we define `TRUE` and `FALSE` values as constants (1 and 0 respectively).

Also some constants related to Z levels are defined:

```javascript
BPAE.TOP_Z = 10000;
BPAE.DIALOG_Z = 1000;
BPAE.BACKGROUND_Z = -10000;
```

### <a name="callbacks"></a>Callbacks

Callbacks for Plymouth hooks are globaly defined, each calls the global defined `WORLD` with the proper method:

```javascript
Plymouth.SetBootProgressFunction() // Calls global.WORLD.Update(time, progress);
Plymouth.SetRefreshFunction() // Calls global.WORLD.Tick();
Plymouth.SetUpdateStatusFunction() // Calls global.WORLD.UpdateStatus(status);
Plymouth.SetMessageFunction() // Calls global.WORLD.ProcessMessage(message);
Plymouth.SetDisplayQuestionFunction() // Calls global.WORLD.DisplayQuestion(prompt, entry);
Plymouth.SetDisplayPasswordFunction() // Calls global.WORLD.AskPassword(prompt, bullets_size);
Plymouth.SetDisplayNormalFunction() // Calls global.WORLD.DisplayNormal();
```
