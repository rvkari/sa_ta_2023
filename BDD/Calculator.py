def start_calculator():
    print("Calculator Started")

def calculate_term(term):
    """
    Interpret term as a mathematical expression
    and return the result
    """
    print("Calculating Term:", term)
    #print(eval(term))
    return eval(term)

#start_calculator()
#result = calculate_term("1+1")
#print("The result is: ", result)