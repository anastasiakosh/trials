#include <iostream>
#include <stdio.h>


using namespace std;
int count_hundred(int *a,int num){
int count=0;
for(int i=0;i<num;i++){
if(a[i] > 100) count++;

}
return count;
}
int main()
{
	const int NUM= 10;
	int arr [NUM];
	srand(time(0));
	for(int i=0;i<NUM;i++){
	arr[i]=rand()%201;
   cout<<"array ("<<i+1<<"): "<< arr[i]<<'\n';
	}
	cout<<"now, we have "<< count_hundred(arr,NUM)<<" elements who >100\n";
   return 0;
}
