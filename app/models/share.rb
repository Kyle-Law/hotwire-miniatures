class Share < ApplicationRecord
  after_create_commit { broadcast_append_to "shares" }
  after_update_commit { broadcast_replace_to "shares" }
  after_destroy_commit { broadcast_remove_to "shares" }
end
