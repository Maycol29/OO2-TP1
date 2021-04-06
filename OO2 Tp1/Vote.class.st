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
Vote class >> newBelongsTo: aUser date: aDate value: aValue [
	^self new belongsTo: aUser date: aDate value: aValue
]

{ #category : #initialization }
Vote >> belongsTo: anUser date: aDate value: aValue [
	date := aDate.
	value:= aValue .
	belongsTo := anUser
]

{ #category : #initialization }
Vote >> initialize [ 
	date := DateAndTime today.
]

{ #category : #accessing }
Vote >> value [ 
^value
]
