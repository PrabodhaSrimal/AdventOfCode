#include <iostream>
#include <fstream>
#include <string>

constexpr const char* INPUT_PATH = "../input.txt";

int part1(const std::string& instructions)
{
    int floor = 0;
    for (const char& c : instructions)
    {
        if (c == '(') floor++;
        if (c == ')') floor--;
    }
    return floor;
}

int part2(const std::string& instructions)
{
    int floor = 0;
    for (int i = 0; i < instructions.size(); ++i)
    {
        const char& c = instructions[i];
        if (c == '(') floor++;
        if (c == ')') floor--;

        if (floor == -1)
        {
            return i + 1;
        }
    }
    return 0;
}

int main()
{
    std::ifstream ifs(INPUT_PATH);
    if (!ifs.is_open())
    {
        return -1;
    }
    std::string buffer;
    std::getline(ifs, buffer);

    std::cout << "Part 1 answer: " << part1(buffer) << std::endl;
    std::cout << "Part 2 answer: " << part2(buffer) << std::endl;

    return 0;
}
