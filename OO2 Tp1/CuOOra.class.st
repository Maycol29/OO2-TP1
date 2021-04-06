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

{ #category : #accessing }
CuOOra >> addTopic:aTopic [
topics add:aTopic.

]

{ #category : #accessing }
CuOOra >> addUser:aUser [
users add:aUser.

]

{ #category : #acccessing }
CuOOra >> answersBy: anUser [
	topics flatCollect: [ :topic | topic answersInTopicBy: anUser ]
]

{ #category : #accessing }
CuOOra >> deleteQuestion:aQuestion [
(aQuestion topics)do:[:each | each questions remove:aQuestion].
aQuestion answers removeAll.
aQuestion votes removeAll.
]

{ #category : #accessing }
CuOOra >> getTopicQuestions:aTopic [    "deberia pasarla x parametro un topico q existe"
^aTopic questions.

]

{ #category : #initialize }
CuOOra >> initialize [
users:=OrderedCollection new.
topics:=OrderedCollection new.

]

{ #category : #accessing }
CuOOra >> interestingTopicOf:aUser [
^ topics detectMax: [ :each | each mostInteresting:aUser  ]. 
]

{ #category : #accessing }
CuOOra >> questionBy: anUser [
	topics flatCollect: [ :topic | topic questionsInTopicBy: anUser ]
]

{ #category : #accessing }
CuOOra >> topics [
^topics

]

{ #category : #acccessing }
CuOOra >> totalScoreOf:aUser [ 
^topics sumNumbers: [ :topic | topic scoreOf:aUser ]
]

{ #category : #accessing }
CuOOra >> userWithUsername: anUsername protectedBy: aPassword [
	^ users
		detect: [ :each | each username  = anUsername  & (each password = aPassword) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
CuOOra >> users [
^users

]
