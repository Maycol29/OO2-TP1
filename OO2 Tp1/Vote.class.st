Class {
	#name : #Vote,
	#superclass : #Object,
	#instVars : [
		'date',
		'feedback',
		'belongsTo'
	],
	#category : #'OO2 Tp1-model'
}

{ #category : #initialization }
Vote class >> newBelongsTo: anUser Date: aDateAndTime feedback: aFeedback [

^ self new belongsTo: anUser date: aDateAndTime  feedback: aFeedback 
]

{ #category : #initialization }
Vote >> belongsTo: anUser date: aDate feedback: aFeedback [
	date := aDate.
	feedback := aFeedback.
	belongsTo := anUser
]

{ #category : #accessing }
Vote >> feedback [ 
	^feedback
]

{ #category : #initialization }
Vote >> initialize [
	date := DateAndTime  today .
]
