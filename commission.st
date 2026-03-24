Employee subclass: #CommissionedEmployee
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Employees'.

!CommissionedEmployee methodsFor: 'initialization'!
initializeWithFirst: aFirst last: aLast rate: aRate hours: aHours commissionMinimum: aCommissionMinimum 
    super initializeWithFirst: aFirst last: aLast rate: aRate hours: aHours commissionMinimum: aCommissionMinimum.
!

!CommissionedEmployee methodsFor: 'payroll'!
earnings
    ^ ((rate * hours) <= commissionMinimum)
        ifTrue: [ ^ commissionMinimum ]
        ifFalse: [ ^ rate * hours ].
!

!CommissionedEmployee methodsFor: 'printing'!
asString
    ^ 'Commissioned employee: ', (super asString),
    '
minimum salary: ', (commissionMinimum asFloat roundTo: 0.01) printString, ', sales amount: ', (hours asFloat roundTo: 0.01) printString, ', commission rate: ', (rate asFloat roundTo: 0.01) printString,
    '%
earned: $', (self earnings asFloat roundTo: 0.01) printString.
!

!printNl.!