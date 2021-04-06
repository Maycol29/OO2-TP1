Class {
	#name : #AnswerFAFA,
	#superclass : #PostFAFA,
	#category : #'OO2 Tp1-model'
}

{ #category : #accessing }
AnswerFAFA >> negativeScore [ 
	^votes size - (self positiveScore).
]

{ #category : #accessing }
AnswerFAFA >> positiveScore [
	^votes select: [:vote| (vote value)]
]

{ #category : #accessing }
AnswerFAFA >> score [ 
	^(self positiveScore - self negativeScore). 
]
