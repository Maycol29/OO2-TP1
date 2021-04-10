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

{ #category : #acccessing }
CuOOra >> answersBy: aUser [
	topics flatCollect: [ :topic | topic answersInTopicBy: aUser ]
]

{ #category : #adding }
CuOOra >> createTopics: topicNames [
	|  topicExist topicList |
	topicExist:= OrderedCollection new.
	topicList := OrderedCollection new.
	(topicNames
	do:[ :N | 
			topics
				detect: [ :each | each name = N ]
				ifFound:[:it | topicExist add: it ]
				ifNone: [ topicList add: (Topic newName: N) ] ]).
	self addTopicList:topicList .
	topicList addAll:topicExist.
	^topicList
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
CuOOra >> questionsBy: anUser [
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

{ #category : #accessing }
CuOOra >> usersMatchingNamePart: aString [
	^ users
		select:
			[ :each | each username asLowercase includesSubstring: aString asLowercase ]
]
