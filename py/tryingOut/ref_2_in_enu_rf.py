letters = ["a",  "b",  "c",  "d",  "e", "f",  "g",  "h",  "i",  "j",  "k",  "l",  "m",  "n",  "o",  "p",  "q",  "r",  "s",  "t",  "u",  "v",  "w",  "x",  "y",  "z"]

def Loop_with_index_over_letters(letterList):
    for index, character in enumerate(letterList):
        print( index+1, character)

Loop_with_index_over_letters(letters)