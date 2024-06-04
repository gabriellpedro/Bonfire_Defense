import 'package:bonfire/bonfire.dart';

class CharacterSpritesheet {
  static const _size = 32.0;
  final String path;

  CharacterSpritesheet({required String fileName})
      : path = 'characters/$fileName';

  SimpleDirectionAnimation getAnimation() {
    return SimpleDirectionAnimation(
      idleRight: _getidleRight,
      idleDown: _getidleDown,
      idleUp: _getidleUp,
      runRight: _getRunRight,
      runUp: _getRunUp,
      runDown: _getRunDown,
      others: {
        'attack-range-down': _getRangeDown,
        'attack-range-downLeft': _getRangeDownLeft,
        'attack-range-left': _getRangeLeft,
        'attack-range-upLeft': _getRangeUpLeft,
        'attack-range-up': _getRangeUp,
        'attack-range-upRight': _getRangeUpRight,
        'attack-range-right': _getRangeRight,
        'attack-range-downRight': _getRangeDownRight,
      },
    );
  }

  Future<SpriteAnimation> get _getidleRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.3,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(0 * _size, 2 * _size)),
      );

  Future<SpriteAnimation> get _getidleDown => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.3,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(0 * _size, 0 * _size)),
      );

  Future<SpriteAnimation> get _getidleUp => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.3,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(0 * _size, 4 * _size)),
      );

  Future<SpriteAnimation> get _getRunRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.3,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(1 * _size, 2 * _size)),
      );

  Future<SpriteAnimation> get _getRunUp => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.4,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(1 * _size, 4 * _size)),
      );

  Future<SpriteAnimation> get _getRunDown => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.4,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(1 * _size, 0 * _size)),
      );

  Future<SpriteAnimation> get _getRangeDown => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.4,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(8 * _size, 0 * _size)),
      );

  Future<SpriteAnimation> get _getRangeDownLeft => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.4,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(8 * _size, 7 * _size)),
      );

  Future<SpriteAnimation> get _getRangeLeft => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.4,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(8 * _size, 6 * _size)),
      );

  Future<SpriteAnimation> get _getRangeUpLeft => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.4,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(8 * _size, 5 * _size)),
      );

  Future<SpriteAnimation> get _getRangeUp => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.4,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(8 * _size, 4 * _size)),
      );

  Future<SpriteAnimation> get _getRangeUpRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.4,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(8 * _size, 3 * _size)),
      );

  Future<SpriteAnimation> get _getRangeRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.4,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(8 * _size, 2 * _size)),
      );

  Future<SpriteAnimation> get _getRangeDownRight => SpriteAnimation.load(
        path,
        SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.4,
            textureSize: Vector2.all(_size),
            texturePosition: Vector2(8 * _size, 1 * _size)),
      );
}
