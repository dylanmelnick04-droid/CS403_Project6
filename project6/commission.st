Employee subclass: #CommissionedEmployee
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Employees'.

!CommissionedEmployee methodsFor: 'formatting'!
formatMoney: aNumber
    | e dollars cents |
    
    e := ((aNumber asFloat * 100) rounded) / 100.
    dollars := e truncated.
    cents := ((e - dollars) * 100) asInteger.

    ^ dollars printString, '.', ((cents < 10) ifTrue: ['0'] ifFalse: ['']), cents printString.
!

!CommissionedEmployee methodsFor: 'initialization'!
initializeWithFirst: aFirst last: aLast rate: aRate hours: aHours commissionMinimum: aCommissionMinimum 
    super initializeWithFirst: aFirst last: aLast rate: aRate hours: aHours commissionMinimum: aCommissionMinimum.
!

!CommissionedEmployee methodsFor: 'payroll'!
earnings
    ^ ((rate * hours) <= commissionMinimum)
        ifTrue: [ ^ commissionMinimum asFloat ]
        ifFalse: [ ^ rate asFloat * hours asFloat].
!

!CommissionedEmployee methodsFor: 'printing'!
asString
    ^ 'Commissioned employee: ', (super asString),
    '
minimum salary: ', (self formatMoney: commissionMinimum), ', sales amount: ', (self formatMoney: hours), ', commission rate: ', (self formatMoney: (rate * 100 asFloat)),
    '%
earned: $', (self formatMoney: self earnings).
!

!printNl.!