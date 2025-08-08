#include <iostream>
using namespace std;

int main(){
//test na prostoe 4islo
	bool flag=true;
int proste =1;
cout<<"enter num:"<<endl;
cin >> proste;
for(int d=2; d<proste; d++)
{
if ((proste)%d == 0) {
	flag=false;
	break;
}

}
if(flag==true) cout<<"num is prostoe\n";
else cout<<"num dont is prostoe\n";

return 0;
}
