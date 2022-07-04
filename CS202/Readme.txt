//ASHISH VIRDI
//2020CSB1077
1. We have creatted a complier using flex and bison.
2. I have made 2 file - .lex and .yacc. We have defined Tokens in the lexer file which we generally use in the C language and they are being passed using yylex to the yacc. Yacc parses the sample.cu and prints all the terminals in parse.txt. In yacc, it detects variables, constants, function calls, arguments, function body etc.
3. Our compiler works fine for C code such as those which are given in examples for the lab submission. Some of the warnings can be neglected.
4. My grammar detects the general C language Pattern and Prints the section of grammar matched.
