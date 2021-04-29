Class {
	#name : #TestUser,
	#superclass : #TestCase,
	#instVars : [
		'u1',
		'u2',
		'u3',
		't1',
		't2',
		't3',
		'q1',
		'q2',
		'sis'
	],
	#category : #'OO2 Tp1-test'
}

{ #category : #running }
TestUser >> setUp [
	| ord1 ord2 aux |
	sis := CuOOra new.
	u1 := User newUsername: 'pedro@cuoora.com' password: 'asd'.
	u2 := User newUsername: 'diego@cuoora.com' password: 'asd'.
	u3 := User newUsername: 'juan@cuoora.com' password: 'asd'.
	sis addUser: u1.
	sis addUser: u2.
	sis addUser: u3.
	u3 addFollowing: u2.
	u1 addFollowing: u3.
	ord1 := OrderedCollection new.
	t1 := Topic newName: 'OO1' description: 'Orientacion a Objetos 1'.
	t2 := Topic
		newName: 'Test de unidad'
		description: 'Testeo de programas'.
	ord1 add: t1.
	ord1 add: t2.
	sis addTopicList: ord1.
	ord2 := OrderedCollection new.
	t3 := Topic
		newName: 'Smalltalk'
		description: 'Lenguaje de Programacion'.
	ord2 add: t1.
	ord2 add: t3.
	aux := OrderedCollection new.
	aux add: t3.
	sis addTopicList: aux.
	q1 := Question
		newAuthor: u1
		text:
			'Necesito aprender a hacer test pero no entiendo para q sirve este metodo.'
		title: '¿Para qué sirve el método SetUp?'
		topics: ord1.
	q2 := Question
		newAuthor: u2
		text: 'Tengo este error y necesito ayuda.'
		title: '¿Qué significa #messageNotUnderstood?'
		topics: ord2.
	sis addQuestionToSistem: q1.
	sis addQuestionToSistem: q2.
	u2 addInterestTopic: t1.
]

{ #category : #tests }
TestUser >> testAddFollowing [
self assert:u1 following size equals:1.
self assert:(u1 following anySatisfy:[:user|user == u3]). 
]

{ #category : #tests }
TestUser >> testAddInterestingTopics [
|aTopic|
aTopic:=Topic newName: 'vacaciones' description:''. 
self assert: ( u1 interestTopics isEmpty) .
u1 addInterestTopic:aTopic. 
self assert:u1 interestTopics size equals:1.
self assert:(u1 interestTopics anySatisfy:[:topic|topic == aTopic]). 
]

{ #category : #tests }
TestUser >> testGetRelevantQuestions [
self assert:((u2 getRelevantQuestions)includes: q1).
self deny: (( u2 getRelevantQuestions)includes: q2).

]

{ #category : #tests }
TestUser >> testIsFollowing [
self assert:(u1 isFollowing: u3).
self deny:(u1 isFollowing: u2).
self assert:(u1 isFollowing: u1).

]

{ #category : #tests }
TestUser >> testIsThisUsername [
self assert:(u1 isThisUsername: 'pedro@cuoora.com' password: 'asd' ).
self deny:(u2 isThisUsername:'diego@cuoora.com' password: 'dsa').
self deny:(u3 isThisUsername:'juan@cuoora.com' password: 'dsa').
]

{ #category : #tests }
TestUser >> testRemoveFollowing [
u1 addFollowing: u2.
self assert:(u1 following anySatisfy:[:user|user == u2]). 
u1 removeFollowing: u2.
self deny:(u1 following anySatisfy:[:user|user == u2]). 

]
