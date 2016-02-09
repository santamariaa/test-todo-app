require 'rails_helper'

RSpec.describe Task, :type => :model do
  describe '#toggle_complete!' do
    it 'should make a task complete that is incomplete' do
        task = Task.create(complete: false)
        task.toggle_complete!
        expect(task.complete).to eq(true)
    end

    it 'should make a task incomplete that is complete' do
        task = Task.create(complete: true)
        task.toggle_complete!
        expect(task.complete).to eq(false)
    end
  end

    describe '#toggle_favotite!' do
    it 'should make a task your favorite' do
        task = Task.create(favorite: false)
        task.toggle_favorite!
        expect(task.favorite).to eq(true)
    end

     it 'should make a task NOT your favorite' do
        task = Task.create(favorite: true)
        task.toggle_favorite!
        expect(task.favorite).to eq(false)
    end
  end

  describe '#overdue?' do
    it 'should return true if deadline of a task is in the past' do
        task = Task.create(deadline: Time.now)
        expect(task.overdue?).to eq(true)

    end

    it 'should return false if deadline of a task is in the future' do
        task = Task.create(deadline: 1.day.from_now)
        expect(task.overdue?).to eq(false)

    end
  end

  describe '#increment_priority!' do
    it 'should make a task more important' do
        task = Task.create(priority: 4 )
        task.increment_priority!
        expect(task.priority).to eq(5)
    end
  end

  describe '#decrement_priority!' do
    it 'should make a task less important' do
        task = Task.create(priority: 4 )
        task.decrement_priority!
        expect(task.priority).to eq(3)
    end
  end
  
  describe '#snooze_hour!' do
    it 'it should push deadline by one hour' do
        time = Time.now
        task = Task.create(deadline: time )
        task.snooze_hour!
        expect(task.deadline).to eq(time + 1.hour)
    end
  end



end
