cheatsheet do
    title 'vim-sexp'
    docset_file_name 'vim-sexp'
    keyword 'sexp'
    source_url 'https://github.com/rkoch/dash-cheatsheets'

    category do
      id 'Definitions'

      entry do
        name 'COMPOUND FORM'
        notes 'A COMPOUND FORM is a region of text delimited by a pair of `(` and `)`, `[` and `]`, or `{` and `}`.'
      end

      entry do
        name 'STRING'
        notes 'A STRING is a contiguous region of text whose syntax name matches the Vim pattern `\vstring|regex|pattern`.'
      end

      entry do
        name 'COMMENT'
        notes 'A COMMENT is a region of text whose syntax name matches the Vim pattern `comment`. Line comments that are indented but on successive lines are considered to be a single comment.'
      end

      entry do
        name 'MACRO CHARACTERS'
        notes 'MACRO CHARACTERS are the special set of leading characters expanded by a Lisp reader at read-time. These differ by language, and default to Scheme\'s macro character set in an unknown FileType.'
      end

      entry do
        name 'ELEMENT'
        notes <<-'END'
          An ELEMENT is the

          * current STRING if the cursor is in a STRING
          * current COMMENT if the cursor is in a COMMENT
          * current COMPOUND FORM if the cursor is on a paired structural bracket
          * current sequence of MACRO CHARACTERS and the following ELEMENT if the cursor is on a MACRO CHARACTER
          * current contiguous sequence of non-whitespace, non-bracket characters otherwise

          An ELEMENT always includes any leading MACRO CHARACTERS.
        END
      end
    end

    category do
      id 'Text Object Selections (visual, operator-pending)'

      entry do
        notes 'Text object selections refer to text around the cursor.'
      end

      entry do
        command 'af'
        command 'if'
        name 'Select COMPOUND FORMS'
      end

      entry do
        command 'aF'
        command 'iF'
        name 'Select *top-level* COMPOUND FORMS'
      end

      entry do
        command 'as'
        command 'is'
        name 'Select STRINGS'
      end

      entry do
        command 'ae'
        command 'ie'
        name 'Select ELEMENTS'
      end
    end

    category do
      id 'Text Object Motions (normal, visual, operator-pending)'

      entry do
        notes 'Text object motions move the cursor in normal mode, extend selections in visual mode, and refer to text defined by the movement of the cursor in operator-pending mode.'
      end

      entry do
        command '('
        command ')'
        name 'Move the cursor to the nearest paired structural bracket'
      end

      entry do
        command '<M-b>'
        command '<M-w>'
        name 'Move the cursor ELEMENT-wise, ending on an element head'
        notes 'Analogous to builtin `b` and `w` motions.'
      end

      entry do
        command 'g<M-e>'
        command '<M-e>'
        name 'Move the cursor ELEMENT-wise, ending on an element tail'
        notes 'Analogous to builtin `ge` and `e` motions.'
      end

      entry do
        command '[['
        command ']]'
        name 'Move the cursor to an adjacent *top-level* ELEMENT'
      end

      entry do
        command '[e'
        command ']e'
        name 'Select an adjacent ELEMENT'
      end

    end

    category do
      id 'Indent Commands (normal)'

      entry do
        command '=='
        name 'Indents the current COMPOUND FORM without moving the cursor'
      end

      entry do
        command '=-'
        name 'Indents the current *top-level* COMPOUND FORM without moving the cursor'
      end

    end

    category do
      id 'Wrap Commands (normal, visual)'

      entry do
        notes <<-'END'
          Wrap commands wrap the current COMPOUND FORM, ELEMENT, or visual selection and place the cursor at the head or tail of the newly created COMPOUND FORM.
          If `g:sexp_insert_after_wrap` is set (true by default), insert mode is entered after wrapping.
        END
      end

      entry do
        command '<LocalLeader>i'
        command '<LocalLeader>I'
        command 'ysaf)'
        name 'Wrap the current COMPOUND FORM with `(` and `)`'
      end

      entry do
        command '<LocalLeader>['
        command '<LocalLeader>]'
        command 'ysaf]'
        name 'Wrap the current COMPOUND FORM with `[` and `]`'
      end

      entry do
        command '<LocalLeader>{'
        command '<LocalLeader>}'
        command 'ysaf}'
        name 'Wrap the current COMPOUND FORM with `{` and `}`'
      end

      entry do
        command '<LocalLeader>W'
        command '<LocalLeader>w'
        command 'cse('
        command 'cse)'
        command 'cseb'
        name 'Wrap the current ELEMENT with `(` and `)`'
      end

      entry do
        command '<LocalLeader>e['
        command '<LocalLeader>e]'
        command 'cse['
        command 'cse]'
        name 'Wrap the current ELEMENT with `[` and `]`'
      end

      entry do
        command '<LocalLeader>e{'
        command '<LocalLeader>e}'
        command 'cse{'
        command 'cse}'
        name 'Wrap the current ELEMENT with `{` and `}`'
      end

    end

    category do
      id 'List Manipulation (normal, visual)'

      entry do
        notes 'List manipulation commands change the structure of COMPOUND FORMS. If these commands are called from visual mode, the selection is used in place of the current COMPOUND FORM or ELEMENT.'
      end

      entry do
        command '<LocalLeader>@'
        command 'dsf'
        name 'Splice the current COMPOUND FORM into its parent'
      end

      entry do
        command '<LocalLeader>o'
        name 'Raise the current COMPOUND FORM to replace the enclosing COMPOUND FORM'
      end

      entry do
        command '<LocalLeader>O'
        name 'Raise the current ELEMENT to replace the enclosing COMPOUND FORM'
      end

      entry do
        command '<M-k>'
        command '<M-j>'
        name 'Swap the position of the current COMPOUND FORM with a sibling ELEMENT'
      end

      entry do
        command '<M-h>'
        command '<M-l>'
        name 'Swap the position of the current ELEMENT with a sibling ELEMENT'
      end

      entry do
        command '<M-S-j>'
        command '<M-S-k>'
        command '>('
        command '<)'
        name 'Emit the terminal ELEMENTS of the current COMPOUND FORM'
        notes 'Also known as `barfage`.'
      end

      entry do
        command '<M-S-h>'
        command '<M-S-l>'
        command '<('
        command '>)'
        name 'Capture adjacent ELEMENTS into the current COMPOUND FORM (slurpage)'
        notes 'Also knwon as `slurpage`.'
      end
    end

    category do
      id 'Cursor Insertion (normal)'

      entry do
        command '<LocalLeader>h'
        command '<I'
        name 'Insert the cursor at the head of the current COMPOUND FORM'
      end

      entry do
        command '<LocalLeader>l'
        command '>I'
        name 'Insert the curser at the tail of the current COMPOUND FORM'
      end

    end

    notes <<-'END'
    * Based on the docs of the vim plugin from [vim-sexp](https://github.com/guns/vim-sexp).
    * Some bindings require tpope's plugin [vim-sexp-mappings-for-regular-people](https://github.com/tpope/vim-sexp-mappings-for-regular-people)
      and [surround.vim](https://github.com/tpope/vim-surround).
    * This is automatically built now.
    * Converted by [Remo Koch](https://github.com/rkoch).
    END
end