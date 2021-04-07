Class {
	#name : #MainComponent,
	#superclass : #WAComponent,
	#category : #'OO2 Tp1-ui'
}

{ #category : #callbacks }
MainComponent >> createNewPost [
	self call: TopicsComponent new
]

{ #category : #callbacks }
MainComponent >> findFriend [
	self call: UserFinderComponent new
]

{ #category : #rendering }
MainComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Welcome ' , self session user username.
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
		unorderedList: [ self session user following do: [ :each | aCanvas listItem: each username ] ].
	aCanvas anchor
		callback: [ self findFriend ];
		with: [ aCanvas button: 'Find User' ]
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
MainComponent >> renderPostsOn: aCanvas [
		aCanvas anchor
		callback: [ self createNewPost ];
		with: [ aCanvas button: 'Create new post' ]
]
