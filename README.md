# LEX_AND_YACC
#
- The steps to test my analyzer :

> $ lex snow.l 

> $ yacc -d snow.y

> $ cc lex.yy.c y.tab.c -lfl

> $ ./a.out

>> snow.l is an a input file written in a language which describes the generation of 
lexical analyzer.                                                                                                                                                       
>> The lex compiler transforms snow.l to a C program known as lex.yy.c.                                                                                                 
>> lex.yy.c is compiled by the C compiler to a file called a.out

- The program knows the concepts of “true” and “false” and can find the results of combinations of propositions. This program knows the precedence and the use of parentheses.

![Ekran Görüntüsü (58)](https://user-images.githubusercontent.com/72701330/206900154-a1c3001f-d0fe-4e15-8582-60929d468226.png)

-  My program can distinguish negative and positive numbers and do addition and subtraction. 

![Ekran Görüntüsü (59)](https://user-images.githubusercontent.com/72701330/206900196-88d12dad-8c30-4ac2-8614-504720a0b747.png)

-  The program pays attention to the precedence of multiplication and division operations. it also gives first priority to parentheses.

![Ekran Görüntüsü (60)](https://user-images.githubusercontent.com/72701330/206900233-476a5e95-b176-4fc3-999d-ebce8e172056.png)

-  Since a number cannot be divided by 0, it gives a warning when it encounters such an operation.

![Ekran Görüntüsü (61)](https://user-images.githubusercontent.com/72701330/206900268-ed903eda-3f5f-4d65-b979-7af85b56f489.png)

- In this program, you can assign a value to a variable and use this variable in mathematic

![Ekran Görüntüsü (62)](https://user-images.githubusercontent.com/72701330/206900311-2c3b66af-3ce0-4b4f-8076-f2c34a8b4e23.png)
al operations

-  Example with all properties mixed :

![Ekran Görüntüsü (63)](https://user-images.githubusercontent.com/72701330/206900347-ad2533b7-6bc0-43d3-911a-374e50962632.png)

### DESCRIPTION OF THE RULES :
* When choosing a variable name(word) , it is imperative to start with a lowercase or uppercase letter. other letters can contain numbers or upper or lower case letters

* If one or more digits (between 0 and 9 , also including 0 and 9 ) side by side, this is number.

* These words are reserved : not , or , and , false , true

> It is important to put this description line first. Because the letter property rule we allow when defining variable name can cause confusion. For example, when the letters 'n' 'o' 't' are encountered next to each other, this is not a token 'WORD' . We have to return 'NOT'. ) When these expressions are encountered( a match is found) , the associated action takes place to produce token ,(their meanings are returned immediately ) and The token is then given to parser for further processing.used for grammar in the yacc file

* ‘-’, ‘+’, ‘/’, ‘*’, ‘=’, ‘(’, ‘)’ program has these operators and it knows the priority of parentheses. The presedence of operators :                                                       
1)  ‘(‘ , ‘)’                                                                                   
2)  ‘*’ , ‘/’                                                                                   
3)  ‘+’, ‘–’

* if it sees a gap (\t) she ignores it.

* It is allowed to use as many operations , words and numbers (variables, constants ..) on the line as you want. This is unlimited .
