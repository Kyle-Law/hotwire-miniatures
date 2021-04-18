class Item < ApplicationRecord

  after_create_commit { broadcast_append_to "items" }

  after_update_commit { broadcast_replace_to "items" }

  after_destroy_commit { broadcast_remove_to "items" }
end
