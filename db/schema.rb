# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_180_708_195_543) do
  create_table 'actions', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci', force: :cascade do |t|
    t.bigint 'bot_id'
    t.string 'actionable_type'
    t.bigint 'actionable_id'
    t.index %w[actionable_type actionable_id], name: 'index_actions_on_actionable_type_and_actionable_id', length: { actionable_type: 191 }
    t.index ['bot_id'], name: 'index_actions_on_bot_id'
  end

  create_table 'bot_hashtags', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci', force: :cascade do |t|
    t.bigint 'bot_id'
    t.bigint 'hashtag_id'
    t.text 'notes'
    t.index ['bot_id'], name: 'index_bot_hashtags_on_bot_id'
    t.index ['hashtag_id'], name: 'index_bot_hashtags_on_hashtag_id'
  end

  create_table 'bot_types', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci', force: :cascade do |t|
    t.integer 'severity'
    t.text 'name'
  end

  create_table 'bots', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci', force: :cascade do |t|
    t.boolean 'suspended'
    t.boolean 'watched'
    t.boolean 'success'
    t.text 'username'
    t.text 'notes'
    t.bigint 'type_id'
    t.index ['type_id'], name: 'index_bots_on_type_id'
  end

  create_table 'hashtags', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci', force: :cascade do |t|
    t.text 'name'
    t.text 'notes'
  end

  create_table 'investigations', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci', force: :cascade do |t|
  end

  create_table 'network_memberships', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci', force: :cascade do |t|
    t.bigint 'bot_id'
    t.bigint 'network_id'
    t.text 'notes'
    t.index ['bot_id'], name: 'index_network_memberships_on_bot_id'
    t.index ['network_id'], name: 'index_network_memberships_on_network_id'
  end

  create_table 'networks', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci', force: :cascade do |t|
    t.text 'name'
    t.text 'notes'
  end

  create_table 'reports', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci', force: :cascade do |t|
  end

  create_table 'status_checks', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci', force: :cascade do |t|
  end
end
