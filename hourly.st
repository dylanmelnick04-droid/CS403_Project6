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
    | base mid overtime |

    hours <= 40 ifTrue: [
        ^ rate * hours
    ].

    hours <= 50 ifTrue: [
        base := 40 * rate.
        mid := (hours - 40) * rate * 1.5.
        ^ base + mid
    ].

    hours <= 60 ifTrue: [
        base := 40 * rate.
        mid := 10 * rate * 1.5.
        overtime := (hours - 50) * rate * 2.
        ^ base + mid + overtime
    ].

    base := 40 * rate.
    mid := 10 * rate * 1.5.
    overtime := (hours - 50) * rate * 2.
    ^ base + mid + overtime.
!

!HourlyEmployee methodsFor: 'printing'!
asString
    ^ 'Hourly employee: ', (super asString),
    '
hours worked: ', (self formatMoney: hours), ', hourly rate: ', (self formatMoney: rate),
    '
earned: $', (self formatMoney: self earnings).
!

!printNl.!