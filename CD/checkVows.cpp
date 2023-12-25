#include <iostream>
using namespace std;

int main() {
    char ip[100];
    int len = 0;
    cout << "Enter Length of string:";
    cin >> len;
    cout << "Enter String:";
    for (int i = 0; i < len; i++) {
        cin >> ip[i];
    }
    int count = 0;
    char vows[] = {'a','e','i','o','u'};
    for (int i = 0; i < len; i++) {
        for (int j = 0; j < 5; j++) {
            if (ip[i] == vows[j] || ip[i] == vows[j] - 32) {
                count++;
            }
        }
    }
    cout << "No of Vowerls: " << count << "\nNo of Consonants: " << len - count << endl;
    return 0;
}

