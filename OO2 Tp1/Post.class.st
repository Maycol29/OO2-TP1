Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'author',
		'text',
		'date',
		'votes'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #initialization }
Post class >> newAuthor: aUser text: aString [ 

^self new author: aUser text: aString.
]

{ #category : #accessing }
Post >> addVote: aVote [
	votes detect: [ :vote | vote belongsTo = aVote belongsTo ]
		ifFound: [ :it | votes remove: it].
	votes add: aVote
	
	
]

{ #category : #accessing }
Post >> author [ 
^author
]

{ #category : #initialization }
Post >> author: aUser text: aString [ 
	author := aUser.
	text:=aString
]

{ #category : #accessing }
Post >> date [ 
^date
]

{ #category : #initialization }
Post >> initialize [ 
	date := DateAndTime now.
	votes := OrderedCollection new.
]

{ #category : #testing }
Post >> isThisAuthor: aUser [
	^ author == aUser
]

{ #category : #accessing }
Post >> negativeScore [ 
	^(votes size - (self positiveScore)).
]

{ #category : #accessing }
Post >> positiveScore [
	^(votes select: [:vote| (vote value)])size
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
