#include <iostream>

using namespace std;

int* bulbaska(int *a, int nim){
int* buffer=new int [nim];
for (int i=0; i<nim;i++){
buffer[i]=a[i];
}
for (int i=0; i<nim;i++){
	for (int j=0;j<nim-1;j++){
		if(buffer[j]>buffer[j+1]){
		int temp = buffer[j];
                buffer[j] = buffer[j + 1];
                buffer[j + 1] = temp;
		}
	}
	}

return buffer;
}
int main()
{
	const int NUM= 10;
	int* arr = new int [NUM];
	srand(time(0));
	for(int i=0;i<NUM;i++){
	arr[i]=rand()%201;
   cout<<"array ("<<i+1<<"): "<< arr[i]<<'\n';
	}
	int* temp =new int[NUM];
temp=  bulbaska(arr,NUM);
arr=temp;
cout<<endl;
		for(int i=0;i<NUM;i++){
   cout<<"array ("<<i+1<<"): "<< arr[i]<<'\n';
	}
		delete[] arr;

   return 0;
}
