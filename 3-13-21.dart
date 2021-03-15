class Node<T> {
  Node<T>? next;
  final T value;

  Node(this.value, [this.next]);

  Node<T> setNext(Node<T> nextNode) {
    next = nextNode;
    return nextNode;
  }

  @override
  String toString() {
    return 'Node($value) -> ${next}';
  }

  int get listValue {
    final int? nextValue = next?.listValue;
    return int.parse('${nextValue == null ? '' : nextValue}$value');
  }

  String get printed {
    return '${toString()} ==> ${listValue}';
  }
}

Node<int>? sum(Node<int>? a, Node<int>? b, [bool carry = false]) {
  if (a == null && b == null) {
    return null;
  }
  final int firstA = a?.value ?? 0;
  final int firstB = b?.value ?? 0;
  final int added = firstA + firstB + (carry ? 1 : 0);
  final bool nextCarry = added >= 10;
  final Node<int> finalToAdd = Node<int>(nextCarry ? added - 10 : added);
  final Node<int>? nextNode = sum(a?.next, b?.next, nextCarry);
  print(nextNode);
  return nextNode == null ? finalToAdd : (finalToAdd..setNext(nextNode));
}

void main() {
  final Node<int> listA = Node(9)
    ..setNext(Node(2)..setNext(Node(4)..setNext(Node(3))));
  final Node<int> listB = Node(5)..setNext(Node(6)..setNext(Node(4)));

  print(listA.printed);
  print(listB.printed);

  final Node<int>? summed = sum(listA, listB);
  print(summed?.printed);
}
