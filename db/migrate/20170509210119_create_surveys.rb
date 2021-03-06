class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table(:surveys) do |t|
      t.column(:topic, :string)

      t.timestamps()
    end

    add_column(:questions, :survey_id, :integer)
  end
end
