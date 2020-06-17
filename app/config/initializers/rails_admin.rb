RailsAdmin.config do |config|

  config.model 'Admin' do
    edit do
      exclude_fields :remember_created_at
    end
    list do
      exclude_fields :remember_created_at
    end
  end

  config.model 'Recipe' do
    edit do
      exclude_fields :comments, :bookmarks, :ratings
      field :recipe, :ck_editor
    end
    show do
      exclude_fields :recipe
    end
    list do
      exclude_fields :recipe, :time_to_cook, :energy
    end
  end

  config.model 'User' do
    list do
      exclude_fields :remember_created_at, :reset_password_sent_at
    end
    edit do
      exclude_fields :remember_created_at, :reset_password_sent_at, :replies, :comments, :bookmarks, :ratings, :premium_purchases
    end
  end

  config.model 'PremiumPurchase' do
    list do
      exclude_fields :updated_at
    end
  end

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['Admin', 'Bookmark', 'Comment', 'Reply', 'Rating']
    end
    bulk_delete
    show do
      except ['Admin']
    end
    edit do
      except ['Comment', 'Reply', 'User', 'Bookmark', 'Rating']
    end
    delete do
      except ['Admin', 'Bookmark', 'Rating']
    end
    show_in_app do
      except ['Bookmark', 'Comment', 'Rating']
    end
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
