Employee subclass: #HourlyEmployee
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Employees'.

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
hours worked: ', (hours asFloat roundTo: 0.01) printString, ', hourly rate: ', (rate asFloat roundTo: 0.01) printString,
    '
earned: $', (self earnings asFloat roundTo: 0.01) printString.
!

!printNl.!