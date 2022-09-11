#include <iostream>

using namespace std;

void intRepr(int x) {
  for (int i = sizeof(x) * 8 - 1; i >= 0; i--) {
    cout << ((x & (1 << i)) ? 1 : 0);
  }
  cout << " <== " << x << endl;
}
void floatRepr(float x) {
  for (int i = sizeof(x) * 8 - 1; i >= 0; i--) {
    if (i == 30 or i == 22)
      cout << " ";
    cout << ((*((int *)&x) & (1 << i)) ? 1 : 0);
  }
  cout << " <== " << x << endl;
}
int main() {
  int arrx[] = {1, -1, 31415, -31415};
  for (int x : arrx)
    intRepr(x);
  float arr[] = {.1, -.1, 3.141590, -3.141590};
  for (float x : arr)
    floatRepr(x);
  return 0;
}
