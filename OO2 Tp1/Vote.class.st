Class {
	#name : #Vote,
	#superclass : #Object,
	#instVars : [
		'date',
		'value',
		'belongsTo'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #initialization }
Vote class >> newBelongsTo: aUser value: aValue [
	^self new belongsTo: aUser value: aValue
]

{ #category : #accessing }
Vote >> belongsTo [
^belongsTo
]

{ #category : #initialization }
Vote >> belongsTo: anUser value: aValue [
	value:= aValue .
	belongsTo := anUser
]

{ #category : #accessing }
Vote >> date [
^date
]

{ #category : #initialization }
Vote >> initialize [ 
	date := DateAndTime today.
]

{ #category : #accessing }
Vote >> value [ 
^value
]
