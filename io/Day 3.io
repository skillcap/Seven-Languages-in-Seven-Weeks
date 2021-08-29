//Nathaniel Morrow Day 3

//1. Enhance the XML program to add spaces to show the indentation structure

Builder := Object clone
Builder indents := 0;
Builder indent := method(for(i, 0, indents-1, 1, "   " print);)
Builder growIndents := method(indents = indents + 1)
Builder shrinkIndents := method(indents = indents -1)

Builder forward := method(
    indent
    writeln("<", call message name, ">");
    growIndents;
    call message arguments foreach(arg,
        content := self doMessage(arg);
        if(content type == "Sequence", 
            indent;
            writeln(content);
        );
    );
    shrinkIndents;
    indent;
    writeln("</", call message name, ">");
)

Builder ul(
    li("Io"),
    li("lua"),
    li("JavaScript")
)

//2. create a list syntax that uses brackets

squareBrackets := method(
    r := List clone;
    call message arguments foreach(a,
        r append(a)
    )
)

[1,2,3]


//3. Enhance the XML program to handle attributes: if the first argument is a map (use curly brackets syntax), add attributes to the xml program.
//   For example: book({"author": "Tate"}...) would print <book aurthor=tate">:

OperatorTable addAssignOperator(":", "atPutNumber")
curlyBrackets := method(
    r := Map clone;
    call message arguments foreach(a,
        r doMessage(a)
    );
    r
)
Map atPutNumber := method(
  self atPut(
      call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
      call evalArgAt(1)
    )
)

//{"author": "Tate"}

Builder := Object clone
Builder indents := 0;
Builder indent := method(for(i, 0, indents-1, 1, "   " print);)
Builder growIndents := method(indents = indents + 1)
Builder shrinkIndents := method(indents = indents -1)


//my failed attempt :(
//close I think though, for some reason call message arguments at(0) type == "Map" is not evaluating to true.
//tested, object is a map, would output correctly if it passed the if statement.
//Please tell me why this if statement is broken :/

//from map, 
Map helper := method(
    self foreach(k,v,
        write(" " .. k .. "=\"" .. v .. "\"");
    )
)

Builder forward := method(
    indent;
    first := true;
    write("<",call message name);
    call message arguments foreach(arg,
        if(first,
            if(arg name == "curlyBrackets",
                (self doMessage(arg)) helper;
            )
            writeln(">");
            first := false;
        )
    );
    growIndents;
    call message arguments foreach(arg,
        content := self doMessage(arg);
        if(content type == "Sequence", 
            indent;
            writeln(content);
        );
    );
    shrinkIndents;
    indent;
    writeln("</", call message name, ">");
)

myBuilder := "ul(book({\"author\":\"Tate\"}), li(\"Io\"), li(\"lua\"), li(\"JavaScript\"))"
Builder doString(myBuilder)

// Builder ul({"author":"Tate"},
//     li("Io"),
//     li("lua"),
//     li("JavaScript")   
// )

//  myMap := Map clone;
//         myMap = call message arguments at(0);
//         myMap foreach(k, v, write(" ", k, "=\"", v, "\""));)