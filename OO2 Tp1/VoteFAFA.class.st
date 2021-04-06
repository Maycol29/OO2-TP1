Class {
	#name : #VoteFAFA,
	#superclass : #Object,
	#instVars : [
		'date',
		'value',
		'author'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #initialization }
VoteFAFA class >> newUser: anUser date: aDate value: aValue [
	^self new user: anUser date: aDate value: aValue
]

{ #category : #initialization }
VoteFAFA >> initialize [ 
	date := DateAndTime today.
]

{ #category : #initialization }
VoteFAFA >> user: anUser date: aDate value: aValue [
	date := aDate.
	value := aValue .
	author := anUser
]

{ #category : #accessing }
VoteFAFA >> value [
^value
]
