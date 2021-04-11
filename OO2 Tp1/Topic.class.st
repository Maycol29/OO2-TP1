Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'questions'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #initialization }
Topic class >> newName:aName [ "description:aDescription"

 ^self new name:aName "description:aDescription".
]

{ #category : #initialization }
Topic class >> newName:aName description:aDescription [

 ^self new name:aName description:aDescription.
]

{ #category : #accessing }
Topic >> addQuestion: aQuestion [
	questions add: aQuestion
]

{ #category : #accessing }
Topic >> answersInTopicBy:aUser [ 
^questions select: [:each | each answersBy:aUser ].
]

{ #category : #accessing }
Topic >> description [
^description
]

{ #category : #accessing }
Topic >> getPosts:aCollection [
^questions reject:[:quest | quest author includes: aCollection]
]

{ #category : #initialization }
Topic >> initialize [ 
	questions:=OrderedCollection new.
]

{ #category : #accessing }
Topic >> name [ 
^name
]

{ #category : #accessing }
Topic >> name:aName [ 
name:=aName.
]

{ #category : #initialization }
Topic >> name:aName description:aDescription [
name:=aName.
description:=aDescription.

]

{ #category : #accessing }
Topic >> questions [
^questions

]

{ #category : #accessing }
Topic >> questionsInTopicBy:aUser [ 
^questions select:[:each | each author == aUser username ]
]

{ #category : #accessing }
Topic >> scoreOf:aUser [
|scoreQ scoreA scoreV|
scoreQ:=(self questionsInTopicBy:aUser)size * 20. 
scoreA:=(self answersInTopicBy:aUser)size * 50 .
scoreV :=  (self scoreOfTheAnswersBy:aUser) + (self scoreOfTheAnswersBy: aUser).
^(scoreA+scoreQ+scoreV) 
]

{ #category : #accessing }
Topic >> scoreOfTheAnswersBy:aUser [
^questions sumNumbers: [:each | each scoreAnswersBy:aUser ].
]

{ #category : #accessing }
Topic >> scoreOfTheQuestionsBy:aUser [
^questions sumNumbers:[:each | each score ]
]
