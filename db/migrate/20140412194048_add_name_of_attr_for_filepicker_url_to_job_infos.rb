class AddNameOfAttrForFilepickerUrlToJobInfos < ActiveRecord::Migration
  def change
    add_column :job_infos, :filepicker_url, :string
  end
end
