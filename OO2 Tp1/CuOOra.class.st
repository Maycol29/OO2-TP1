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

{ #category : #accessing }
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
				ifNone: [ topicList add: (Topic newName: N description:'') ] ]).
	self addTopicList:topicList .
	topicList addAll:topicExist.
	^topicList
]

{ #category : #accessing }
CuOOra >> deleteQuestion:aQuestion [
(aQuestion topics)do:[:each | each questions remove:aQuestion].
aQuestion deleteAnswersVotes .
aQuestion answers removeAll.
aQuestion votes removeAll.
]

{ #category : #utility }
CuOOra >> getPostInNetwork:aCollection [
^(aCollection flatCollect:[:each| self questionsBy: each]) 
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
CuOOra >> mostThanFive:aCollection user:anUser [
|allQuestions|
allQuestions :=OrderedCollection new.
allQuestions addAll:(self getPostInNetwork: aCollection)."post de amigos"
allQuestions addAll:(self takeInterestingTopicOf: anUser)."post de interes propios"
allQuestions := (allQuestions asSet) asSortedCollection: [ :a :b | a date > b date ].
((allQuestions) size >5 )ifTrue:[^(allQuestions)first:5].
^allQuestions

]

{ #category : #accessing }
CuOOra >> questionsBy: anUser [
	^ (topics flatCollect: [ :topic | topic questionsInTopicBy: anUser ])
		asSet asSortedCollection: [ :a :b | a score > b score ]
]

{ #category : #accessing }
CuOOra >> takeInterestingTopicOf: anUser [
|allTopic|
allTopic:=OrderedCollection new.
(topics do: [:each| (each nameTopicEquals:(anUser interestTopics))
	ifNotNil:[:it |allTopic addAll:it]]).
^allTopic 


]

{ #category : #accessing }
CuOOra >> topics [
^topics

]

{ #category : #accessing }
CuOOra >> totalScoreOf: aUser [
	| scoreQ scoreA scoreV |
	scoreQ := ((topics
		select: [ :each | each questionsInTopicBy: aUser ] asSet)
		asOrderedCollection) size * 20.
	scoreA := ((topics select: [ :each | each answersInTopicBy: aUser ])
		asSet asOrderedCollection) size * 50.
	scoreV := topics
		sumNumbers: [ :each | each scoreOfTheAnswersBy: aUser ].
	^ scoreA + scoreQ + scoreV
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
