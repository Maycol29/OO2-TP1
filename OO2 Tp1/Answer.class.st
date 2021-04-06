Class {
	#name : #Answer,
	#superclass : #Post,
	#category : #'OO2 Tp1-model'
}

{ #category : #accessing }
Answer >> negativeScore [ 
	^votes size - (self positiveScore).
]

{ #category : #accessing }
Answer >> positiveScore [
	^votes select: [:vote| (vote value)]
]

{ #category : #accessing }
Answer >> score [ 
	^(self positiveScore - self negativeScore). 
]
