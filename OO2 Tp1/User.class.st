Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'creationDate'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #'instance creation' }
User class >> newUsername: aUsername password: aPassword [
	^ self new username: aUsername password: aPassword
]

{ #category : #initialization }
User >> initialize [
	creationDate := DateAndTime  today .
	
	
]

{ #category : #initialization }
User >> username: aUsername password: aPassword [
	username:= aUsername .
	password := aPassword .
]
