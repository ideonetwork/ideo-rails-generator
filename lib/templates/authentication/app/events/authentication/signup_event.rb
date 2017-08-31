# frozen_string_literal: true

module Authentication

  # SignupEvent.
  class SignupEvent < ApplicationEvent

    name_is :authentication_signup

    attributes_are :uuid, :name, :surname, :email, :password_digest

    handlers_are [
      UserHandler.new
    ]

    to_save_event do
      Event.create(name: name, payload: payload)
    end

  end

end