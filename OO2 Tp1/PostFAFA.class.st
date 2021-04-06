Class {
	#name : #PostFAFA,
	#superclass : #Object,
	#instVars : [
		'author',
		'date',
		'text',
		'votes'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #initialization }
PostFAFA class >> newAuthor: aUser date: aDateAndTime [

^self new author: aUser date: aDateAndTime.
]

{ #category : #initialization }
PostFAFA class >> newAuthor: aUser text: aString date: aDateAndTime [

^self new author: aUser text: aString date: aDateAndTime.
]

{ #category : #accessing }
PostFAFA >> addVote: aVote [
	(votes detect: [ :vote | vote user = aVote user ])
		ifNotNil: [ :it | votes remove: it ].
	votes add: aVote
]

{ #category : #accessing }
PostFAFA >> author [ 
^author
]

{ #category : #initialization }
PostFAFA >> author: aUser text: aString date: aDateAndTime [
	author := aUser.
	date := aDateAndTime
]

{ #category : #accessing }
PostFAFA >> date [ 
^date
]

{ #category : #initialization }
PostFAFA >> initialize [ 
	date := DateAndTime today.
	votes := Set new.
]

{ #category : #accessing }
PostFAFA >> votes [
^votes
]
