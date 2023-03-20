import 'package:lr3/entity.dart';

class ShopAssistant2 implements Iterator<Assistant>{
  int _currentIndex = -1;
  List<Assistant> assistants_ = [];

  ShopAssistant2(List<Assistant> assistants){
    assistants_ = assistants;
  }

  @override
  Assistant get current {
    if (_currentIndex < 0 || _currentIndex >= assistants_.length) {
      return Assistant(null, null, 0);
    }
    return assistants_[_currentIndex];
  }

  @override
  bool moveNext() {
    _currentIndex++;
    return _currentIndex < assistants_.length;
  }

}