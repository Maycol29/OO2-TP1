Class {
	#name : #TestUser,
	#superclass : #TestCase,
	#instVars : [
		'u1',
		'u2',
		'u3'
	],
	#category : #'OO2 Tp1-test'
}

{ #category : #running }
TestUser >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	u1 := User newUsername: 'tobias' password: 1234.
	u2 := User newUsername: 'lucio' password: 4321.
	u3 := User newUsername: 'luna' password: 'asdf'. 

]

{ #category : #tests }
TestUser >> testAddFollowing [
self assert: ( u1 following isEmpty) .
u1 addFollowing:u2. 
self assert:u1 following size equals:1.
self assert:(u1 following anySatisfy:[:user|user == u2]). 
]

{ #category : #tests }
TestUser >> testAddInterestingTopics [
|aTopic|
aTopic:=Topic newName: 'vacaciones' description:''. 
self assert: ( u1 interestTopics isEmpty) .
u1 addInterestTopic:aTopic. 
self assert:u1 interestTopics size equals:1.
self assert:(u1 interestTopics anySatisfy:[:topic|topic == aTopic]). 
]

{ #category : #tests }
TestUser >> testIsFollowing [
u1 addFollowing: u2.
self assert:(u1 isFollowing: u2).
self deny:(u1 isFollowing: u3).
self assert:(u1 isFollowing: u1).

]

{ #category : #tests }
TestUser >> testRemoveFollowing [
u1 addFollowing: u2.
self assert:(u1 following anySatisfy:[:user|user == u2]). 
u1 removeFollowing: u2.
self deny:(u1 following anySatisfy:[:user|user == u2]). 

]
