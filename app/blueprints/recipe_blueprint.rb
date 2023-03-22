# frozen_string_literal: true

# Defines the JSON blueprint for the User model
class RecipeBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :content, :user
end