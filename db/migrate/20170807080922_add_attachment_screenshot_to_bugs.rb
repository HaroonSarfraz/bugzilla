class AddAttachmentScreenshotToBugs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :bugs do |t|
      t.attachment :screenshot
    end
  end

  def self.down
    remove_attachment :bugs, :screenshot
  end
end
