Boolean check = false;
int grade = 10;
int temp;
int max = 1000000000;
int[] list = new int[5000];
void setup() {
  for (int i = 0; i<list.length; i++) {
    list[i] = round(random(max));
  }
  float time = millis();
  while (grade<=max) {
    while (ifSort(list, grade) == false) {
      for (int i = 0; i<(list.length-1); i++) {
        if (list[i]%grade-list[i]%(grade/10)>list[(i+1)]%grade-list[i+1]%(grade/10)) {
          temp = list[i];
          list[i] = list[i+1];
          list[i+1] = temp;
        }
      }
    }
    grade*=10;
  }
  println(list);
  print(millis()-time);
}

Boolean ifSort(int[] l, int grade) {
  check = true;
  for (int i = 0; i<(l.length-1); i++) {
    if (l[i]%grade-l[i]%(grade/10)>l[(i+1)]%grade-l[i+1]%(grade/10)) {
      check = false;
    }
  }
  return check;
}
