class SeederClass

  def initialize
    @faker_helper = FakerHelperClass.new()
  end


  def data
    #@mock_data
  end

  def unseed
    mock_user_ids = read_mock_user_ids

    mock_user_ids.each { |x| Entity.where(user_id: x).destroy_all }
    mock_user_ids.each { |x| Event.where(user_id: x).destroy_all }
    mock_user_ids.each { |x| User.find(x).destroy }

    write_mock_user_ids([])
  end

  def seed_users(n)
    base_email = Rails.application.credentials.mock_seeding_email
    mock_password = Rails.application.credentials.mock_password
    
    mock_user_ids = []

    begin
      n.times do      
        mock_user_ids << User.create!(
          email: base_email + "+" + Faker::Name.first_name + Time.now.to_i.to_s + "@gmail.com",
          password: mock_password,
          password_confirmation: mock_password,
          privileged: Faker::Boolean.boolean(true_ratio: 0.8)
        ).id
      end
    rescue
      puts "SeederClass::seed_users broke, for some reason; ids for mock users already generated:"
      puts mock_user_ids
    end

    append_mock_user_ids(mock_user_ids)
  end

  def seed_entities(n)
    mock_user_ids = read_mock_user_ids
    mock_user_ids.each do |id|
      n.times do 
        Entity.create!(
          user_id: id,
          name:  @faker_helper.generate_entity_name,
          about: @faker_helper.generate_entity_text
        )
      end
    end
  end

  def seed_events(n)
    mock_user_ids = read_mock_user_ids
    mock_user_ids.each do |id|
      n.times do 
        Event.create!(
          user_id: id,
          name:  @faker_helper.generate_event_name,
          story: @faker_helper.generate_event_text
        )
      end
    end
  end

  private

  def append_mock_user_ids(mock_user_ids)
    extant_ids = read_mock_user_ids
    write_mock_user_ids((mock_user_ids + extant_ids).uniq)
  end

  def write_mock_user_ids(mock_user_ids)
    titled_ids = { :title => "mock_user_ids", user_ids: mock_user_ids}
    File.open("#{Rails.root.to_s}/db/seeds/mock_data.yml", "w") { |file| file.write(titled_ids.to_yaml) }
  end

  def read_mock_user_ids
    YAML.load_file("#{Rails.root.to_s}/db/seeds/mock_data.yml")[:user_ids]
  end
end