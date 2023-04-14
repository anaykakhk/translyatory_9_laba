#ifndef MYSTACK_H
#define MYSTACK_H

#include <stdio.h>
#include <stdlib.h>

void add_element(int **arr, int *count, int *capacity, int value);

int pop_element(int **arr, int *count);

void add_number(int num);

void add_operation(int op);

int pop_number();

int pop_operation();

int is_number_empty();
int is_operation_empty();
void print_numbers();
void print_operations();

#endif
