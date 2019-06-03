// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require bootstrap
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function ($) {
        $(document).ajaxStart(function () {
            $('#spinner').fadeIn();
        }).ajaxStop(function () {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}

function removeImage(id) {
    var userId = $('#fullName').val()
    $.ajax({
        url: "image/removeImage",
        type: 'POST',
        data: {
            userId: userId
        },
        dataType: 'json',
        success: function (data) {
            if (data.imageRemoved == true) {
                $('#profilePhoto').remove();
                $('#removeImageButton').remove();
                $('#successMessage').text('Photo is successfully removed')
                valid = true
            }

            else {
                $('#errorMessage').text('Photo cant be removed, please try later');
                $('#errorMessage').removeClass('hideOnLoad');
                //$('#userId').addClass('error-field');
                valid = false;
            }
        }
    });
}

function fetchComments(obj) {
    var $this = $(obj)
    var postName = $this.parent().find('.postName').text().trim()
    var userName = $('#userDetails').find('.userName').text().trim()
    var comment = $this.next()
    var valid;
    valid = fetchCommentsThroughAjax(postName, userName, comment, $this, 'isHomePage')
    return valid;
}

function commentOnPost(obj) {
    var $this = $(obj);
    var comment = $this.prev().val().trim()
    var commentDiv = $this.parent();
    var postName = $this.parent().parent().find('.postName').text().trim()
    var userName = $('#userDetails').find('.userName').text().trim()
    commentDiv.find("#errorMessageSpan").remove()
    commentDiv.find('#successMessageSpan').remove();
    var valid;
    if (comment == '') {

        $this.prev().before('<span style="color:red;font-size:9px" id="errorMessageSpan">Comment is Required<span><br>');
        valid = false
    }
    else {
        valid = commentOnPostThroughAjax(postName, userName, comment, commentDiv, $this, 'isHomePage')
    }
    return valid;
}


function fetchCommentsOnTimeLine(obj) {
    var $this = $(obj)
    var postName = $this.parent().find('.postContent').text().trim()
    var userName = $('#userName').text().trim()
    var commentDiv = $this.next()
    var valid;
    valid = fetchCommentsThroughAjax(postName, userName, commentDiv, $this, 'isTimeline');
    return valid
}

function commentOnPostThroughTimeLine(obj) {
    var $this = $(obj);
    var comment = $this.prev().val().trim()
    var commentDiv = $this.parent();
    var postName = $this.parent().parent().find('.postContent').text().trim()
    var userName = $('#userName').text().trim()
    commentDiv.find("#errorMessageSpan").remove()
    commentDiv.find("#successMessageSpan").remove()
    var valid;
    if (comment == '') {
        $this.prev().before('<span style="color:red;font-size:9px" id="errorMessageSpan">Comment is Required<span><br>');
        valid = false
    }
    else {
        valid = commentOnPostThroughAjax(postName, userName, comment, commentDiv, $this, 'isTimeline')
    }
    return valid;
}

function fetchCommentsThroughAjax(postName, userName, commentDiv, $this, page) {
    $this.parent().find('#spinner').fadeIn();
    var nameOfFunction;
    if (page == 'isHomePage') {
        nameOfFunction = 'commentOnPost(this)'
    }
    else {
        nameOfFunction = 'commentOnPostThroughTimeLine(this)'
    }
    var valid;
    $.ajax({
        url: "comment/commentsOnPost",
        type: 'POST',
        data: {
            postName: postName,
        },
        dataType: 'json',
        success: function (data) {
            if (data.noComments == true) {
                commentDiv.append('No Comments <br>');
                commentDiv.removeClass('hideOnLoad');
                commentDiv.append('<br><input type="text" value="" name="commentOnPostText" id="commentOnPostText" class="commentOnPost"><input class="linkLikeButton" onclick="' + nameOfFunction + '" value="Comment" type="button" id="commentOnPost">');
                $this.addClass('hideOnLoad')
                valid = true
            }

            else {
                for (var i = 0; i < data.comments.length; i++) {
                    var id = data.commentId[i]
                    var editImagePath = '<a href="#" onclick="if(!editComment(this,' + id + ')) return false"><img src="../images/edit_image.png" alt="edit" width="20px" height="20px" title="edit"/></a>'
                    var deleteImagePath = '<a href="#" onclick="if(!confirmDeleteComment(this,' + id + ')) return false"><img src="../images/delete_image.png" alt="delete" width="20px" height="20px" title="delete"/></a>'

                    if (userName == data.byUser[i]) {
                        commentDiv.append('<li id="' + data.commentId[i] + '">' + data.comments[i] + ' -- ' + 'Me   ' + editImagePath + " " + deleteImagePath + '</li>');
                    }
                    else {
                        commentDiv.append('<li>' + data.comments[i] + ' -- ' + data.byUser[i] + '</li>');
                    }
                }
                commentDiv.removeClass('hideOnLoad');
                commentDiv.append('<br><input type="text" value="" name="commentOnPostText" id="commentOnPostLinkText" class="commentOnPost"><input class="linkLikeButton" onclick="' + nameOfFunction + '" value="Comment" type="button" id="commentOnPost">');
                $this.addClass('hideOnLoad')
                valid = true;
            }
        }
    });
    $this.parent().find('#spinner').fadeOut();
    return valid
}

function commentOnPostThroughAjax(postName, userName, comment, commentDiv, $this, page) {
    $this.parent().parent().find('#spinner').fadeIn();
    if (page == 'isHomePage') {
        nameOfFunction = 'commentOnPost(this)'
    }
    else {
        nameOfFunction = 'commentOnPostThroughTimeLine(this)'
    }
    var valid;
    $.ajax({
        url: "comment/saveComment",
        type: 'POST',
        data: {
            comment: comment,
            postName: postName
        },
        dataType: 'json',
        success: function (data) {
            if (data.isSave == true) {
                commentDiv.html("")
                for (var i = 0; i < data.fetchCommentResponse.comments.length; i++) {
                    var id = data.fetchCommentResponse.commentId[i]
                    var editImagePath = '<a href="#" onclick="if(!editComment(this,' + id + ')) return false"><img src="../images/edit_image.png" alt="edit" width="20px" height="20px" title="edit"/></a>'
                    var deleteImagePath = '<a href="#" onclick="if(!confirmDeleteComment(this,' + id + ')) return false"><img src="../images/delete_image.png" alt="delete" width="20px" height="20px" title="delete"/></a>'
                    if (userName == data.fetchCommentResponse.byUser[i]) {
                        commentDiv.append('<li>' + data.fetchCommentResponse.comments[i] + ' -- ' + 'Me   ' + editImagePath + " " + deleteImagePath + '</li>');
                    }
                    else {
                        commentDiv.append('<li>' + data.fetchCommentResponse.comments[i] + ' -- ' + data.fetchCommentResponse.byUser[i] + '</li>');
                    }
                }
                commentDiv.removeClass('hideOnLoad');
                commentDiv.append('<br><input type="text" value="" name="commentOnPostText" id="commentOnPostText" class="commentOnPost"><input class="linkLikeButton" onclick="' + nameOfFunction + '" value="Comment" type="button" id="commentOnPost">');
                valid = true;
            }

            else {
                //$this.prev().remove();
                //$this.remove()
                commentDiv.find('#errorMessageSpan').remove();
                commentDiv.append('<span style="color:red;font-size:9px" id="errorMessageSpan"><br>Some error occurred. Please try again later<span>');

                valid = true;
            }
        }
    });
    $this.parent().parent().find('#spinner').fadeOut();
    return valid;
}


function confirmDeleteComment(obj, id) {
    var $this = $(obj)
    var commentDiv = $this.parent().parent();
    commentDiv.find('#successMessageSpan').remove();
    commentDiv.find('#errorMessageSpan').remove();
    var resp = confirm('Are You Sure you want to delete comment');
    if (resp == true) {
        $this.parent().parent().parent().find('#spinner').fadeIn();
        $.ajax({
            url: "comment/deleteComment",
            type: 'POST',
            data: {
                id: id,
            },
            dataType: 'json',
            success: function (data) {
                if (data.isDeleted == true) {
                    $this.parent().remove();
                    commentDiv.find('#successMessageSpan').remove();
                    commentDiv.append('<span style="color:green;font-size:9px" id="successMessageSpan"><br>Successfully Deleted<span>');
                }
                else {
                    commentDiv.find('#errorMessageSpan').remove();
                    commentDiv.append('<span style="color:red;font-size:9px" id="errorMessageSpan"><br>Some error occurred. Please try again later<span>');
                }
            }
        });
    }
    $this.parent().parent().parent().find('#spinner').fadeOut();
    return false;
}

function editComment(obj, id) {
    $this = $(obj)
    var commentDiv = $this.parent().parent();
    var post
    /*if(page == "isHomePage")
    {
        post = $this.parent().parent().parent().find('.postName').text()
    }
    else
    {
        post = $this.parent().parent().parent().find('.postContent').text()
    }*/
    post = $this.parent().parent().parent().find('.postName,.postContent').text()
    var commentData = $this.parent().text().trim()
    var comment = commentData.substr(0, commentData.indexOf('--'))
    var rest = commentData.substr(commentData.indexOf('--'), commentData.length)
    var newComment = prompt(post, comment);
    var editImagePath = '<a href="#" onclick="if(!editComment(this,' + id + ')) return false"><img src="../images/edit_image.png" alt="edit" width="20px" height="20px" title="edit"/></a>'
    var deleteImagePath = '<a href="#" onclick="if(!confirmDeleteComment(this,' + id + ')) return false"><img src="../images/delete_image.png" alt="delete" width="20px" height="20px" title="delete"/></a>'
    commentDiv.find('#successMessageSpan').remove();
    commentDiv.find('#errorMessageSpan').remove();
    if (newComment != "" && newComment != null) {
        $.ajax({
            url: "comment/updateComment",
            type: 'POST',
            data: {
                id: id,
                comment: newComment
            },
            dataType: 'json',
            success: function (data) {
                if (data.isUpdated == true) {
                    commentDiv.find('#successMessageSpan').remove();
                    commentDiv.append('<span style="color:green;font-size:9px" id="successMessageSpan"><br>Successfully Updated<span>');
                    $this.parent().html(newComment + " " + rest + " " + editImagePath + deleteImagePath)
                }
                else {
                    commentDiv.find('#errorMessageSpan').remove();
                    commentDiv.append('<span style="color:red;font-size:9px" id="errorMessageSpan"><br>Some error occurred. Please try again later<span>');
                }
            }
        });
    }

    else if (newComment != null) {
        var resp = confirm('Are You Sure you want to remove comment');
        if (resp == true) {
            $this.parent().parent().parent().find('#spinner').fadeIn();
            $.ajax({
                url: "comment/deleteComment",
                type: 'POST',
                data: {
                    id: id,
                },
                dataType: 'json',
                success: function (data) {
                    if (data.isDeleted == true) {
                        $this.parent().remove();
                        commentDiv.find('#successMessageSpan').remove();
                        commentDiv.append('<span style="color:green;font-size:9px" id="successMessageSpan"><br>Successfully Deleted<span>');
                    }
                    else {
                        commentDiv.find('#errorMessageSpan').remove();
                        commentDiv.append('<span style="color:red;font-size:9px" id="errorMessageSpan"><br>Some error occurred. Please try again later<span>');
                    }
                }
            });
        }
    }
    $this.parent().parent().parent().find('#spinner').fadeOut();
    return false
}
