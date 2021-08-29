//Nathaniel Morrow Day 2
//1. write a program to find the nth Fibonacci number.
fib := method(n,
    a := 1;
    b := 1;
    c := 1;
    for(i, 2, n,
        c = a;
        a = a + b;
        b = c;
    );
    a
)

fib(5) println

//2. overload / oto return 0 if the denominator is 0
div := Number getSlot("/")
Number / := method(a, if (a == 0, 0, div(a)))

//3. add up all numbers in a two-dimensional array

myList := list(1,2,3,4,5)
list2 := list(myList, myList, myList)

sum2d := method(aList,
    total := 0;
    aList foreach(a,   
        total = total + (a sum);
    );
)

sum2d(list2) println

//4. add a slot called myAverage to a list that computes the average of all numbers in a list. What happens if there are no numbers in a list?

myAverage := method(a, 
    mySum := a sum;
    mySum / (a size);
)

myAverage(myList) println

//5. write a prototype for a two-dimensional list. The dim(x,y) method should allocate a list of y lists that are x elements long. set(x, y, value) should set a value, and get(x, y) should return a value.

Lists := list clone;

Lists dim := method(x, y,
    self setSize(x);
    for(i, 0, x-1, 1,
        self atPut(i, (list setSize(y)))
    )
)

Lists set := method(x, y, value, 
    self at(x) atPut(y, value);
)

Lists get := method(x, y, 
    self at(x) at(y);
)

Lists toFile := method(file,
    self foreach(a,
        a foreach(b,
            file write(b asString, "\n")
        )
    )
)

//takes in size of matrix, assuming file stores one of this size
Lists fromFile := method(file, x, y,
    for(i, 0, x-1, 1,
        for(j, 0, y-1, 1,
            self at(i) atPut(j, (file readLine))
        )
    )
)

test := Lists clone
test dim(3,3)
test set(1,1,5)
test get(1,1) println

//6.bonus, write a transpose method so that (new_matrix get(y,x)) == matrix get(x, y) on the original list
//------------------

//7. write tha matrix to a file and read a matrix from a file.

//write
file := File clone openForUpdating("./text.txt")
test toFile(file)
file close

//read
file := File clone openForReading("./text.txt")
test2 := Lists clone
test2 dim(3,3)
test2 fromFile(file, 3, 3)
file close

//8. write a program that gives you ten tries to guess a random number from 1-100. If you would like, give a hint of hotter or colder after the first guess.


io      := File standardInput;
randNum := Random value(0,100) round
guess   := -1

while(guess != randNum,
    guess := io readLine("number between : ") asNumber;
    if(guess < randNum, "low" println, "high" println)
)
"You got it!" println

io close
