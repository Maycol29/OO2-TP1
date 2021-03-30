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

{ #category : #'instance creation' }
Topic class >> newName:aName description:aDescription [
|instance|
instance :=self new.
instance name:aName description:aDescription.

]

{ #category : #accessing }
Topic >> addQuestion:aQuestion [
questions add:aQuestion

]

{ #category : #accessing }
Topic >> answersInTopic:aUser [ 
^questions sumNumbers:[:each | each answersBy:aUser ].
]

{ #category : #accessing }
Topic >> deleteQuestion:aQuestion [
(aQuestion questionTopics)do:[:each | each questions remove:aQuestion].
aQuestion answers removeAll.
aQuestion votes removeAll.
]

{ #category : #accessing }
Topic >> description [
^description



]

{ #category : #accessing }
Topic >> mostInteresting:aUser [
^(self questionsInTopic:aUser size) + (self answersInTopic:aUser size).
]

{ #category : #accessing }
Topic >> name [
^name



]

{ #category : #initalize }
Topic >> name:aName description:aDescription [
name:=aName.
description:=aDescription.
questions:=OrderedCollection new.

]

{ #category : #accessing }
Topic >> questions [
^questions


]

{ #category : #accessing }
Topic >> questionsInTopic:aUser [ 
^questions select:[:each | each author == aUser username ]
]
