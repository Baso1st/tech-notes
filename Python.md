- Python doesn't have do-while. Instead you can use while true and a condition at the end to break
  ```python
    While True:
      //Do Something
      if (condition):
        break
  ```
- The Keyword **pass** does nothing. It is useful to use to have an empty function or empty loop. 
- Adjacent strings in python are concatenated!. So ```"String A " "String B"``` is equal to ```"String A String B"```
- Use 3 doulbe quotes or single quotes for multiline string
    ```python
    """ This is
        A multi
        Line String
        """
    ```
- use r infront of a string to denote a raw string(what you see is what you get) ``` r'This \ is what \n' ``` the output will be This \ is what \n
- Two adjacent strings are automatically concatenated ```"String A " "String B " ``` equals ``` "String A String B"```
- Python has a datatype called **byte** that has many of the capabilities of string, but it is a sequence of bytes rather than a sequence of unicode. You can can convert between string and byte using encode and decode. 
- You can multiply strings!!!
  - ``` result = 'a' * 3 ``` result now has the value ```'aaa'```
- Calling a function with a default argument has a bit unexpected behaviour... 
  ```python
  add_spam(menu=[]):
    menu.append('spam')
    return menu
  
  print(add_spam()) # The output is ['spam']
  print(add_spam()) # We called the function another time now the output is ['spam', 'spam']!!! That's because the menu argument is created exaclty once when the def statement is created. 
  ``` 
  The situation above is different if you passed an immutable object to the function like
    ```python 
      add_spam(menu=none):
    ```
- To modify a global variable from within a function we need to use the word global
  ```python
    count = 0
    def modifyCount():
      global count
      count = 2
  ```
- Joining strings is interesting in python ``` ';'.join(['stringA', 'stringB', 'stringC']) ``` the result is ```stringA;stringB;stringC```
- The string partition function is very interesting too!!!
- Python comprehensions example 
  ```python
    words = "This is a string with some randome words in it".split() # It would be  ['This', 'is', 'a', 'string', 'with'....]
    thisIsTheComprehension = [len(word) for word in words] # It would be [4, 2, a, 5, 4, .... ]
  ```
  - Comprehensions can be used to create sets and dictionaries as well.
