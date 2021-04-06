Class {
	#name : #AccessComponent,
	#superclass : #WAComponent,
	#instVars : [
		'username',
		'password'
	],
	#category : #'OO2 Tp1-ui'
}

{ #category : #model }
AccessComponent >> model [
	^ CuOOra soleInstance
]

{ #category : #accessing }
AccessComponent >> password [
	^ password
]

{ #category : #accessing }
AccessComponent >> password: anObject [
	password := anObject
]

{ #category : #private }
AccessComponent >> proceedWith: aUser [
	self session user: aUser.
	self call: MainComponent new
]

{ #category : #rendering }
AccessComponent >> renderButtonsOn: aCanvas [
	self subclassResponsibility
]

{ #category : #rendering }
AccessComponent >> renderContentOn: aCanvas [
	aCanvas heading:'CuOOra'.
	aCanvas
		form: [ self renderInputElementsOn: aCanvas.
			self renderButtonsOn: aCanvas ]
]

{ #category : #rendering }
AccessComponent >> renderInputElementsOn: aCanvas [
	aCanvas paragraph
		with: [ aCanvas strong with: 'Username'.
			aCanvas space.
			aCanvas textInput on: #username of: self ].
	
	aCanvas paragraph
	with: [ aCanvas strong with: 'Password'.
			aCanvas space.
			aCanvas space.
	aCanvas passwordInput on: #password of: self ]
]

{ #category : #accessing }
AccessComponent >> username [
^username
]

{ #category : #accessing }
AccessComponent >> username:anObject [ 
username:=anObject
]
