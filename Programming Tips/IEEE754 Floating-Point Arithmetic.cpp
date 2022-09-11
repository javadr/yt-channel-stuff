#include <iomanip>
#include <iostream>

using namespace std;

int main() {
  float y;
  int i = (1 << 24) - 1;
  y = i;
  cout << fixed;
  for (int j = 0; j < 5; ++j) {
    cout << i << ' ' << y << '\t';
    cout << i << ' ' << *((int *)&y) << endl;
    y += 1;
    i += 1;
  }
  return 0;
}
