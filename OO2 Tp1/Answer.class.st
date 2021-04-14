Class {
	#name : #Answer,
	#superclass : #Post,
	#category : #'OO2 Tp1-model'
}

{ #category : #accessing }
Answer >> deleteAllVotes [
	votes removeAll .
]
