package com.getsocio

class PostService {

/** function to find out the time elapsed for a Post
 * @author 547563 ( Anshul )
 * @param userPostsList
 * @return postTimeList
 */
    def timeOfPosts(userPostsList) {
        def postTimeList = []
        def postDateCalHours
        def todayDateCalHours
        def postDateCalMins
        def todayDateCalMins
        def postDateCalDays
        def todayDateCalDays
        def postDateCalMonths
        def todayDateCalMonths
        Date postDate
        Calendar todayDateCal = Calendar.getInstance();
        Calendar postDateCal = Calendar.getInstance()
        userPostsList.each {
            it

            postDate = it.dateCreated
            postDateCal.setTime(postDate)
            postDateCalMins = postDateCal.getTime().getMinutes()
            todayDateCalMins = todayDateCal.getTime().getMinutes()
            postDateCalHours = postDateCal.getTime().getHours()
            todayDateCalHours = todayDateCal.getTime().getHours()
            postDateCalDays = postDateCal.getTime()
            todayDateCalDays = todayDateCal.getTime()
            postDateCalMonths = postDateCal.getTime().getMonth()
            todayDateCalMonths = todayDateCal.getTime().getMonth()

            def postTime = postDateCal.getTime()
            def todayTime = todayDateCal.getTime()

            if ((todayDateCalMonths - postDateCalMonths) > 1) {
                postTimeList.add((todayDateCalMonths - postDateCalMonths) + ' months ago')
            } else if ((todayDateCalMonths - postDateCalMonths) == 1 && (todayDateCal - postDateCal) >= 30) {
                postTimeList.add((todayDateCalMonths - postDateCalMonths) + ' month ago')
            } else {
                if ((todayDateCalDays - postDateCalDays) > 1) {
                    postTimeList.add((todayDateCalDays - postDateCalDays) + ' days ago')
                } else if ((todayDateCalDays - postDateCalDays) == 1 && (todayDateCalHours + 24 - postDateCalHours) > 23) {
                    postTimeList.add(todayDateCalDays - postDateCalDays + ' day ago')
                } else if ((todayDateCalDays - postDateCalDays) == 1 && (todayDateCalHours + 24 - postDateCalHours) <= 23) {
                    postTimeList.add((todayDateCalHours + 24 - postDateCalHours) + ' hours ago')
                } else {
                    if ((todayDateCalHours - postDateCalHours) > 1) {
                        postTimeList.add((todayDateCalHours - postDateCalHours) + ' hours ago')
                    } else if ((todayDateCalHours - postDateCalHours) == 1 && (60 + todayDateCalMins - postDateCalMins) >= 59) {
                        postTimeList.add((todayDateCalHours - postDateCalHours) + ' hour ago')
                    } else {
                        if ((todayDateCalHours - postDateCalHours) == 1 && (60 + todayDateCalMins - postDateCalMins) < 59) {
                            postTimeList.add((todayDateCalMins - postDateCalMins + 60) + ' mins ago')
                        } else if ((todayDateCalHours - postDateCalHours) == 0) {
                            if ((todayDateCalMins - postDateCalMins) > 1) {
                                postTimeList.add((todayDateCalMins - postDateCalMins) + ' mins ago')
                            } else {
                                postTimeList.add((todayDateCalMins - postDateCalMins) + ' min ago')
                            }
                        }

                    }
                }
            }
        }
        return postTimeList
    }
}
