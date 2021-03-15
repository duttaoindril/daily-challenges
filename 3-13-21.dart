int lengthOfLongestSubstring(String s) {
  List<String> splitStr = s.split('');
  Set<String> lastSet = <String>{};
  int largestSize = 1;
  int pointerA = 0;
  int pointerB = 0;
  do {
    if(pointerA == pointerB) {
      lastSet.add(splitStr.elementAt(pointerA));  
      pointerB += 1;
    } else {
      final currentLetter = splitStr.elementAt(pointerB);
      if(lastSet.contains(currentLetter)) {
        if(lastSet.length > largestSize) {
          largestSize = lastSet.length;
        }
        pointerA = splitStr.indexOf(currentLetter, pointerA) + 1;
        pointerB = pointerA;
        lastSet = <String>{};
      } else {
        pointerB += 1;
        lastSet.add(currentLetter);
      }
    }
  } while(
    pointerA < splitStr.length - 1 && pointerB < splitStr.length
  );
  return largestSize;
}

void test(String test, int Function(String) func, int solution) {
  int result = func(test);
  bool passed = solution == result;
  print(
    'Test case $test ${passed ? 'PASSED' : 'FAILED'} for solution $solution with result $result.',
  );
}

void main() {
  test('abrkaabcdefghijjxxx', lengthOfLongestSubstring, 10);
}