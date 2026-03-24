Object subclass: #Employee
    instanceVariableNames: 'firstName lastName rate hours commissionMinimum'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Employees'.

!Employee methodsFor: 'initialization'!
initializeWithFirst: aFirst last: aLast rate: aRate hours: aHours commissionMinimum: aCommissionMinimum
    firstName := aFirst.
    lastName := aLast.
    rate := aRate.
    hours := aHours.
    commissionMinimum := aCommissionMinimum.
!

!Employee methodsFor: 'accessing'!
rate
    ^ rate.
!
hours
    ^ hours.
!
commissionMinimum
    ^ commissionMinimum.
!

!Employee methodsFor: 'printing'!
asString
    ^ firstName, ' ', lastName.
!

!Employee methodsFor: 'payroll'!
earnings
    self subclassResponsibility.
!

!printNl.!