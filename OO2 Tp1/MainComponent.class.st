Class {
	#name : #MainComponent,
	#superclass : #WAComponent,
	#category : #'OO2 Tp1-tag'
}

{ #category : #callbacks }
MainComponent >> createNewPost [
	self call: TopicsComponent new
]

{ #category : #callbacks }
MainComponent >> findFriend [
	self call: FriendsFinderComponent new
]

{ #category : #rendering }
MainComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'Welcome ' , self session user username.
	self renderPostsOn: aCanvas.
	aCanvas horizontalRule.
	"self renderFriendsOn: aCanvas."
	aCanvas horizontalRule.
	self renderLogoutButtonOn: aCanvas
]

{ #category : #rendering }
MainComponent >> renderFriendsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Friends'.
	aCanvas
		unorderedList: [ self session user friends do: [ :each | aCanvas listItem: each name ] ].
	aCanvas anchor
		callback: [ self findFriend ];
		with: [ aCanvas button: 'Find friends' ]
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
