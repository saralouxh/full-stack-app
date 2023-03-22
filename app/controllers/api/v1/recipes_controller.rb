module Api
    module V1
      # Handles endpoints related to users
      class RecipesController < Api::V1::ApplicationController
        skip_before_action :authenticate, only: [:show, :index]

        def create 
          result = Recipes::Operations.new_recipe(params, @current_user)
          render_error(errors: 'There was a problem creating a new recipe', status: 400) and return unless result.success?
          payload = {
            recipe: RecipeBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
        end

        def index 
          recipes = Recipe.all 

          payload = {
            recipes: RecipeBlueprint.render_as_hash(recipes),
            status: 200
          }
          render_success(payload: payload)
        end

        def show
          recipe = Recipe.find(params[:id])

          payload = {
            recipe: RecipeBlueprint.render_as_hash(recipe),
            status: 200
          }
          render_success(payload: payload)
        end

        def update 
          result = Recipes::Operations.update_recipe(params)
          render_error(errors: result.errors.all, status: 400) and return unless result.success?
          payload = {
            recipe: RecipeBlueprint.render_as_hash(result.payload),
            status: 201
          }
          render_success(payload: payload)
        end

        def destroy 
          recipe = Recipe.find(params[:id])
          recipe.destroy
          render_success(payload: "Recipe has been destroyed!", status: 200)
        end

      end
    end
end