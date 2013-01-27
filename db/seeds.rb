# coding: utf-8
Provider.find_or_create_by_name('facebook')
if Room.count == 0
  Room.create(name: 'まったり部屋', max_count: 0)
  Room.create(name: 'マッタリ部屋', max_count: 0)
  Room.create(name: 'カラオケ部屋', max_count: 3)
  Room.create(name: '独り言部屋', max_count: 1)
end
[FortuneSlip].each do |c|
  next if c.count > 0
  yml = File.read("#{Rails.root}/db/seeds/#{c.to_s.tableize}.yml")
  list = YAML.load(yml).symbolize_keys
  list[c.to_s.tableize.to_sym].each do |r|
    c.create! do |t|
      r.each do |i, v|
        t.send "#{i}=", v
      end
    end
  end
end
