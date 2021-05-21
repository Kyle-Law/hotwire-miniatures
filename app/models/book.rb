class Book < ApplicationRecord
  after_create_commit { broadcast_append_to "books" }

  after_update_commit { broadcast_replace_to "books" }

  after_destroy_commit { broadcast_remove_to "books" }

  default_scope { order(id: :asc) }

  # broadcasts
end
