task default: [:uninstall, :install]


class Installer

  @@BASHRC = <<END
#!/bin/sh
#
# NOTE: Do **NOT** edit this file.
#   This file is automated generated by cybertk/profile.
#   Edit profile/bashrc instead.

CK_BASHRC_DIR="#{File.dirname(__FILE__)}"
# Source bashrc provided by cybertk/profile
. ${CK_BASHRC_DIR}/dots/bashrc
END

  def initialize(*args)
    @dot_items=[
      'vim',
      'vimrc',
      'gitconfig',
      'gitignore',
    ]
    @profiles=[
      '.bashrc',
      '.bash_profile',
    ]
  end

  def install()
    # Copy first to make world safe
    _backup()
    _remove()
    _install()
  end

  def uninstall()
    _remove()
    # restore_backup()
  end

  def _install()
    @dot_items.each do |item|
      puts "Installing .#{item}"
      FileUtils.ln_sf File.absolute_path(File.join 'dots', item), File.join(Dir.home, ".#{item}")
    end

    @profiles.each do |item|
      puts "Installing #{item}"
      File.open(File.join(Dir.home, item), 'w') do |f|
        f.write(@@BASHRC)
      end
    end

  end

  def _backup_file(src, dest)
      if File.exist? src
        puts "Backuping #{src}"
        FileUtils.cp_r src, dest
      else
        puts "Skipping backup #{src}"
      end

  end

  def _backup()
    backup_path = File.expand_path "~/ck-dots-backup-#{Time.now.strftime("%Y%m%d-%H%M")}"
    puts "Backup to #{backup_path}"

    FileUtils.mkdir_p backup_path

    # Backup dots
    @dot_items.each do |item|
      _backup_file File.join(Dir.home, ".#{item}"), backup_path
    end

    # Backup bashrc and bash_profile
    @profiles.each do |item|
      _backup_file File.join(Dir.home, item), backup_path
    end

  end

  def _remove()
    # Remove unused
    @dot_items.each do |item|
      item=File.join(Dir.home, ".#{item}")
      puts "Removing #{item}"
      FileUtils.rm_rf item
    end
  end

end

task :install do
    Installer.new.install()
end

task :uninstall do
    Installer.new.uninstall()
end

task :lint do
    shs = Dir.glob("**/*.sh")
    shs << "profile"
    shs << "bin/largest"

    sh "shellcheck #{shs.join(' ')}"
end

task :test do
    sh "ruby -Ilib:test tests/test_installer.rb"
end
