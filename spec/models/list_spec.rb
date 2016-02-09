require 'rails_helper'

RSpec.describe List, :type => :model do

    describe '#complete_all_tasks!' do
        it 'should mark all taks as complete' do
            list = List.create(name: "groceries")
            ["oranges", "apples"].each do |task_name|
                Task.create(name: task_name, complete: false, list_id: list.id)
            end

            list.complete_all_tasks!

            list.tasks.each do |task|
                expect(task.complete).to eq(true)
            end
        end
    end

    describe '#snooze_all_tasks!' do
        it 'should push back deadline of all tasks by an hour' do
            time = Time.new(2016,2,8)
            list = List.create(name: "errands")
            ["laundry", "dishes"].each do |task_name|
            Task.create(name: task_name, deadline: time, list_id: list.id)
            end

            list.snooze_all_tasks!

            list.tasks.each do |task|
                expect(task.deadline).to eq(time + 1.hour)
            end

        end

    end


    describe '#total_duration' do
        it 'should return the total duration of a task' do
            list = List.create(name: "Errands")
            ["laundry", "dishes"].each do |task_name|
            Task.create(name: task_name, duration: 30, list_id: list.id)
            end

            expect(list.total_duration).to eq(60)
      
        end

    end

    describe '#incomplete_tasks' do
        it 'should return a list of incomplete tasks' do
         list = List.create(name: "Errands")
         [["clean garage", false], ["vac living room", true], ["wash dishes", false]].each do |task_name, complete_status|

         Task.create(name: task_name, complete: complete_status, list_id: list.id)
         end


         expect(list.incomplete_tasks).to eq(incomplete_task_list)

        end


    end






end
