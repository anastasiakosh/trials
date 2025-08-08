#include <iostream>
#include <cstdio>
using namespace std;

int main () 
{
const int num=10;
int array [num];
srand(time(0));
for (int i=0; i<num;i++)
{
array[i]=rand()%1000;
}
for (int i=0; i<num;i++)
{
cout<< "array "<<i<<array[i]<<endl;

}


}

