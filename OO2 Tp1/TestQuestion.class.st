Class {
	#name : #TestQuestion,
	#superclass : #TestCase,
	#instVars : [
		'question',
		'answer1',
		'answer2',
		'vote1',
		'vote2',
		'user1',
		'user2',
		'topics',
		'topic1'
	],
	#category : #'OO2 Tp1-test'
}

{ #category : #running }
TestQuestion >> setUp [
	user1 := User newUsername: 'Carlos Tevez' password: 'BOQUITA'.
	user2 := User newUsername: 'Sergio Agüero' password: 'theBest'.
	
	topic1 := Topic newName: 'Siria' description: 'Un pais'.
	topics := OrderedCollection new.
	topics add: topic1.
	
	question := Question newAuthor: user2 text: 'Diganme que opinan'  title: 'Qué opinan de la situación socio-económica actual de Siria?' topics: topics.
	
	answer1 := Answer newAuthor: user1  text: 'Veri dificul'.
	vote1 := Vote newBelongsTo: user2 value: true.
	vote2 := Vote newBelongsTo: user1 value: true.
	answer1 addVote: vote1.
	answer1 addVote: vote2.
	
	
	answer2 := Answer newAuthor: user2  text: 'Y bueno... vamo a juga'.
	
]

{ #category : #tests }
TestQuestion >> testAddAnswer [
	self assert: question answers isEmpty.
 	question addAnswer: answer1 .
	self assert: [(question answers) includes: answer1 ].
]

{ #category : #tests }
TestQuestion >> testAnswersBy [ 
	question addAnswer: answer1 .
	self assert: [(question answersBy: user1) anySatisfy: [:answer| answer author == user1]].
	
	self assert: (question answersBy: user2) isEmpty.
	
]
