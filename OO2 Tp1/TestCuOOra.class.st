Class {
	#name : #TestCuOOra,
	#superclass : #TestCase,
	#instVars : [
		'sis',
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
TestCuOOra >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	|topics|
	sis := CuOOra new.
	u1 := User newUsername: 'tobias' password: 1234.
	u2 := User newUsername: 'lucio' password: 4321.
	u3 := User newUsername: 'luna' password: 'asdf'.
	
	t1 := Topic newName: 'programacion'.
	t2 := Topic newName: 'Covid 19'.
	t3 := Topic newName: 'Vacaciones'.
	
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
	a2:=Answer newAuthor:u3  text:'La temporada alta es en nuestras vacaciones de invierno si no me equivoco'.
	a3:=Answer newAuthor:u2 text:'Ruby es un lenguaje complejo pero te recomiendo q leas la documentancion de francis drake'.
	v1:=Vote newBelongsTo: u1 value: true.
	v2:=Vote newBelongsTo: u2 value: false.
	v3:=Vote newBelongsTo: u3 value: false.
	 
]

{ #category : #tests }
TestCuOOra >> testAddQuestionToSistem [
self assert:sis topics isEmpty .
sis addTopicList: (q3 topics).
sis addQuestionToSistem: q3.
self assert:t2 questions size equals: 1.
self assert:t3 questions size equals: 1.
]

{ #category : #tests }
TestCuOOra >> testAddTopicList [
|ord|
ord:=OrderedCollection new.
self assert:sis topics isEmpty .
ord add:t1.
ord add:t2.
sis addTopicList:ord.
self assert: (sis topics) size equals: 2.
]

{ #category : #acccessing }
TestCuOOra >> testAddUser [ 
self assert: (sis users isEmpty) .
sis addUser:u1. 
self assert:sis users size equals:1.
]

{ #category : #tests }
TestCuOOra >> testAnswersBy [
|ord|
ord:=OrderedCollection new.
ord add:a1.
sis addUser:u1. 
sis addUser:u3. 
sis addTopicList: (q3 topics).
sis addTopicList: (q1 topics).
sis addQuestionToSistem: q1.
sis addQuestionToSistem: q3.
q3 addAnswer: a1.
self assert:(q3 answers) size equals:1.  

self assert:(sis answersBy:u1) equals:ord. 
"self deny:(sis answersBy:u1) equals:a3"
]

{ #category : #tests }
TestCuOOra >> testAnswersBy: aUser [
]

{ #category : #tests }
TestCuOOra >> testCreateTopics: topicNames [
]

{ #category : #tests }
TestCuOOra >> testDeleteQuestion [

	| topicList collection |
	topicList := OrderedCollection new.	"Crea una lista de Topic y los agrega en sistema"
	topicList add: t1.
	sis addTopicList: topicList.
	
	t1 addQuestion: q2.	"Agrega las Question a un Topic existente en CuOOra"
	t1 addQuestion: q3.
	
	collection := Set new.	"Creo la coleccion esperada"
	collection add: q2.
	
	
]

{ #category : #tests }
TestCuOOra >> testGetTopicQuestions [
	| topicList collection |
	topicList := OrderedCollection new.	"Crea una lista de Topic y los agrega en sistema"
	topicList add: t1.
	sis addTopicList: topicList.
	
	t1 addQuestion: q2.	"Agrega las Question a un Topic existente en CuOOra"
	t1 addQuestion: q3.
	
	collection := OrderedCollection new.	"Creo la coleccion esperada"
	collection add: q2.
	collection add: q3.
	
	self assertCollection: (sis getTopicQuestions: t1) equals: collection.
	
	self assert: (sis getTopicQuestions: t2) isEmpty
]

{ #category : #tests }
TestCuOOra >> testQuestionsBy [
	| topicList collection |
	topicList := OrderedCollection new.	"Crea una lista de Topic y los agrega en sistema"
	topicList add: t1.
	sis addTopicList: topicList.
	
	t1 addQuestion: q2.	"Agrega las Question a un Topic existente en CuOOra"
	t1 addQuestion: q3.
	
	collection := Set new.	"Creo la coleccion esperada"
	collection add: q2.
	
	self assertCollection: (sis questionsBy: u2) equals: collection.
	
	self denyCollection: (sis questionsBy: u1) equals: collection.
	
	self assert: (sis questionsBy: u1) isEmpty
	
]

{ #category : #acccessing }
TestCuOOra >> testTotalScoreOf:anUser [
]

{ #category : #tests }
TestCuOOra >> testUserWithUsernameProtectedBy [
sis addUser: u1 .
sis addUser: u2 .
sis addUser: u3 .

self assert: (sis userWithUsername: 'lucio' protectedBy: 4321) equals: u2.

self deny: (sis userWithUsername: 'lucio' protectedBy: 4321)  equals: u1.

self assert: (sis userWithUsername: 'gerardo' protectedBy: 'aguanteVelez') equals: nil.
]
