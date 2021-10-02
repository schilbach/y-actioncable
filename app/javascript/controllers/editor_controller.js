import { Controller } from "@hotwired/stimulus"
import { Editor } from '@tiptap/core'
import { Document } from '@tiptap/extension-document'
import { Paragraph } from '@tiptap/extension-paragraph'
import { Text } from '@tiptap/extension-text'

import Collaboration from '@tiptap/extension-collaboration'
import * as Y from 'yjs'
import { ActionCableProvider } from 'lib/y-actioncable'


// Connects to data-controller="editor"
export default class extends Controller {
    connect() {
        const ydoc = new Y.Doc()
        const provider = new ActionCableProvider("YjsChannel", this.element.getAttribute("data-id"), ydoc)
        
        new Editor({
            element: this.element,
            extensions: [
                Document,
                Paragraph,
                Text ,
                Collaboration.configure({
                     document: ydoc,
                 })
            ],
        });
        
    }
}
