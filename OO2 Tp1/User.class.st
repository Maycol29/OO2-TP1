Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'creationDate',
		'followers'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #'instance creation' }
User class >> newUsername: aUsername password: aPassword [
	^ self new username: aUsername password: aPassword
]

{ #category : #accessing }
User >> addFollower:aUser [
	followers add:aUser.
]

{ #category : #initialization }
User >> initialize [
	creationDate := DateAndTime  today .
	followers:=OrderedCollection new.
	
	
]

{ #category : #accessing }
User >> username [
^username
]

{ #category : #initialization }
User >> username: aUsername password: aPassword [
	username:= aUsername .
	password := aPassword .
]
