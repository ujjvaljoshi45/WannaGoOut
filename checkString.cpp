
#include <iostream>
using namespace std;
int main() {
    char str[100];
    int cap,sm,dig;
    cap = sm = dig = 0;
    cout << "Enter a string: ";
    cin >> str;
    for (int i = 0; str[i] != '\0'; i++) {
        if (str[i] >= 'A' && str[i] <= 'Z') {
            cap++;
        } else if (str[i] >= 'a' && str[i] <= 'z') {
            sm++;
        } else if (str[i] >= '0' && str[i] <= '9') {
            dig++;
        }
    }
    cout << "Capital letter: " << cap << endl;
    cout << "Small letter: " << sm << endl;
    cout << "Digit: " << dig << endl;
    return 0;
}