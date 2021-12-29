import 'dart:core';
import 'dart:math';

void main() {
  var size = 6;
  List<List<int>> a = [
    [0, 7, 9, 0, 0, 14],
    [7, 0, 10, 15, 0, 0],
    [9, 10, 0, 11, 0, 2],
    [0, 15, 11, 0, 6, 0],
    [0, 0, 0, 6, 0, 9],
    [14, 0, 2, 0, 9, 0]
  ];

  List<int> minDistance = [];
  List<int> tops = [];
  var temp, minIndex, min, i, j;
  var startIndex = 0;

  for (i = 0; i < size; i++) {
    minDistance.add(10000);
    tops.add(1);
  }
  minDistance[startIndex] = 0;
  do {
    minIndex = 10000;
    min = 10000;
    for (i = 0; i < size; i++) {
      if ((tops[i] == 1) && (minDistance[i] < min)) {
        min = minDistance[i];
        minIndex = i;
      }
    }
    if (minIndex != 10000) {
      for (i = 0; i < size; i++) {
        if (a[minIndex][i] > 0) {
          temp = min + a[minIndex][i];
          if (temp < minDistance[i]) {
            minDistance[i] = temp;
          }
        }
      }
      tops[minIndex] = 0;
    }
  } while (minIndex < 10000);
  print(minDistance);

  List<int> path = [];
  int endIndex = size - 1;
  path.add(endIndex + 1);
  for (i = 1; i < size; i++) {
    path.add(0);
  }

  int indexPrevTop = 1; //* index for previous top
  int weight = minDistance[endIndex]; //* index for ended top
  while (endIndex != startIndex) {
    for (i = 0; i < size; i++) {
      if (a[i][endIndex] != 0) {
        temp = weight - a[i][endIndex];
        if (temp == minDistance[i]) {
          weight = temp;
          endIndex = i;
          path[indexPrevTop] = i + 1;
          indexPrevTop++;
        }
      }
    }
  }
  // * print(path); - can make this
  for (i = indexPrevTop - 1; i >= 0; i--) {
    print(path[i]); // * but more pretier like this i think
  }
}
