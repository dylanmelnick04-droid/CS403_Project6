Employee subclass: #SalariedEmployee
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Employees'.

!SalariedEmployee methodsFor: 'formatting'!
formatMoney: aNumber
    | e dollars cents |
    
    e := ((aNumber asFloat * 100) rounded) / 100.
    dollars := e truncated.
    cents := ((e - dollars) * 100) asInteger.

    ^ dollars printString, '.', ((cents < 10) ifTrue: ['0'] ifFalse: ['']), cents printString.
!

!SalariedEmployee methodsFor: 'initialization'!
initializeWithFirst: aFirst last: aLast rate: aRate hours: aHours commissionMinimum: aCommissionMinimum
    super initializeWithFirst: aFirst last: aLast rate: aRate hours: aHours commissionMinimum: aCommissionMinimum.
!

!SalariedEmployee methodsFor: 'payroll'!
earnings
    ^ rate asFloat.
!

!SalariedEmployee methodsFor: 'printing'!
asString
    ^ 'Salaried employee: ', (super asString),
    '
weekly salary: ', (self formatMoney: self earnings),
    '
earned: $', (self formatMoney: self earnings).
!

!printNl.!