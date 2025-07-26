#include <iostream>
#include <cstdlib>

using namespace std;

int main () 
{
	int visota, stroka, probels;
	visota=0;
	do
	{
		cout<<"enter value for heigh: ";
		cin>>visota;
		cout<<endl;
	}
	while (!((visota > 0) && (visota %2 == 1)));
	visota /=2;
	for( int stroka = 1; stroka <= (visota + 1); stroka++){
		for(int probels = 1; probels <= visota - stroka +1;probels ++)
		{ 	cout<< " ";
		}
		cout<<"*";
		if(stroka != 1) {
			for( int probels=1; probels <= 2 * stroka - 3;probels++)
			{
				cout<<" ";
			}
			cout<<"*";
	}
		cout<< "\n";
	}
	
	for( int stroka = visota; stroka >= 1 ; stroka--){
		for(int probels = 1; probels <= visota - stroka +1;probels ++)
		{ 	cout<< " ";
		}
		cout<<"*";
		if(stroka != 1) {
			for( int probels=1; probels <= 2 * stroka - 3;probels++)
			{
				cout<<" ";
			}
			cout<<"*";
	}
		cout<< "\n";
	}
	return 0;
}
