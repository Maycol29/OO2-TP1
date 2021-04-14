Class {
	#name : #Question,
	#superclass : #Post,
	#instVars : [
		'title',
		'answers',
		'topics'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #'instance creation' }
Question class >> newAuthor: aUser text: aString title:aTiple topics:anOrderedCollection [
|instancePost|
instancePost :=self newAuthor: aUser text: aString.
instancePost title:aTiple topics: anOrderedCollection .
^instancePost
]

{ #category : #adding }
Question >> addAnswer:anAnswer [
answers add: anAnswer .
]

{ #category : #acccessing }
Question >> answers [ 
^answers
]

{ #category : #acccessing }
Question >> answersBy:aUser [ 
^answers select:[:each | each author == aUser  ]
]

{ #category : #acccessing }
Question >> cantAnswers [
^answers size.
]

{ #category : #acccessing }
Question >> deleteAnswersVotes [
	answers do: [:answer| answer deleteAllVotes ]



]

{ #category : #initialization }
Question >> initialize [ 
	super initialize.
	answers := OrderedCollection new.
	topics  := OrderedCollection new.
]

{ #category : #acccessing }
Question >> orderedAnswers [
	^ answers asSortedCollection: [:answer1 :answer2 |  answer1 score  >= answer2 score]
]

{ #category : #acccessing }
Question >> scoreAnswersBy:aUser [
^answers sumNumbers:[:each | each score ]
]

{ #category : #acccessing }
Question >> title [
^title
]

{ #category : #acccessing }
Question >> title:aTitle topics:anOrderedCollection [
title:=aTitle.
topics addAll:anOrderedCollection.
]

{ #category : #acccessing }
Question >> topics [
^topics
]
