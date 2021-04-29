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
Question >> addQuestionToTopics [
	topics do: [ :topic | topic addQuestion: self ].
]

{ #category : #acccessing }
Question >> answers [ 
^answers
]

{ #category : #acccessing }
Question >> answersInQuestionBy:aUser [ 
^answers select:[:each | each isThisAuthor:aUser ]
]

{ #category : #acccessing }
Question >> cantAnswers [
^answers size.
]

{ #category : #acccessing }
Question >> cleanTheQuestion [
	topics do: [ :topic | topic removeQuestion: self ].
	self deleteAnswersVotes.
	answers removeAll.
	votes removeAll
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
Question >> scoreAnswersBy: aUser [
	^ ((self answersInQuestionBy: aUser) sumNumbers: [ :a | a score ])
		ifNil: [ ^ 0 ]
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
