program QuickSort;

CONST
        MaxSize = 150;

TYPE
        DataType = Integer;
        ListType = Array[1..MaxSize] OF DataType;

VAR
        I : Integer;
        List : ListType;

(*****************************************)

PROCEDURE Exchange (VAR First, Second : DataType);

VAR
        Aux : DataType;

BEGIN
        Aux := First;
        First := Second;
        Second := Aux

END;

(*****************************************)

PROCEDURE Partition (VAR List : ListType; First, Last : Integer;
                    VAR Pivot1, Pivot2 : Integer);

VAR
        Right, Left : Integer;
        Pivot : Integer;


BEGIN (*Partition*)

Pivot := List[(First + Last) DIV 2]; (*Pivot is the middle value*)
Right := First;
Left := Last;

        REPEAT
             WHILE List[Right] < Pivot DO
                Right := Right + 1;

             WHILE List[Left] > Pivot DO
                Left := Left - 1;

             IF Right <= Left
                THEN
                   BEGIN
                      Exchange(List[Right], List[Left]);
                      Right := Right + 1;
                      Left := Left - 1;
             END (*IF*)

        UNTIL Right > Left;

        Pivot1 := Right;
        Pivot2 := Left

END (*Partition*);

(*****************************************)

PROCEDURE QuickSort (VAR List : ListType; First, Last : Integer);

VAR
Pivot1, Pivot2 : Integer;

BEGIN (*QuickSort*)

        IF First < Last
           THEN
              BEGIN
              Partition(List, First, Last, Pivot1, Pivot2);

        IF Pivot1 < Last
           THEN QuickSort(List, Pivot1, Last);

        IF First < Pivot2
           THEN QuickSort(List, First, Pivot2)

        END

END; (*QuickSort*)

(*****************************************)

BEGIN //Test algorithm with 20 random numbers

        FOR I := 1 TO 20 DO
           List[I] := RANDOM(100);
           QuickSort(List, 1, 20);

        FOR I := 1 TO 20 DO
           Writeln(List[I])

END. (*Test*)
