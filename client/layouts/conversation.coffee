Meteor.subscribe('messages')

screenUpdateDep = new Tracker.Dependency;

Meteor.setInterval((-> screenUpdateDep.changed()), 30000)


Template.layout.events(
  'submit #message_form': (evt, template) -> 
    evt.preventDefault()
    input = template.find('#messagebox')
    text = input.value 
    new_message =
      text: text
  
    Messages.insert new_message
  console.log('yes', Messages)
)

Template.layout.helpers ( 
  messages : -> Messages.find().fetch()
)

Template.message.events(
  'click .trash' : -> (Messages.remove(this._id)) 
)