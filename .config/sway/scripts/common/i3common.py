import i3

def get_first(iterable, default=None):
    if iterable:
        for item in iterable:
            return item
    return default

def get_current_workspace():
  current = get_first([ws for ws in i3.get_workspaces() if ws['focused']])
  return current

