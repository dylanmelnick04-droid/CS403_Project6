"Employee.st"

Object subclass: #Employee
    instanceVariableNames: 'firstName lastName'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Payroll'.
!

!Employee methodsFor: 'accessing'!
firstName: aString
    firstName := aString.
!

firstName
    ^ firstName.
!

lastName: aString
    lastName := aString.
!

lastName
    ^ lastName.
!

!Employee methodsFor: 'polymorphic'!
getEarning
    "Abstract method - to be overridden by subclasses"
    self subclassResponsibility.
!

getInfo
    ^ firstName , ' ' , lastName.
!