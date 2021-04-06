Class {
	#name : #Vote,
	#superclass : #Object,
	#instVars : [
		'date',
		'value',
		'author'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #initialization }
Vote class >> newUser: anUser date: aDate value: aValue [
	^self new user: anUser date: aDate value: aValue
]

{ #category : #initialization }
Vote >> initialize [ 
	date := DateAndTime today.
]

{ #category : #initialization }
Vote >> user: anUser date: aDate value: aValue [
	date := aDate.
	value := aValue .
	author := anUser
]

{ #category : #accessing }
Vote >> value [
^value
]
