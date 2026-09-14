#include <iostream>
#include <ostream>


// :<开始位置, 结束位置>s/[要替换的字符串]/[替换后的字符串]
// :%s/[要替换的字符串]/[替换后的字符串]/g

int main() {
	std::cout << "hi world" << std::endl;
	std::cout << "hi world" << std::endl;
    std::cout << "hello " << std::endl;
    std::cout << "hello world" << std::endl;
	std::cout << "hi world" << std::endl;
	std::cout << "damn bro\n"; 

	std::cout << "hello world" << std::endl;
	std::cout << "hello world" << std::endl;
	std::cout << "hello world" << std::endl;
	std::cout << "damn bro\n";

	// hello world
	// hello world

	const char* hello_world = "hello world";

	return 0;
}
