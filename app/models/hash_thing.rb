class HashThing

  def initialize subject
    @subject = subject
  end

  def the_subject
    @subject
  end

  def method_missing meth, *args, &blk
    the_subject[meth.to_s]
  end

end
