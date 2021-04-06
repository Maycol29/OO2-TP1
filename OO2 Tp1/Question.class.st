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
Question class >> newAuthor: aUser text: aString date: aDateAndTime Title:aTiple [
|instancePost|
instancePost :=self newAuthor: aUser text: aString date: aDateAndTime.
instancePost title:aTiple.
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
^answers select:[:each | each author == aUser username ]
]

{ #category : #initialization }
Question >> initialize [ 
	super initialize.
	answers := OrderedCollection new.
	topics  := Set new.
]

{ #category : #acccessing }
Question >> orderedAnswers [
	^ answers asSortedCollection: [:answer1 :answer2 |  answer1 score  <= answer2 score]
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
Question >> title:aTitle [
title:=aTitle
]

{ #category : #acccessing }
Question >> topics [
^topics
]
