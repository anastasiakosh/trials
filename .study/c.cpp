#include <iostream>
using namespace std;

int main(){
//test na prostoe 4islo
	for(int i=1;i<1000000;i++)
	{
		bool flag=true;
		int proste =i;
		for(int d=2; d<proste; d++)
		{
			if ((proste)%d == 0) 
				{
				flag=false;
				break;
				}
		}
	if(flag==true) cout<<i<<" is prostoe\n";
	}
return 0;
}
