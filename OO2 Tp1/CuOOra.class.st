Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'users',
		'topics'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #'instance creation' }
CuOOra class >> clearSoleInstance [
soleInstance:=nil.

]

{ #category : #'instance creation' }
CuOOra class >> soleInstance [
^soleInstance ifNil:[soleInstance:=self new].

]

{ #category : #'instance creation' }
CuOOra class >> soleInstanceWithExample [
soleInstance:=self new example.
]

{ #category : #adding }
CuOOra >> addQuestionToSistem: aQuestion [
	(aQuestion topics) do: [ :topic | topic addQuestion: aQuestion ]
]

{ #category : #adding }
CuOOra >> addTopicList:aTopics [
topics addAll:aTopics.

]

{ #category : #accessing }
CuOOra >> addUser:aUser [
users add:aUser.

]

{ #category : #accessing }
CuOOra >> answersBy: aUser [
	^ (((topics
		flatCollect: [ :topic | topic answersInTopicBy: aUser ]) asSet)
		asSortedCollection: [ :a :b | a score > b score ])
]

{ #category : #adding }
CuOOra >> createTopics: topicNames [
	|  topicExist topicList |
	topicExist:= OrderedCollection new.
	topicList := OrderedCollection new.
	(topicNames
	do:[ :N | 
			topics
				detect: [ :each | each isThisTopic:N ]
				ifFound:[:it | topicExist add: it ]
				ifNone: [ topicList add: (Topic newName: N description:'') ] ]).
	self addTopicList:topicList .
	topicList addAll:topicExist.
	^topicList
]

{ #category : #accessing }
CuOOra >> deleteQuestion: aQuestion [
	aQuestion topics do: [ :each | each removeQuestion: aQuestion ].
	aQuestion cleanTheQuestion
]

{ #category : #example }
CuOOra >> example [ 
| u1 u2 u3 q1 q2 a1 a2 ord1 ord2|
u1:=User newUsername: 'pedro@cuoora.com' password:'asd'.
u2:=User newUsername: 'diego@cuoora.com' password:'asd'.
u3:=User newUsername: 'juan@cuoora.com' password:'asd'.
self addUser: u1.
self addUser: u2.
self addUser: u3.
u3 addFollowing: u2.
u1 addFollowing: u3.
ord1 :=OrderedCollection new.
ord2:=OrderedCollection new.
ord1 add:'OO1'.
ord1 add:'Test de unidad'.
ord2 add:'OO1'.
ord2 add:'Smalltalk'.
q1:=Question newAuthor: u1 text:'Necesito aprender a hacer test pero no entiendo para q sirve este metodo.'  title: '¿Para qué sirve el método SetUp?'  topics: (self createTopics: ord1).
q2:=Question newAuthor: u2 text:'Tengo este error y necesito ayuda.'  title: '¿Qué significa #messageNotUnderstood?'  topics: (self createTopics: ord2).
a1 :=Answer newAuthor: u2 text:' Sirve para instanciar los objetos que son
evaluados por el test en un único método y que se ejecute
siempre antes de cada test.'. 
a2 :=Answer newAuthor: u1 text:' Significa que el objeto que recibió el mensaje
no encontró ningún método para ejecutar en respuesta.'. 
self addQuestionToSistem: q1.
self addQuestionToSistem: q2.
q1 addAnswer: a1.
q2 addAnswer: a2.
]

{ #category : #accessing }
CuOOra >> getTopicQuestions: aTopic [
	^ aTopic questions
]

{ #category : #utility }
CuOOra >> getUsersQuestions: aUserList [
^(aUserList flatCollect:[:user| self questionsBy: user]) 
]

{ #category : #initialize }
CuOOra >> initialize [
users:=OrderedCollection new.
topics:=OrderedCollection new.

]

{ #category : #accessing }
CuOOra >> latestPostInNetwork: aUserList user: aUser [
	| allQuestions |
	allQuestions := OrderedCollection new.
	allQuestions addAll: (self getUsersQuestions: aUserList).	"post de amigos"
	allQuestions addAll: (aUser getRelevantQuestions). "post de interes propios"
	^ (allQuestions asSet asSortedCollection: [ :a :b | a date > b date ])
		takeFirst: 5
]

{ #category : #accessing }
CuOOra >> questionsBy: aUser [
	^ (topics flatCollect: [ :topic | topic questionsInTopicBy: aUser ])
		asSet asSortedCollection: [ :a :b | a score > b score ]
]

{ #category : #accessing }
CuOOra >> scoreA: aUser [
	^(self answersBy:aUser) size * 50.
]

{ #category : #accessing }
CuOOra >> scoreQ: aUser [
	^ (self questionsBy: aUser) size * 20
]

{ #category : #accessing }
CuOOra >> scoreV: aUser [
	^ (topics sumNumbers: [ :each | each scoreOfTheAnswersBy: aUser ])
		+ (topics sumNumbers: [ :each | each scoreOfTheQuestionsBy: aUser ])
]

{ #category : #accessing }
CuOOra >> topics [
^topics

]

{ #category : #accessing }
CuOOra >> totalScoreOf: aUser [
	^ (self scoreA: aUser) + (self scoreQ: aUser) + (self scoreV: aUser)
]

{ #category : #accessing }
CuOOra >> userWithUsername: anUsername protectedBy: aPassword [
	^ users
		detect: [ :each | each isThisUsername: anUsername password:aPassword  ]
		ifNone: [ nil ]
]

{ #category : #accessing }
CuOOra >> users [
^users

]

{ #category : #accessing }
CuOOra >> usersMatchingNamePart: aString [
	^ users
		select:
			[ :each | each usernameWith:aString ]
]
