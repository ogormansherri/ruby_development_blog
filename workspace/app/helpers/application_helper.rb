module ApplicationHelper
    
    #returns the full title on a per-page basis     # Documentation Comment
    def full_title(page_title = '')                 # Method def, optional arg
        base_title = "Zen Blog"                     # Variable assignment
        if page_title.empty?                        # Boolean test
            base_title                              # Implicit return
        else                                        
            page_title + " | " + base_title         # string concatenation
        end
    end
end
