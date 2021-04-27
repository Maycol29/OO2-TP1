Class {
	#name : #TestCuOOra,
	#superclass : #TestCase,
	#instVars : [
		'sis',
		'u1',
		'u2',
		'u3',
		'u4',
		't1',
		't2',
		't3',
		't4',
		't5',
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
	a1 := Answer
		newAuthor: u2
		text:
			' Sirve para instanciar los objetos que son
evaluados por el test en un único método y que se ejecute
siempre antes de cada test.'.
	a2 := Answer
		newAuthor: u1
		text:
			' Significa que el objeto que recibió el mensaje
no encontró ningún método para ejecutar en respuesta.'.
	sis addQuestionToSistem: q1.
	sis addQuestionToSistem: q2.
	q1 addAnswer: a1.
	q2 addAnswer: a2.
	v1 := Vote newBelongsTo: u2 value: true.
	v2 := Vote newBelongsTo: u1 value: true.
	q1 addVote: v1.
	a1 addVote: v2.

	"------------------------------"
	q3 := Question
		newAuthor: u3
		text: 'text'
		title: 'title'
		topics: ord1.
	t4 := Topic newName: 'OO2' description: 'Orientacion a Objetos 2'.
	t5 := Topic
		newName: 'CADP'
		description: 'Conceptos de Algoritmos Datos y Programas'.
		
	u4 := User newUsername: 'Osbourne' password:'CrazyTrain'.
	 
]

{ #category : #tests }
TestCuOOra >> testAddQuestionToSistem [
	self deny: sis topics isEmpty.
	self assert: t1 questions size equals: 2.
	self assert: t2 questions size equals: 1.
	self deny: (t1 questions includes: q3).
	self deny: (t2 questions includes: q3).
	sis addQuestionToSistem: q3.
	self assert: t1 questions size equals: 3.
	self assert: t2 questions size equals: 2.
	self assert: (t1 questions includes: q3).
	self assert: (t2 questions includes: q3).
]

{ #category : #tests }
TestCuOOra >> testAddTopicList [
	| ord |
	ord := OrderedCollection new.
	self assert: sis topics size equals: 3.
	self deny: (sis topics includes: t4).
	self deny: (sis topics includes: t5).
	ord add: t4.
	ord add: t5.
	sis addTopicList: ord.
	self assert: sis topics size equals: 5.
	self assert: (sis topics includes: t4).
	self assert:	 (sis topics includes: t5).
]

{ #category : #acccessing }
TestCuOOra >> testAddUser [ 
self deny: (sis users isEmpty) .
self assert:sis users size equals:3.
self deny:(sis users includes: u4). 
sis addUser:u4. 
self assert:sis users size equals:4.
self assert:(sis users includes: u4). 
]

{ #category : #tests }
TestCuOOra >> testAnswersBy [
|topicList collection|
	topicList := OrderedCollection new.	"Crea una lista de Topic y los agrega en sistema"
	topicList add: t1.
	sis addTopicList: topicList.
	
	t1 addQuestion: q2.	"Agrega las Question a un Topic existente en CuOOra"
	t1 addQuestion: q3.
	
	
	q2 addAnswer:a1.
	q2 addAnswer:a3.
		
	self assert:((sis answersBy:u1)includes:a1).
	self deny:((sis answersBy:u1)includes:a3).
	self assert: (sis answersBy: u2) isEmpty.

]

{ #category : #tests }
TestCuOOra >> testCreateTopics [
	|string|
	string:= 'Tecnologia,programacion,pc'.
	sis addTopicList:(sis createTopics: (string findTokens: ',')). "Ingreso una Collection de Strings"
	
	self assert: (sis topics anySatisfy: [:topic| topic name = 'programacion' ]) .
		
	self assert: (sis topics anySatisfy: [:topic| topic name = 'pc' ]) .
	
	self assert: (sis topics anySatisfy: [:topic| topic name = 'Tecnologia' ]) .
	
	self deny: (sis topics anySatisfy: [:topic| topic name = 'cocina' ]) .


]

{ #category : #tests }
TestCuOOra >> testDeleteQuestion [
	| topicList collection |
	topicList := OrderedCollection new.	"Crea una lista de Topic y los agrega en sistema"
	topicList add: t2. "Covid 19"
	topicList add: t3. "Vacaciones"
	sis addTopicList: topicList.	
		
	t2 addQuestion: q3. 	"Topic 'Covid 19' tiene solo una Question"					
	t3 addQuestion: q3.	"Topic Vacaciones tiene dos Question"
	t3 addQuestion: q2.
	
	collection := OrderedCollection new. "Collection con solo q2(relacionada con 'Vacaciones')"
	collection add: q2.
	
	sis deleteQuestion: q3 . 
	"Si elimino q3 (relacionada con 'Covid 19' y 'Vacaciones' ), el Topic 'Vacaciones' debería tener solo q2"
	self assertCollection: (t3 questions ) equals: collection . 
	
	"Si elimino q3, el Topic 'Covid 19' no deberia tener ninguna Question"
	self assert: (t2 questions ) isEmpty 
	
	
	
	
	
	
]

{ #category : #acccessing }
TestCuOOra >> testGetRelevantQuestionOf [
|topicList|
topicList := OrderedCollection new.
topicList add: t1.
topicList add: t2.

u1 interestTopics: topicList .

self assert: [( sis getRelevantQuestionOf: u1 ) includes: q2]






]

{ #category : #tests }
TestCuOOra >> testGetTopicQuestions [
	|collection |
	collection := OrderedCollection new.	"Creo la coleccion esperada"
	collection add: q1.
	collection add: q2.
	
	self assertCollection: (sis getTopicQuestions: t1) equals: collection.
	
	self assert: ((sis getTopicQuestions: t2)size=1)
]

{ #category : #acccessing }
TestCuOOra >> testGetUsersQuestions [
|following|
following:=OrderedCollection new.
following add:u2.
following add:u1.

self assert:((sis getUsersQuestions:following)includes:q1).
self assert:((sis getUsersQuestions:following)includes:q2).
self deny:((sis getUsersQuestions:following)includes:q3).




]

{ #category : #acccessing }
TestCuOOra >> testLatestPostInNetwork [
|topicList|
topicList := OrderedCollection new.
topicList add: t1.
topicList add: t2.
topicList add: t3.

t1 addQuestion: q2.

u1 interestTopics: topicList .

self assert:(sis equals: q1)


]

{ #category : #tests }
TestCuOOra >> testQuestionsBy [
	self assert:((sis questionsBy:u2)includes:q2).
	self deny:((sis questionsBy:u2)includes:q1).
	self assert: (sis questionsBy: u3) isEmpty.
	

	
	
	
]

{ #category : #acccessing }
TestCuOOra >> testTotalScoreOf [

self assert:((sis totalScoreOf:u1 )= 72).
self assert:((sis totalScoreOf:u3 )= 0).

]

{ #category : #tests }
TestCuOOra >> testUserWithUsernameProtectedBy [
self assert: (sis userWithUsername: 'diego@cuoora.com' protectedBy: 'asd') equals: u2.

self deny: (sis userWithUsername: 'pedro@cuoora.com' protectedBy: 'fdsa')  equals: u1.

self assert: (sis userWithUsername: 'gerardo' protectedBy: 'holaMundo') equals: nil.
]

{ #category : #acccessing }
TestCuOOra >> testUsersMatchingNamePart [
self assert: [(sis usersMatchingNamePart: 'e') includes: u1] .
self assert: [(sis usersMatchingNamePart: 'e') includes: u2] .
self deny: [(sis usersMatchingNamePart: 'e') includes: u3] .




]
