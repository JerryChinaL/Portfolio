Boolean check = false;
int temp;
int max = 1000000000;
int[] list = new int[100000];
void setup() {
  for (int i = 0; i<list.length; i++) {
    list[i] = round(random(max));
  }
  float time = millis();
  while (ifSort(list) == false) {
    for (int i = 0; i<(list.length-1); i++) {
      if (list[i] > list[i+1]){
        temp = list[i];
        list[i] = list[i+1];
        list[i+1] = temp;
      }
    }
  }
  println(list);
  print(millis()-time);
}

//check if the list is already sorted
Boolean ifSort(int[] l) {
  check = true;
  for (int i = 0; i<(l.length-1); i++) {
    if (l[i]>l[(i+1)]) {
      check = false;
    }
  }
  return check;
}
