*  → matches zero or more characters
ls *.txt         all files ending in .txt
ls a*            files starting with a
ls a*.txt        start with a, end with .txt


 ?  → matches exactly one character
ls ?.txt         single character filename ending in .txt
ls a?            a followed by one character
ls a?.txt        a + one character + .txt


 [ ]  → character class (match exactly one)
ls [aeiou]*      files starting with vowel
ls ca[nt]*       can, cat, candy, catch


 [!]  → exclude characters
ls [!a]*         files NOT starting with a
ls *[!0-9]       files not ending in digit


 Range using -
ls [a-g]*        files starting from a to g
ls file[1-5].txt  file1.txt to file5.txt


 Named character classes
ls [[:alpha:]]*    alphabetic letters
ls [[:alnum:]]*    alphanumeric
ls [[:digit:]]*    digits only
ls [[:lower:]]*    lowercase letters
ls [[:upper:]]*    uppercase letters
ls *[[:space:]]*   files with spaces
```
