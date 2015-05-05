#= require spree/frontend

Spree.ready ($) ->
  $('.answer').hide()
  $('.answer').show()
  $('#new_user_question_form').validate();

  $('.question').on 'click', ->
    id = $(this).attr('id').split('_')[1]
    $('#answer_' + id).slideToggle()
    return false

contactComplete = () ->
  $('#new_user_question').html("Thank you for contacting the UC-Store. We value your feedback, and your question will be answered shortly."+"<br/>"+"Please check the "+"<a href='/faq'>"+"Frequently Asked Questions"+"</a>"+" for more questions and answers.")

contactError = () ->
  alert "Error"

window.contactComplete = contactComplete
window.contactError = contactError
