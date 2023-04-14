#include "mystack.h"

int *operations;
int *numbers;

int num_count = 0;
int op_count = 0;
int num_capacity = 0;
int op_capacity = 0;

void add_element(int **arr, int *count, int *capacity, int value) {
  if (*count == *capacity) {
    *capacity = (*capacity == 0) ? 1 : *capacity * 2;
    *arr = (int *)realloc(*arr, sizeof(int) * *capacity);
  }
  (*arr)[(*count)++] = value;
}

int pop_element(int **arr, int *count) {
  if (*count == 0) {
    fprintf(stderr, "Error: No more elements to pop.\n");
    exit(1);
  }
  return (*arr)[--(*count)];
}

void add_number(int num) {
  add_element(&numbers, &num_count, &num_capacity, num);
}

void add_operation(int op) {
  add_element(&operations, &op_count, &op_capacity, op);
}

int pop_number() { return pop_element(&numbers, &num_count); }

int pop_operation() { return pop_element(&operations, &op_count); }

///////////////

int is_empty(int *count) {
  if (*count == 0) {
    return 1;
  }
  return 0;
}

void print_array(const char *name, int *arr, int count) {
  printf("%s: [", name);
  for (int i = 0; i < count; i++) {
    printf("%d", arr[i]);
    if (i < count - 1) {
      printf(", ");
    }
  }
  printf("]\n");
}

int is_number_empty() { return is_empty(&num_count); }
int is_operation_empty() { return is_empty(&op_count); }

void print_numbers() { print_array("Numbers array", numbers, num_count); };
void print_operations() {
  print_array("Operations array", operations, op_count);
}
