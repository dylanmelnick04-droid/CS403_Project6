"Add usage errors...

Average is probably working, but it isn't on my linux environment"

| commandArgs file line count filters |

count := 0.
commandArgs := Smalltalk arguments.

"open file"
employees := OrderedCollection new.

(File exists: (Smalltalk arguments at: 1))
ifFalse: [
    Transcript show: 'Unable to open ', (Smalltalk arguments at: 1), ' for reading'; cr.
    ObjectMemory quit.
].

file := FileStream open: (commandArgs at: 1) mode: FileStream read.


[file atEnd] whileFalse: [
    line := file nextLine.
    (line isEmpty) ifTrue: [ ^nil ].
    "Transcript show: line; cr."
    parts := line substrings: ' '.
    type := (parts at: 1) asLowercase.
    "Transcript show: 'Type: ' , type; cr."

    employee :=
        type = 'salaried'
            ifTrue: [
                emp := SalariedEmployee new.
                emp initializeWithFirst: (parts at: 2)
                                    last: (parts at: 3)
                                    rate: (parts at: 4) asNumber
                                    hours: 0
                                    commissionMinimum: 0
            ]
            ifFalse: [
                type = 'hourly'
                    ifTrue: [
                        emp := HourlyEmployee new.
                        emp initializeWithFirst: (parts at: 2)
                                            last: (parts at: 3)
                                            rate: (parts at: 4) asNumber
                                            hours: (parts at: 5) asNumber
                                            commissionMinimum: 0
                    ]
                    ifFalse: [
                        type = 'commission'
                            ifTrue: [
                                emp := CommissionedEmployee new.
                                emp initializeWithFirst: (parts at: 2)
                                                    last: (parts at: 3)
                                                    rate: (parts at: 6) asNumber
                                                    hours: (parts at: 5) asNumber
                                                    commissionMinimum: (parts at: 4) asNumber
                            ]
                            ifFalse: [
                                Transcript show: 'Usage error: salaried, hourly, or commission'; cr.
                                nil
                            ]
                    ]
            ].
    
    employee ifNotNil: [employees add: employee].
].

file close.

"Transcript show: ''; cr.
employees do: [ : emp |
    Transcript show: emp asString; cr.
]."

"check if count is pass or fail"
commandArgs do: [ :arg |
    count := count + 1.
].

"Transcript show: count printString; cr."
(count = 2 or: [count = 4 or: [count = 1]])
    ifTrue: [ "Transcript show: 'count = 2 or count = 4, pass'; cr." ]
    ifFalse: [
        Transcript show: 'Usage: gst employee.st salaried.st hourly.st commission.st -f main.st datafile action
or
Usage: gst employee.st  salaried.st hourly.st commission.st -f main.st datafile action operator threshold

Valid actions: count print min max total avg
Valid operators: eq ne gt ge lt le
        '; cr.
        ObjectMemory quit.
    ].
file close.

"Create a container for the employees that match the criteria"
eThatFitCriteria := OrderedCollection new.

"employees do: [ :emp |
    Transcript show: (emp earnings printString); cr.
]."

(count = 4)
ifTrue: [
    modulator := (commandArgs at: 4) asNumber.
    "greater than"
    ((commandArgs at: 3) = 'gt')
    ifTrue: [
        employees do: [ :emp |
            (emp earnings > modulator)
            ifTrue: [ eThatFitCriteria add: emp. ]
        ].
    ].

    "less than"
    ((commandArgs at: 3) = 'lt')
    ifTrue: [
        employees do: [ :emp |
            (emp earnings < modulator)
            ifTrue: [ eThatFitCriteria add: emp. ]
        ].
    ].

    "equal to"
    ((commandArgs at: 3) = 'eq')
    ifTrue: [
        employees do: [ :emp |
            (emp earnings = modulator)
            ifTrue: [ eThatFitCriteria add: emp. ]
        ].
    ].

    "not equal to"
    ((commandArgs at: 3) = 'ne')
    ifTrue: [
        employees do: [ :emp |
            (emp earnings ~= modulator)
            ifTrue: [ eThatFitCriteria add: emp. ]
        ].
    ].
    
    "greater than or equal to"
    ((commandArgs at: 3) = 'ge')
    ifTrue: [
        employees do: [ :emp |
            (emp earnings >= modulator)
            ifTrue: [ eThatFitCriteria add: emp. ]
        ].
    ].

    "less than or equal to"
    ((commandArgs at: 3) = 'le')
    ifTrue: [
        employees do: [ :emp |
            (emp earnings <= modulator)
            ifTrue: [ eThatFitCriteria add: emp. ]
        ].
    ].
]
ifFalse: [
    employees do: [ :emp |
            eThatFitCriteria add: emp.
        ].
].

((commandArgs at: 2) = 'print')
ifTrue: [
    eThatFitCriteria do: [ :emp |
        Transcript show: (emp asString); cr.
    ].
].

totalEarnings := 0.
eThatFitCriteria do: [ :emp |
    totalEarnings := totalEarnings + emp earnings.
].

((commandArgs at: 2) = 'total')
ifTrue: [
    Transcript show: 'Total payment is $', totalEarnings printString; cr.
].

eCount := 0.
    eThatFitCriteria do: [ :emp |
        eCount := eCount + 1.
    ].

((commandArgs at: 2) = 'count')
ifTrue: [
    Transcript show: 'There are ', eCount printString, ' employees'; cr.
].

((commandArgs at: 2) = 'avg')
ifTrue: [
    eAvg := totalEarnings asFloat / eCount asFloat.
    "Transcript show: totalEarnings asString; cr.
    Transcript show: eCount asString; cr."
    Transcript show: 'Average payment per employee is $', ((totalEarnings asFloat / eCount asFloat) roundTo: 0.01) asString; cr.
].

((commandArgs at: 2) = 'max')
ifTrue: [
    max := 0.
    eThatFitCriteria do: [ :emp |
        ((emp earnings) > max)
        ifTrue: [ max := emp earnings. ].
    ].
    Transcript show: 'Maximum payment is $', (max printString); cr.
].

((commandArgs at: 2) = 'min')
ifTrue: [
    min := 100000000.
    eThatFitCriteria do: [ :emp |
        ((emp earnings) < min)
        ifTrue: [ min := emp earnings. ].
    ].
    Transcript show: 'Minimum payment is $', (min printString); cr.
].