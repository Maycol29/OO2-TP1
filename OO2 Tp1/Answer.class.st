Class {
	#name : #Answer,
	#superclass : #Object,
	#instVars : [
		'text',
		'replyDate',
		'author',
		'votes'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #initialization }
Answer class >> newText: aText author: anUser [
	^ self new text: aText author: anUser
]

{ #category : #accessing }
Answer >> addVoteA:aVote [
votes add:aVote.
]

{ #category : #accessing }
Answer >> author [ 
^author
]

{ #category : #initialization }
Answer >> initialize [ 
	replyDate := DateAndTime today.
	votes := Set new.
	
]

{ #category : #initialization }
Answer >> text: aText author: anUser [ 
	text := aText.
	author := anUser
]
