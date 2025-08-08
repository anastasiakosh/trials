#include <iostream>
 using namespace std;
namespace A{
int x;
}
int x;
int main() 
{
int x=7;
{
int x=222;
cout << ::x;
}
}
