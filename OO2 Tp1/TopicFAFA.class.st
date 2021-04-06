Class {
	#name : #TopicFAFA,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'questions'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #initialization }
TopicFAFA class >> newName:aName description:aDescription [

 ^self new name:aName description:aDescription.
]

{ #category : #accessing }
TopicFAFA >> addQuestion:aQuestion [
questions add:aQuestion
]

{ #category : #accessing }
TopicFAFA >> answersInTopicBy:aUser [ 
^questions select: [:each | each answersBy:aUser ].
]

{ #category : #accessing }
TopicFAFA >> description [
^description
]

{ #category : #initialization }
TopicFAFA >> initialize [ 
	questions:=OrderedCollection new.
]

{ #category : #accessing }
TopicFAFA >> mostInteresting:aUser [
^(self questionsInTopicBy:aUser size) + (self answersInTopicBy:aUser size).
]

{ #category : #initialization }
TopicFAFA >> name:aName description:aDescription [
name:=aName.
description:=aDescription.

]

{ #category : #accessing }
TopicFAFA >> questions [
^questions

]

{ #category : #accessing }
TopicFAFA >> questionsInTopicBy:aUser [ 
^questions select:[:each | each author == aUser username ]
]
