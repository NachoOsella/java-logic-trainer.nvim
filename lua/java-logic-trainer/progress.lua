local M = {}

local uv = vim.uv or vim.loop

M.dir = vim.fn.stdpath("data") .. "/java-logic-trainer"
M.path = M.dir .. "/progress.json"

local default_progress = {
  completed = {},
  currentDifficulty = 1,
  lastExercise = nil,
  hints = {},
}

local function ensure_dir()
  vim.fn.mkdir(M.dir, "p")
end

local function copy_default()
  return vim.deepcopy(default_progress)
end

function M.load()
  ensure_dir()
  if vim.fn.filereadable(M.path) == 0 then
    return copy_default()
  end
  local ok, data = pcall(vim.fn.readfile, M.path)
  if not ok then return copy_default() end
  local ok_json, decoded = pcall(vim.json.decode, table.concat(data, "\n"))
  if not ok_json or type(decoded) ~= "table" then return copy_default() end
  decoded.completed = decoded.completed or {}
  decoded.currentDifficulty = decoded.currentDifficulty or 1
  decoded.hints = decoded.hints or {}
  return decoded
end

function M.save(progress)
  ensure_dir()
  vim.fn.writefile(vim.split(vim.json.encode(progress), "\n"), M.path)
end

function M.is_completed(id, progress)
  progress = progress or M.load()
  for _, completed_id in ipairs(progress.completed or {}) do
    if completed_id == id then return true end
  end
  return false
end

function M.complete(exercise)
  local progress = M.load()
  if not M.is_completed(exercise.id, progress) then
    table.insert(progress.completed, exercise.id)
  end
  progress.lastExercise = exercise.id
  progress.currentDifficulty = math.max(progress.currentDifficulty or 1, (exercise.difficulty or 1) + 1)
  M.save(progress)
  return progress
end

function M.set_last(exercise)
  local progress = M.load()
  progress.lastExercise = exercise and exercise.id or nil
  M.save(progress)
  return progress
end

function M.next_hint(exercise)
  local progress = M.load()
  progress.hints[exercise.id] = (progress.hints[exercise.id] or 0) + 1
  if progress.hints[exercise.id] > #(exercise.hints or {}) then
    progress.hints[exercise.id] = #(exercise.hints or {})
  end
  M.save(progress)
  return progress.hints[exercise.id]
end

function M.reset()
  local progress = copy_default()
  M.save(progress)
  return progress
end

return M
