package com.getsocio

class SecurityQuestion {

    static final String QUEST1 = "What is the name of your first pet?"
    static final String QUEST2 = "What is the make of your first bike?"
    static final String QUEST3 = "What is your birth city?"

    String question

    static constraints = {
        question nullable: false, blank: false
    }

    static values() {
        return [QUEST1, QUEST2, QUEST3]
    }
}
