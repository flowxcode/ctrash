#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main()
{
    vector<string> msg {"Helloxx", "f struct"};
    // msg.assign
    for (const string& word : msg)
    {
        cout << word << " ";
    }
    cout << endl;
}