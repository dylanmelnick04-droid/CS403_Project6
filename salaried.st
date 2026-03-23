Employee subclass: #SalariedEmployee
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Employees'.

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
weekly salary: ', (self earnings asFloat roundTo: 0.01) printString,
    '
earned: $', (self earnings asFloat roundTo: 0.01) printString.
!