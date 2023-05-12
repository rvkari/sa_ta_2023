# Variables to be used
mammals = ["cat", "dog", "cow"]
birds = ["eagle", "falcon", "ladybird"]

user1=    "peter"
user2=    "bruce"
user3=    "tony"

### 1st test from line 11 on 1_in.robot file ###
# My functions
def loop_over_list(mammals):
    print("3 mammals:")
    for var in mammals:
        print(var)

# My program
#loop_over_list(mammals)    #uncomment this line to run that fnc

### 2nd Test from line 17 on 1_in.robot file ###
def Loop_over_two_lists_after_each_other(mammals, birds):
    print("3 mammals & three birds:")
    """ for var in mammals:
        print(var)
    for var in birds:
        print(var) """
    loop_over_list(mammals)
    loop_over_list(birds)

#Loop_over_two_lists_after_each_other(mammals, birds)   #uncomment this line to run that fnc



### 3rd Test from line 23 on 1_in.robot file ###
def loop_over_multiple_values(user1, user2, user3):
    # ----- this is one way to implement the code described on 1_in.robot using it's syntax (RF)
    listOfUsers = [user1, user2, user3, "Steve"]

    for user in listOfUsers:
        print(user)

    # ----- this is another way to implement the code described on 1_in.robot using it's syntax (RF)
    #print(user1, user2, user3, "Steve")

    # ----- this is also another way to implement the code described on 1_in.robot using it's syntax (RF)
    """ print(user1)
    print(user2)
    print(user3)
    print("Steve") """

loop_over_multiple_values(user1, user2, user3)