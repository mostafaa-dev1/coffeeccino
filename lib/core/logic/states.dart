abstract class CoffeeStates {}
class CoffeeInitialStates extends CoffeeStates {}
class Price extends CoffeeStates {}
class Size extends CoffeeStates {}
class AddState extends CoffeeStates {}
class MiniState extends CoffeeStates {}
class AddLatteState extends CoffeeStates {}
class MiniLatteState extends CoffeeStates {}
class ChangeNavBar extends CoffeeStates {}
class SizeLatte extends CoffeeStates {}


class CoffeeLoginSuccessStates extends CoffeeStates {
  final String uId;

  CoffeeLoginSuccessStates(this.uId);
}
class CoffeeLoginErrorStates extends CoffeeStates {}
class CoffeeLoadingStates extends CoffeeStates {}

class CoffeeRegisterLoadingStates extends CoffeeStates {}
class CoffeeRegisterSuccessStates extends CoffeeStates {
  final String uId;

  CoffeeRegisterSuccessStates(this.uId);
}
class CoffeeRegisterErrorStates extends CoffeeStates {}