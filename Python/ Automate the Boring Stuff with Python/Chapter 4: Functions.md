## Chapter 4: Functions

### Arguments and Parameters

```python
def say_hello_to(name):
    # Prints three greetings to the name provided
    print('Good morning, ' + name)
    print('Good afternoon, ' + name)
    print('Good evening, ' + name)

say_hello_to('Al')
```
- To define a function is to create it, just as an assignment statement like spam = 42 creates the spam variable. 
- The def statement defines the say_hello_to() function. The say_hello_to('Al') line calls the now-created function, sending the execution to the top of the function’s code. This function call is passing the string 'Al' to the function. 
- A value being passed in a function call is an argument. Arguments are assigned to local variables called parameters. The argument 'Al' is assigned to the name parameter.

### Return Values and return Statements

- In general, the value to which a function call evaluates is called the return value of the function.
- When creating a function using the `def` statement, you can specify the return value with a return statement, which consists of the following:
    - The return keyword
    - The value or expression that the function should return
