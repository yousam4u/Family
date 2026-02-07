-- ============================================
-- Migration: Add JSON columns for simplified frontend data storage
-- Date: 2026-02-08
-- ============================================

-- 1. Add action_items JSON column to meetings table
ALTER TABLE meetings ADD COLUMN IF NOT EXISTS action_items JSONB DEFAULT '[]';

-- 2. Add options JSON column to votes table (for simplified storage)
ALTER TABLE votes ADD COLUMN IF NOT EXISTS options JSONB DEFAULT '[]';

-- 3. Add is_anonymous and is_multiple boolean columns to votes table
ALTER TABLE votes ADD COLUMN IF NOT EXISTS is_anonymous BOOLEAN DEFAULT false;
ALTER TABLE votes ADD COLUMN IF NOT EXISTS is_multiple BOOLEAN DEFAULT false;

-- 4. Add is_done column to chores table
ALTER TABLE chores ADD COLUMN IF NOT EXISTS is_done BOOLEAN DEFAULT false;
ALTER TABLE chores ADD COLUMN IF NOT EXISTS assigned_to UUID REFERENCES users(id);
ALTER TABLE chores ADD COLUMN IF NOT EXISTS due_date TIMESTAMP WITH TIME ZONE;
ALTER TABLE chores ADD COLUMN IF NOT EXISTS icon VARCHAR(10) DEFAULT '📌';

-- 5. Add is_done column to events table
ALTER TABLE events ADD COLUMN IF NOT EXISTS is_done BOOLEAN DEFAULT false;

-- 6. Add login_id column to users table (if not exists)
ALTER TABLE users ADD COLUMN IF NOT EXISTS login_id VARCHAR(50) UNIQUE;
ALTER TABLE users ADD COLUMN IF NOT EXISTS emoticon VARCHAR(50);

-- 7. Add description column to fines table
ALTER TABLE fines ADD COLUMN IF NOT EXISTS description TEXT;
ALTER TABLE fines ADD COLUMN IF NOT EXISTS paid_at TIMESTAMP WITH TIME ZONE;

-- Comments
COMMENT ON COLUMN meetings.action_items IS 'JSON array of action items [{text, assignee, done}]';
COMMENT ON COLUMN votes.options IS 'JSON array of vote options [{text, votes: []}]';
COMMENT ON COLUMN chores.is_done IS 'Chore completion status';
COMMENT ON COLUMN events.is_done IS 'Event completion status';

-- ============================================
-- Migration Complete!
-- ============================================
