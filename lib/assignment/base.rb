module Assignment
  # this class contains both the assignment info extracted from grader_payload
  # as well as the submission itself. Any adapter should be able to grade this
  # type of submission and return a response.
  class Base
    include ActiveModel::Validations
    attr_reader :due_date, :assignment_name, :assignment_spec_file,  :assignment_autograder_type
    validates_presence_of :due_date, :assignment_name, :assignment_spec_file, :assignment_autograder_type

    def initialize(_submission)
      raise "abstract method"
    end

    # default behavior is not to adjust lateness policy. Can be overridden by subclass
    def apply_lateness!(_submission)
    end
  end
end