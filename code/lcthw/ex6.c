#include <stdio.h>

int main(int argc, char *argv[])
{
    int distance = 1;
    float power = 2.345f;
    double super_power = 5768.123;
    char initial = 'A';
    char fistname[] = "James";
    char surname[] = "Fraser";

    printf("You are %d \n", distance);
    printf("You are %f \n", power);
    printf("You are %f \n", super_power);
    printf("You are %c \n", initial);
    printf("You are %s \n", fistname);
    printf("You are %s \n", surname);

    printf("Goodbye!\n");

    return 0;
}