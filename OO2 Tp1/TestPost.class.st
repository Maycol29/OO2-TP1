Class {
	#name : #TestPost,
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
		'q3',
		'a1',
		'a2',
		'a3',
		'v1',
		'v2',
		'v3'
	],
	#category : #'OO2 Tp1-test'
}

{ #category : #running }
TestPost >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	|topics|
	u1 := User newUsername: 'tobias' password: 1234.
	u2 := User newUsername: 'lucio' password: 4321.
	u3 := User newUsername: 'luna' password: 'asdf'.
	
	t1 := Topic newName: 'programacion' description:''.
	t2 := Topic newName: 'Covid 19' description:''.
	t3 := Topic newName: 'Vacaciones' description:''.
	
	topics := OrderedCollection new.
	topics add: t2.
	topics add: t3.
	
	q1 := Question
		newAuthor: u1
		text: 'Como programar mejor en ruby?'
		title: 'Como mejorar la programacion en ruby?'
		topics: (t1) asOrderedCollection  .
	q2 := Question
		newAuthor: u2
		text: 'Tengo esta duda ya que quiero ir en temporada alta'
		title: 'Cuando son vacaciones en EEUU?'
		topics: (t3) asOrderedCollection.
	q3 := Question
		newAuthor: u3
		text: 'Quiero irme de vacaciones y necesito saber el estado del lugar'
		title: 'Como esta el estado del covid en Francia?'
		topics: topics.
	a1:=Answer newAuthor:u1   text: 'Esta complicada la cosa en francia'.
	a2:=Answer newAuthor:u2  text:'La temporada alta es en nuestras vacaciones de invierno si no me equivoco'.
	a3:=Answer newAuthor:u3 text:'Ruby es un lenguaje complejo pero te recomiendo q leas la documentancion de francis drake'.
	v1:=Vote newBelongsTo: u1 value: true.
	v2:=Vote newBelongsTo: u2 value: false.
	v3:=Vote newBelongsTo: u3 value: false.

]

{ #category : #tests }
TestPost >> testAddVote [
self assert: ( q1 votes isEmpty) .
self assert: ( a1 votes isEmpty) .
q1 addVote:v1.
a1 addVote:v2. 
self assert:a1 votes  size equals:1.
self assert:q1 votes  size equals:1.
self assert:((q1 votes ) anySatisfy:[:vote|vote == v1]). 
self assert:((a1 votes ) anySatisfy:[:vote|vote == v2]).
q1 addVote: v1 .
self assert:((q1 votes ) anySatisfy:[:vote|vote == v1]). 

]

{ #category : #tests }
TestPost >> testNegativeScore [
q1 addVote: v1.
q1 addVote:v2.
q1 addVote:v3.
self assert:(q1 negativeScore) = 2.
]

{ #category : #tests }
TestPost >> testPositiveScore [
q1 addVote: v1.
q1 addVote:v2.
q1 addVote:v3.
self assert:[(q1 positiveScore) = 1].
]

{ #category : #tests }
TestPost >> testScore [
q1 addVote: v1.
q1 addVote:v2.
q1 addVote:v3.
self assert:(q1 score) =(-1).
]
