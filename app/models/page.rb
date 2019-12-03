class Page < ApplicationRecord
    belongs_to :user

    validates :name, presence:true
    validates :user_id, presence:true

    has_one_attached :transcript
    has_one_attached :resume
    has_one_attached :avatar

    validate :correct_resume_type
    validate :correct_transcript_type
    validate :correct_avatar_type

    def self.search(search)
        if search
            if search == ""
                self.all
            else
                people = self.all.where("lower(name) LIKE ?", "%#{search.downcase}%")
                descriptions = self.all.where("lower(about_me) LIKE ?", "%#{search.downcase}%")
                return people + descriptions
            end
        else
            self.all
        end
    end


  private

  def correct_resume_type
    if resume.attached? && !resume.content_type.in?(%w(application/msword application/pdf))
      errors.add(:resume, 'Must be a PDF or a DOC file')
    end
  end

  def correct_transcript_type
    if transcript.attached? && !transcript.content_type.in?(%w(application/msword application/pdf))
      errors.add(:transcript, 'Must be a PDF or a DOC file')
    end
  end

  def correct_avatar_type
    if avatar.attached? && !avatar.content_type.in?(%w(image/png image/jpg image/jpeg))
        errors.add(:avatar, 'Must be a png, jpeg or jpg')
    end
  end

end
