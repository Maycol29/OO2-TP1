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
Topic class >> newName:aName description:aDescription [

 ^self new name:aName description:aDescription.
]

{ #category : #accessing }
Topic >> addQuestion:aQuestion [
questions add:aQuestion
]

{ #category : #accessing }
Topic >> answersInTopicBy:aUser [ 
^questions select: [:each | each answersBy:aUser ].
]

{ #category : #accessing }
Topic >> description [
^description
]

{ #category : #initialization }
Topic >> initialize [ 
	questions:=OrderedCollection new.
]

{ #category : #accessing }
Topic >> mostInteresting:aUser [
^(self questionsInTopicBy:aUser size) + (self answersInTopicBy:aUser size).
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
