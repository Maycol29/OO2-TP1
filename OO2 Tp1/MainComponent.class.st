Class {
	#name : #MainComponent,
	#superclass : #WAComponent,
	#category : #'OO2 Tp1-ui'
}

{ #category : #callbacks }
MainComponent >> befriend: anUser [
	self session user addFollowing: anUser
]

{ #category : #callbacks }
MainComponent >> createNewPost [
	self call: NewPostComponent new
]

{ #category : #callbacks }
MainComponent >> findFriend [
	self call: (UserFinderComponent new parent:self) .
]

{ #category : #model }
MainComponent >> model [ 
^CuOOra soleInstance 
]

{ #category : #callbacks }
MainComponent >> notBefriend:anUser [
self session user removeFollowing:anUser .
]

{ #category : #rendering }
MainComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Welcome ' , self session user username.
	self renderMyQuestion:aCanvas.
	self renderPostsOn: aCanvas.
	aCanvas horizontalRule.
	self renderFriendsOn: aCanvas.
	aCanvas horizontalRule.
	self renderLogoutButtonOn: aCanvas.
]

{ #category : #rendering }
MainComponent >> renderFriendsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Following'.
	aCanvas
		unorderedList: [ self session user following
				do: [ :each | 
					aCanvas
						listItem:[aCanvas anchor callback: [ self showProfileOf: each ];
						with: (each username) ]] ].
	aCanvas anchor
		callback: [ self findFriend ];
		with: [ aCanvas button: 'Find User' ]
]

{ #category : #rendering }
MainComponent >> renderLastQuestion: aCanvas [
	aCanvas
		unorderedList: [ (self model mostThanFive:self session user following)
				do: [ :post | 
					 "QuestionComponent new question: post"
					aCanvas render: (QuestionComponent new question: post parent:self) .
					"self viewAnswers: aCanvas question: post "] ]
]

{ #category : #rendering }
MainComponent >> renderLogoutButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self session user: nil.
					self call: LogInComponent new ];
				with: [ aCanvas button with: 'Logout' ] ]
]

{ #category : #rendering }
MainComponent >> renderMyQuestion:aCanvas [
aCanvas anchor
		style: 'font-size: 25px; color:black';
		callback: [ self showProfileOf: self session user];
		with: 'My questions'.
]

{ #category : #rendering }
MainComponent >> renderPostsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Following Posts'.
	self renderLastQuestion: aCanvas .
	aCanvas anchor
		callback: [ self createNewPost ];
		with: [ aCanvas button: 'Create new post' ]
]

{ #category : #callbacks }
MainComponent >> seeAnswers:aQuestion [
| instance |
	instance := AnswersComponent new.
	instance question: aQuestion parent:self .
	self call: instance .
	
]

{ #category : #callbacks }
MainComponent >> showProfileOf: aUser [
|instance|

instance := UserProfileComponent new .
instance profileUser: aUser parent:self.
self call: instance.

]
