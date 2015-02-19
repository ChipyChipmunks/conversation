Messages = new Mongo.Collection('messages')

Messages.attachSchema new SimpleSchema(
  message:
    type: String
    label: ''
    max: 300
)

root = exports ? this

root.Messages = Messages
