<p align="center">
    <img src="42Malaga.png" alt="Logo de 42 Malaga" />
</p>

# Libft - My First C Library

*A comprehensive recreation of essential C standard library functions*

[![Norminette](https://img.shields.io/badge/Norminette-passing-brightgreen)](https://github.com/42School/norminette)
[![Language](https://img.shields.io/badge/Language-C-blue.svg)](https://en.wikipedia.org/wiki/C_(programming_language))
[![Grade](https://img.shields.io/badge/Grade-125%2F100-success)](https://projects.intra.42.fr/projects/libft)

</div>

---

## 📖 Table of Contents

- [About](#about)
- [Usage](#usage)
- [Functions Categories](#functions-categories)
  - [Standard Library Functions](#standard-library-functions)
  - [Additional Functions](#additional-functions)
  - [Bonus Functions](#bonus-functions)
- [Functions Reference](#functions-reference)
- [Compilation](#compilation)
- [Contributing](#-contributing)

---

## About

**Libft** is the first project at 42 School where you recreate your own version of some standard C library functions. This project teaches you the fundamentals of C programming, memory management, and provides a solid foundation for future 42 projects. To know more about the project see the [subject](subject.pdf).

The library is divided into three main parts:
- **Part 1**: Recreation of standard libc functions
- **Part 2**: Additional utility functions not present in libc
- **Bonus**: Linked list manipulation functions

### Features

- ✅ **42 Norminette Compliant** - Follows strict coding standards
- 🔒 **Memory Safe** - Proper memory allocation and deallocation
- 🧪 **Thoroughly Tested** - Robust implementation with edge case handling
- 📚 **Well Documented** - Clear function descriptions and usage examples
- ⚡ **Optimized** - Efficient algorithms and minimal overhead

---

## Usage

### Clone and Build

```bash
# Clone the repository
git clone https://github.com/N4ch2/Libft.git
cd Libft

# Compile the library
make
```

### Create your C file

```c
// filename: main.c
#include "libft.h"
#include <stdio.h>

// Helper function to free split result
void free_split(char **split)
{
    int i = 0;
    while (split[i])
        free(split[i++]);
    free(split);
}

// Demo function using multiple character transformations
char to_alternate_case(unsigned int i, char c)
{
    if (i % 2 == 0)
        return (ft_toupper(c));
    return (ft_tolower(c));
}

int main(void)
{
    printf("🚀 LIBFT DEMO 🚀\n");
    printf("========================\n\n");
    
    // 1. Complex string processing pipeline
    printf("📝 STRING PROCESSING PIPELINE:\n");
    char *raw_data = "  Hello,World,42,School,Programming  ";
    printf("Original: '%s'\n", raw_data);
    
    // Trim whitespace
    char *trimmed = ft_strtrim(raw_data, " \t\n");
    printf("Trimmed:  '%s'\n", trimmed);
    
    // Split into words
    char **words = ft_split(trimmed, ',');
    printf("Split into %d words:\n", 5);
    for (int i = 0; words[i]; i++)
        printf("  [%d]: '%s'\n", i, words[i]);
    
    // 2. String transformation with ft_strmapi
    printf("\n🎨 STRING TRANSFORMATION:\n");
    char *sample = ft_strdup("libft is awesome!");
    char *transformed = ft_strmapi(sample, to_alternate_case);
    printf("Original:    '%s'\n", sample);
    printf("Transformed: '%s'\n", transformed);
    
    // 3. Mathematical operations and conversions
    printf("\n🔢 MATH & CONVERSIONS:\n");
    int numbers[] = {42, -123, 0, 987654321, -2147483648};
    for (int i = 0; i < 5; i++)
    {
        char *str_num = ft_itoa(numbers[i]);
        int converted_back = ft_atoi(str_num);
        printf("Int: %d → String: '%s' → Int: %d ✓\n", 
               numbers[i], str_num, converted_back);
        free(str_num);
    }
    
    // 4. Memory operations showcase
    printf("\n💾 MEMORY OPERATIONS:\n");
    char *buffer = ft_calloc(20, sizeof(char));
    ft_strlcpy(buffer, "Memory", 20);
    ft_strlcat(buffer, " is ", 20);
    ft_strlcat(buffer, "safe!", 20);
    printf("Built string: '%s'\n", buffer);
    
    // Create substring
    char *sub = ft_substr(buffer, 7, 2);
    printf("Substring [7:2]: '%s'\n", sub);
    
    // 5. Advanced string operations
    printf("\n🔍 SEARCH & MANIPULATION:\n");
    char *text = "The quick brown fox jumps over the lazy dog";
    char *found = ft_strchr(text, 'q');
    if (found)
        printf("Found 'q' at position: %ld\n", found - text);
    
    char *last_o = ft_strrchr(text, 'o');
    if (last_o)
        printf("Last 'o' at position: %ld\n", last_o - text);
    
    char *needle = ft_strnstr(text, "fox", ft_strlen(text));
    if (needle)
        printf("Found 'fox' at position: %ld\n", needle - text);
    
    // 6. File descriptor operations
    printf("\n📤 FILE DESCRIPTOR DEMO:\n");
    ft_putstr_fd("Writing to stdout: ", 1);
    ft_putnbr_fd(42, 1);
    ft_putendl_fd(" is the answer!", 1);
    
    // 7. Character classification showcase
    printf("\n✅ CHARACTER CLASSIFICATION:\n");
    char test_chars[] = {'A', '9', ' ', '@', '\n'};
    char *descriptions[] = {"Letter", "Digit", "Space", "Symbol", "Newline"};
    
    for (int i = 0; i < 5; i++)
    {
        char c = test_chars[i];
        printf("%s '%c': alpha=%d, digit=%d, alnum=%d, print=%d, ascii=%d\n",
               descriptions[i], (c == '\n' ? '\\' : c),
               ft_isalpha(c), ft_isdigit(c), ft_isalnum(c), 
               ft_isprint(c), ft_isascii(c));
    }
    
    printf("\n🎉 Demo completed successfully!\n");
    printf("💡 This demo showcased string processing, memory management,\n");
    printf("   conversions, searching, and character classification!\n");
    
    // Cleanup
    free(trimmed);
    free_split(words);
    free(sample);
    free(transformed);
    free(buffer);
    free(sub);
    
    return (0);
}
```

### Compile the code

```bash
gcc -Wall -Wextra -Werror main.c libft.a -o main.out
```
### Run

```bash
./main.out
```

---

## Functions Categories

### Standard Library Functions
*Recreated versions of libc functions*

| Function | Description |
|----------|-------------|
| [`ft_atoi`](#ft_atoi) | Convert ASCII string to integer |
| [`ft_bzero`](#ft_bzero) | Zero out memory area |
| [`ft_calloc`](#ft_calloc) | Allocate and zero memory |
| [`ft_isalnum`](#ft_isalnum) | Check if alphanumeric |
| [`ft_isalpha`](#ft_isalpha) | Check if alphabetic |
| [`ft_isascii`](#ft_isascii) | Check if ASCII character |
| [`ft_isdigit`](#ft_isdigit) | Check if digit |
| [`ft_isprint`](#ft_isprint) | Check if printable |
| [`ft_memchr`](#ft_memchr) | Locate byte in memory |
| [`ft_memcmp`](#ft_memcmp) | Compare memory areas |
| [`ft_memcpy`](#ft_memcpy) | Copy memory area |
| [`ft_memmove`](#ft_memmove) | Copy memory (overlap-safe) |
| [`ft_memset`](#ft_memset) | Fill memory with byte |
| [`ft_strchr`](#ft_strchr) | Locate character in string |
| [`ft_strrchr`](#ft_strrchr) | Locate character (reverse) |
| [`ft_strdup`](#ft_strdup) | Duplicate string |
| [`ft_strlcat`](#ft_strlcat) | Concatenate strings safely |
| [`ft_strlcpy`](#ft_strlcpy) | Copy string safely |
| [`ft_strlen`](#ft_strlen) | Calculate string length |
| [`ft_strncmp`](#ft_strncmp) | Compare strings |
| [`ft_strnstr`](#ft_strnstr) | Locate substring |
| [`ft_tolower`](#ft_tolower) | Convert to lowercase |
| [`ft_toupper`](#ft_toupper) | Convert to uppercase |

### ⚡ Additional Functions
*Useful functions not in the standard library*

| Function | Description |
|----------|-------------|
| [`ft_itoa`](#ft_itoa) | Convert integer to string |
| [`ft_split`](#ft_split) | Split string by delimiter |
| [`ft_strjoin`](#ft_strjoin) | Concatenate two strings |
| [`ft_strmapi`](#ft_strmapi) | Apply function to each character |
| [`ft_striteri`](#ft_striteri) | Apply function to each character (in-place) |
| [`ft_strtrim`](#ft_strtrim) | Trim characters from string |
| [`ft_substr`](#ft_substr) | Extract substring |
| [`ft_putchar_fd`](#ft_putchar_fd) | Output character to file descriptor |
| [`ft_putstr_fd`](#ft_putstr_fd) | Output string to file descriptor |
| [`ft_putendl_fd`](#ft_putendl_fd) | Output string with newline to file descriptor |
| [`ft_putnbr_fd`](#ft_putnbr_fd) | Output number to file descriptor |

### 🔗 Bonus Functions
*Linked list manipulation functions*

| Function | Description |
|----------|-------------|
| [`ft_lstnew`](#ft_lstnew) | Create new list element |
| [`ft_lstadd_front`](#ft_lstadd_front) | Add element at beginning |
| [`ft_lstadd_back`](#ft_lstadd_back) | Add element at end |
| [`ft_lstsize`](#ft_lstsize) | Count list elements |
| [`ft_lstlast`](#ft_lstlast) | Get last element |
| [`ft_lstdelone`](#ft_lstdelone) | Delete one element |
| [`ft_lstclear`](#ft_lstclear) | Delete and free entire list |
| [`ft_lstiter`](#ft_lstiter) | Apply function to each element |
| [`ft_lstmap`](#ft_lstmap) | Apply function and create new list |

---

## Functions Reference

### Standard Library Functions

#### `ft_atoi`
```c
int ft_atoi(const char *str);
```
Converts the initial portion of the string pointed to by `str` to `int` representation.

**Parameters:**
- `str`: String to convert

**Return value:** The converted value

**Example:**
```c
int num = ft_atoi("42");     // Returns 42
int neg = ft_atoi("-123");   // Returns -123
```

#### `ft_bzero`
```c
void ft_bzero(void *s, size_t n);
```
Erases the data in the `n` bytes of the memory starting at the location pointed to by `s`, by writing zeros to that area.

**Parameters:**
- `s`: Pointer to memory area
- `n`: Number of bytes to zero

#### `ft_calloc`
```c
void *ft_calloc(size_t count, size_t size);
```
Allocates memory for an array of `count` elements of `size` bytes each and returns a pointer to the allocated memory. The memory is set to zero.

**Parameters:**
- `count`: Number of elements
- `size`: Size of each element

**Return value:** Pointer to allocated memory, or NULL if allocation fails

#### `ft_isalnum`
```c
int ft_isalnum(int c);
```
Checks for an alphanumeric character.

**Parameters:**
- `c`: Character to check

**Return value:** Non-zero if true, 0 if false

#### `ft_isalpha`
```c
int ft_isalpha(int c);
```
Checks for an alphabetic character.

#### `ft_isascii`
```c
int ft_isascii(int c);
```
Checks whether `c` is a 7-bit ASCII character.

#### `ft_isdigit`
```c
int ft_isdigit(int c);
```
Checks for a digit (0 through 9).

#### `ft_isprint`
```c
int ft_isprint(int c);
```
Checks for any printable character including space.

#### `ft_memchr`
```c
void *ft_memchr(const void *s, int c, size_t n);
```
Scans the initial `n` bytes of the memory area pointed to by `s` for the first instance of `c`.

#### `ft_memcmp`
```c
int ft_memcmp(const void *s1, const void *s2, size_t n);
```
Compares the first `n` bytes of the memory areas `s1` and `s2`.

#### `ft_memcpy`
```c
void *ft_memcpy(void *dst, const void *src, size_t n);
```
Copies `n` bytes from memory area `src` to memory area `dst`. Memory areas must not overlap.

#### `ft_memmove`
```c
void *ft_memmove(void *dst, const void *src, size_t len);
```
Copies `len` bytes from string `src` to string `dst`. The two strings may overlap.

#### `ft_memset`
```c
void *ft_memset(void *b, int c, size_t len);
```
Fills the first `len` bytes of the memory area pointed to by `b` with the constant byte `c`.

#### `ft_strchr`
```c
char *ft_strchr(const char *s, int c);
```
Returns a pointer to the first occurrence of the character `c` in the string `s`.

#### `ft_strrchr`
```c
char *ft_strrchr(const char *s, int c);
```
Returns a pointer to the last occurrence of the character `c` in the string `s`.

#### `ft_strdup`
```c
char *ft_strdup(const char *s1);
```
Returns a pointer to a new string which is a duplicate of the string `s1`.

#### `ft_strlcat`
```c
size_t ft_strlcat(char *dst, char *src, size_t dstsize);
```
Appends string `src` to the end of `dst`. It will append at most `dstsize - strlen(dst) - 1` characters.

#### `ft_strlcpy`
```c
size_t ft_strlcpy(char *dst, char *src, size_t dstsize);
```
Copies up to `dstsize - 1` characters from the string `src` to `dst`, null-terminating the result.

#### `ft_strlen`
```c
size_t ft_strlen(const char *s);
```
Calculates the length of the string pointed to by `s`, excluding the terminating null byte.

#### `ft_strncmp`
```c
int ft_strncmp(const char *s1, const char *s2, size_t n);
```
Compares the two strings `s1` and `s2`, but at most the first `n` bytes of `s1` and `s2`.

#### `ft_strnstr`
```c
char *ft_strnstr(const char *haystack, const char *needle, size_t len);
```
Locates the first occurrence of the null-terminated string `needle` in the string `haystack`, where not more than `len` characters are searched.

#### `ft_tolower`
```c
int ft_tolower(int c);
```
Converts an upper-case letter to the corresponding lower-case letter.

#### `ft_toupper`
```c
int ft_toupper(int c);
```
Converts a lower-case letter to the corresponding upper-case letter.

### Additional Functions

#### `ft_itoa`
```c
char *ft_itoa(int n);
```
Allocates and returns a string representing the integer received as an argument.

**Example:**
```c
char *str = ft_itoa(42);     // Returns "42"
char *neg = ft_itoa(-123);   // Returns "-123"
```

#### `ft_split`
```c
char **ft_split(char const *s, char c);
```
Allocates and returns an array of strings obtained by splitting `s` using the character `c` as a delimiter.

**Example:**
```c
char **words = ft_split("hello,world,42", ',');
// Returns ["hello", "world", "42", NULL]
```

#### `ft_strjoin`
```c
char *ft_strjoin(char const *s1, char const *s2);
```
Allocates and returns a new string, which is the result of the concatenation of `s1` and `s2`.

#### `ft_strmapi`
```c
char *ft_strmapi(char const *s, char (*f)(unsigned int, char));
```
Applies the function `f` to each character of the string `s` to create a new string.

#### `ft_striteri`
```c
void ft_striteri(char *s, void (*f)(unsigned int, char*));
```
Applies the function `f` on each character of the string passed as argument, passing its index as first argument.

#### `ft_strtrim`
```c
char *ft_strtrim(char const *s1, char const *set);
```
Allocates and returns a copy of `s1` with the characters specified in `set` removed from the beginning and the end of the string.

#### `ft_substr`
```c
char *ft_substr(char const *s, unsigned int start, size_t len);
```
Allocates and returns a substring from the string `s`. The substring begins at index `start` and is of maximum size `len`.

#### `ft_putchar_fd`
```c
void ft_putchar_fd(char c, int fd);
```
Outputs the character `c` to the given file descriptor.

#### `ft_putstr_fd`
```c
void ft_putstr_fd(char *s, int fd);
```
Outputs the string `s` to the given file descriptor.

#### `ft_putendl_fd`
```c
void ft_putendl_fd(char *s, int fd);
```
Outputs the string `s` to the given file descriptor followed by a newline.

#### `ft_putnbr_fd`
```c
void ft_putnbr_fd(int n, int fd);
```
Outputs the integer `n` to the given file descriptor.

### Bonus Functions

#### `ft_lstnew`
```c
t_list *ft_lstnew(void *content);
```
Allocates and returns a new node. The member variable `content` is initialized with the value of the parameter `content`.

#### `ft_lstadd_front`
```c
void ft_lstadd_front(t_list **lst, t_list *new);
```
Adds the node `new` at the beginning of the list.

#### `ft_lstadd_back`
```c
void ft_lstadd_back(t_list **lst, t_list *new);
```
Adds the node `new` at the end of the list.

#### `ft_lstsize`
```c
int ft_lstsize(t_list *lst);
```
Counts the number of nodes in a list.

#### `ft_lstlast`
```c
t_list *ft_lstlast(t_list *lst);
```
Returns the last node of the list.

#### `ft_lstdelone`
```c
void ft_lstdelone(t_list *lst, void (*del)(void *));
```
Takes as a parameter a node and frees the memory of the node's content using the function `del` given as a parameter and free the node.

#### `ft_lstclear`
```c
void ft_lstclear(t_list **lst, void (*del)(void *));
```
Deletes and frees the given node and every successor of that node, using the function `del` and free.

#### `ft_lstiter`
```c
void ft_lstiter(t_list *lst, void (*f)(void *));
```
Iterates the list `lst` and applies the function `f` on the content of each node.

#### `ft_lstmap`
```c
t_list *ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *));
```
Iterates the list `lst` and applies the function `f` on the content of each node. Creates a new list resulting of the successive applications of the function `f`.

---

## Compilation

The library uses a comprehensive Makefile with the following targets:

```bash
# Compile mandatory functions
make

# Compile with bonus functions  
make bonus

# Clean object files
make clean

# Remove all generated files
make fclean

# Recompile everything
make re
```

**Compilation flags:** `-Wall -Wextra -Werror`

---

## 🤝 Contributing

This is a 42 School project, but feedback and suggestions are welcome! If you find any issues or have improvements to suggest, feel free to:

1. Fork the repository
2. Create a feature branch
3. Submit a pull request

---

<div align="center">

**Made with ❤️ at 42 Málaga**

[42 Málaga](https://www.42malaga.com/) | [42 Network](https://www.42network.org/)

</div>