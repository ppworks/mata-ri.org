# coding: utf-8
Provider.find_or_create_by_name('facebook')
if Room.count == 0
  Room.create(name: 'まったり部屋', max_count: 0)
  Room.create(name: 'マッタリ部屋', max_count: 0)
  Room.create(name: 'カラオケ部屋', max_count: 3)
  Room.create(name: '独り言部屋', max_count: 1)
end
