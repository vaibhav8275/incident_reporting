class User < ApplicationRecord

	has_many :incidents

  enum s_role: {
  	student: 0,
  	teacher: 1,
  	other_staff: 2,
  	parent: 3,
  	community_member: 4
  }


end