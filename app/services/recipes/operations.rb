module Recipes
    module Operations 
        def self.new_recipe(params, current_user)
            recipe = current_user.recipes.new(name: params[:name], content: params[:content])

            return ServiceContract.success(recipe) if recipe.save 

            ServiceContract.error(recipe.errors.full_messages)
        end

        def self.update_recipe(params)
            recipe = Recipe.find(params[:id])
            return ServiceContract.success(recipe) if recipe.update(name: params[:name], content: params[:content])
            ServiceContract.error(recipe.errors.full_messages)
        end
    end
end
