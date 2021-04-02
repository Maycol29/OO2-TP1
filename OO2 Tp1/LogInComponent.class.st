Class {
	#name : #LogInComponent,
	#superclass : #AccessComponent,
	#category : #'OO2 Tp1-tag'
}

{ #category : #callbacks }
LogInComponent >> login [
	(self model userWithUsername: username protectedBy: password)
		ifNotNil: [ :it | self proceedWith: it ].
	username := nil.
	password := nil
]

{ #category : #callbacks }
LogInComponent >> registerNewUser [
	self call: SingInComponent new
]

{ #category : #rendering }
LogInComponent >> renderButtonsOn: aCanvas [
	self renderSignInButtonOn: aCanvas.
	aCanvas horizontalRule.
	aCanvas paragraph: 'Create an account'.
	self renderSignUpButtonOn: aCanvas
]

{ #category : #rendering }
LogInComponent >> renderSignInButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self login ];
		with: 'Sign In'
]

{ #category : #rendering }
LogInComponent >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registerNewUser ];
		with: 'Create Account'
]
