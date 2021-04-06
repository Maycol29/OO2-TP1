Class {
	#name : #Post,
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
Post class >> newAuthor: aUser text: aString date: aDateAndTime [

^self new author: aUser text: aString date: aDateAndTime.
]

{ #category : #accessing }
Post >> addVote: aVote [
	(votes detect: [ :vote | vote user = aVote user ])
		ifNotNil: [ :it | votes remove: it ].
	votes add: aVote
]

{ #category : #accessing }
Post >> author [ 
^author
]

{ #category : #initialization }
Post >> author: aUser text: aString date: aDateAndTime [
	author := aUser.
	date := aDateAndTime
]

{ #category : #accessing }
Post >> date [ 
^date
]

{ #category : #initialization }
Post >> initialize [ 
	date := DateAndTime today.
	votes := Set new.
]

{ #category : #accessing }
Post >> negativeScore [ 
	^votes size - (self positiveScore).
]

{ #category : #accessing }
Post >> positiveScore [
	^votes select: [:vote| (vote value)]
]

{ #category : #accessing }
Post >> score [ 
	^(self positiveScore - self negativeScore). 
]

{ #category : #accessing }
Post >> text [
^text

]

{ #category : #accessing }
Post >> votes [
^votes
]
