# VSC launch.json: add current path and rename targets##########################

doc = JSON5.parse(IO.read('.vscode/launch.json'))

doc['configurations'].each do |cfg|
  name = cfg.dig('cargo', 'filter', 'name')
  dirs = Dir["**/*#{name}"].grep_v(/debug/)

  if dirs.size == 1
      puts "OK: " + "${workspaceFolder}/#{dirs[0]}"
      cfg['cwd'] = "${workspaceFolder}/#{dirs[0]}"
      cfg['name'] = dirs[0]
    else
      puts "KO (#{dirs.size}): #{name}"
    end
end; nil

IO.write('.vscode/launch.json', JSON.generate(doc))
