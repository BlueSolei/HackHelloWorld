#include <fmt/format.h>

#include "HackHelloWorld.h"

using namespace std;

int main() {
  fmt::print("Main calling HackHelloWorld.Do() ... \n");
  HackHelloWorld hackhelloworld;
  hackhelloworld.Do();
  return 0;
}
