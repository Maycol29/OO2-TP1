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
	
	answer2 := Answer newAuthor: user1  text: 'Y... es todo un tema'.
	
	question addQuestionToTopics.
]

{ #category : #tests }
TestQuestion >> testAddAnswer [
	self assert: question answers isEmpty.
 	question addAnswer: answer1 .
	self assert: [(question answers) includes: answer1 ].
]

{ #category : #tests }
TestQuestion >> testAddQuestionToTopics [
	self assert:((topic1 questions)includes:question).
	self assert:((topic1 questions)size=1).
]

{ #category : #tests }
TestQuestion >> testAnswersBy [ 
	question addAnswer: answer1 .
	self assert: [(question answersInQuestionBy: user1) anySatisfy: [:answer| answer author == user1]].
	
	self assert: (question answersInQuestionBy: user2) isEmpty.
	
]

{ #category : #tests }
TestQuestion >> testCleanTheQuestion [
question addAnswer: answer1 .
question addAnswer: answer2 .
question addVote: vote1.
answer1 addVote:vote2.
question cleanTheQuestion.

self assert:((question answers)isEmpty) .
self assert:((question votes)isEmpty) .
self assert:((answer1 votes)isEmpty).
self assert:((topic1 questions) isEmpty).
]

{ #category : #tests }
TestQuestion >> testDeleteAnswersVotes [
	question answers  do: [:answer| self assert: (answer votes) isEmpty ].

	question addAnswer: answer1 .
	question addAnswer: answer2 .
	question deleteAnswersVotes.
	
	question answers  do: [:answer| self assert: (answer votes) isEmpty ]
	
]

{ #category : #tests }
TestQuestion >> testOrderedAnswers [
	| ord |
	ord := OrderedCollection new.
	ord add: answer2.
	ord addLast: answer1.
	question addAnswer: answer1.
	question addAnswer: answer2.
	self
		assert:
			(question orderedAnswers
				isSortedBy: [ :dato1 :dato2 | dato1 score >= dato2 score ])
]

{ #category : #tests }
TestQuestion >> testScoreAnswersBy [

	self assert: [ (question scoreAnswersBy: user1) = 0 ].
	question addAnswer: answer1.
	question addAnswer: answer2.
	
	self assert: [ (question scoreAnswersBy: user1) = 2 ].
	
	
]
