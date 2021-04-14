Class {
	#name : #TestAnswer,
	#superclass : #TestCase,
	#instVars : [
		'answer',
		'vote1',
		'vote2',
		'user1',
		'user2'
	],
	#category : #'OO2 Tp1-test'
}

{ #category : #running }
TestAnswer >> setUp [
	
	user1 := User newUsername: 'Carlos Tevez' password: 'BOQUITA'.
	user2 := User newUsername: 'Lionel Messi' password: 'theBest'.
	
	answer := Answer newAuthor: user1  text: 'Veri dificul'.
	
	vote1 := Vote newBelongsTo: user2 value: true.
	vote2 := Vote newBelongsTo: user1 value: true.
	
]

{ #category : #tests }
TestAnswer >> testDeleteAllVotes [
	answer addVote: vote1.
	answer addVote: vote2.
	answer deleteAllVotes .
	
	self assert: (answer votes) isEmpty.
]
