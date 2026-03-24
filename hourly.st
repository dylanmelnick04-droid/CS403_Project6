Employee subclass: #HourlyEmployee
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Employees'.

!HourlyEmployee methodsFor: 'formatting'!
formatMoney: aNumber
    | e dollars cents |
    
    e := ((aNumber asFloat * 100) rounded) / 100.
    dollars := e truncated.
    cents := ((e - dollars) * 100) asInteger.

    ^ dollars printString, '.', ((cents < 10) ifTrue: ['0'] ifFalse: ['']), cents printString.
!

!HourlyEmployee methodsFor: 'initialization'!
initializeWithFirst: aFirst last: aLast rate: aRate hours: aHours commissionMinimum: aCommissionMinimum
    super initializeWithFirst: aFirst last: aLast rate: aRate hours: aHours commissionMinimum: aCommissionMinimum.
!

!HourlyEmployee methodsFor: 'payroll'!
earnings
    ^ rate * hours.
!

!HourlyEmployee methodsFor: 'printing'!
asString
    ^ 'Hourly employee: ', (super asString),
    '
hours worked: ', (self formatMoney: hours), ', hourly rate: ', (self formatMoney: rate),
    '
earned: $', (self formatMoney: self earnings) printString.
!

!printNl.!