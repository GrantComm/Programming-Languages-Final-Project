// Grant Commodore & Trae Brown

// This class shows how an array based list would be created using Dart.

class IntList {
  var currentSize;
  var maxSize;
  var list;
  IntList() {
    currentSize = 0;
    maxSize = 10;
    list = new List.filled(maxSize, 0, growable: false);
  }

  // Adds an element to the list.
  void append(int value) {
    if (currentSize == maxSize) {
      var temp = [maxSize * 2];
      for (int i = 0; i < maxSize; i++) {
        temp[i] = list[i];
      }
      list = temp;
      maxSize = maxSize * 2;
    }
    currentSize++;
    print('Adding $value to the list at index ${currentSize - 1}');
    list[currentSize - 1] = value;
  }

  // Removes an element from the list.
  void remove(int value) {
    int index = -1;
    for (int i = 0; i < currentSize; i++) {
      if (list[i] == value) {
        index = i;
        break;
      }
    }
    if (index != -1) {
      for (int i = index; i < currentSize - 1; i++) {
        list[i] = list[i + 1];
      }
      currentSize--;
    }
  }

  // Returns the length of the list.
  int length() {
    return currentSize;
  }

  // Returns the element at the given index.
  int get(int index) {
    return list[index];
  }

  // Returns the first index of the given element.
  int indexOf(int value) {
    for (int i = 0; i < currentSize; i++) {
      if (list[i] == value) {
        return i;
      }
    }
    return -1;
  }

  // Returns the last index of the given element.
  int lastIndexOf(int value) {
    for (int i = currentSize - 1; i >= 0; i--) {
      if (list[i] == value) {
        return i;
      }
    }
    return -1;
  }

  // Returns true if the list contains the given element.
  bool find(int value) {
    for (int i = 0; i < currentSize; i++) {
      if (list[i] == value) {
        return true;
      }
    }
    return false;
  }

  // Returns true if the list is empty.
  bool isEmpty() {
    return currentSize == 0;
  }

  // Removes the first element from the list.
  int removeFirst() {
    int value = list[0];
    for (int i = 0; i < currentSize - 1; i++) {
      list[i] = list[i + 1];
    }
    currentSize--;
    return value;
  }

  // Displays the list.
  void display() {
    for (int i = 0; i < currentSize; i++) {
      print(list[i]);
    }
  }

  // Compares two lists.
  bool equals(IntList other) {
    if (currentSize != other.length()) {
      return false;
    }
    for (int i = 0; i < currentSize; i++) {
      if (list[i] != other.get(i)) {
        return false;
      }
    }
    return true;
  }

  // Sorts the list.
  void sort() {
    for (int i = 0; i < currentSize - 1; i++) {
      for (int j = 0; j < currentSize - i - 1; j++) {
        if (list[j] > list[j + 1]) {
          int temp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = temp;
        }
      }
    }
  }

  // Reverses the list.
  void reverse() {
    for (int i = 0; i < currentSize / 2; i++) {
      int temp = list[i];
      list[i] = list[currentSize - i - 1];
      list[currentSize - i - 1] = temp;
    }
  }
}

void main(List<String> args) {
  IntList list = new IntList();

  list.append(9);
  list.append(2);
  list.append(5);
  list.append(1);

  print("list1 has the following contents: ");
  list.display();

  print("Sort the list1");
  list.sort();

  print("list1 has now has the following contents: ");
  list.display();

  print("Remove the first element from list1");
  print("Removed element: " + list.removeFirst().toString());

  print("list1 has now has the following contents: ");
  list.display();

  IntList list2 = new IntList();
  list2.append(2);
  list2.append(5);
  list2.append(9);

  print("list2 has the following contents: ");
  list2.display();

  print("Compare list1 and list2");
  String result = list.equals(list2) ? "are equal" : "are not equal";

  print("list1 and list2 " + result);

  print("Now delete the first element from list2 and compare again");
  print("Removed element: " + list2.removeFirst().toString() + " from list2");
  result = list.equals(list2) ? "are equal" : "are not equal";

  print("list1 and list2 " + result);

  print("list1 is length: " + list.length().toString());
  print("list2 is length: " + list2.length().toString());

  return;
}
