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
TestCuOOra >> testAddQuestionToSystem [
]

{ #category : #tests }
TestCuOOra >> testAddTopicList [
]

{ #category : #acccessing }
TestCuOOra >> testAddUser [
]

{ #category : #acccessing }
TestCuOOra >> testAddUserToSystem:aUser [
]

{ #category : #tests }
TestCuOOra >> testAnswersBy [
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
