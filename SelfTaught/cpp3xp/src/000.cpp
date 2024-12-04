#include <iostream>
#include <cstring>

int globalVar = 10;

int func(){
	int ans = 0;
	int localVar = globalVar;
	for (int i=0;i<=1000;++i){
		ans += localVar*i;
	}
	return ans;
}

// int lunc(){
// 	int ans = 0;
// 	int localVar = globalVar;
// 	for (int i=0;i<=1000;i++){
// 		ans += localVar*i;
// 	}
// 	return ans;
// }

int main(){
	std::cout<<"hasilnya adalah"<<std::endl;
	std::cout<<"---------------"<<std::endl;
	std::cout<<"func: "<<func()<<std::endl;
	// std::cout<<"-------------"<<std::endl;
	// std::cout<<"lunc: "<<lunc()<<std::endl;
	return 0;
}
