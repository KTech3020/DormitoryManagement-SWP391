<!-- Section --><%@page contentType="text/html" pageEncoding="utf-8" %>
<section>
    <header style="text-align: center">
        <h1>THÔNG TIN LIÊN HỆ</h1>
    </header>
    <br>
    <div id ="left">
        <p>Truy cập link fanpage kí túc xá, website và số điện thoại liên lạc để biết thêm chi tiết.<p>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15343.455743782128!2d108.24210267925626!3d15.968480413953602!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCAoRlBUIHVuaXZlcnNpdHkp!5e0!3m2!1sen!2s!4v1685981467153!5m2!1sen!2s" width="420" height="290" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
    <div id ="right">
        <span style="color: red">${mess}</span>
        <form action="ContactServlet" method="post">  
            <!-- Name input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="form4Example1">Name</label>
                <input type="text" id="form4Example1" class="form-control" name="username"/>
            </div>
            <!-- Email input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="form4Example2">Email address</label>
                <input type="email" id="form4Example2" class="form-control" name="email"/>
            </div>
            <!-- Message input -->
            <div class="form-outline mb-4">
                <label class="form-label" for="form4Example3">Message</label>
                <textarea class="form-control" id="form4Example3" rows="5" name="message"></textarea>
            </div>
            <br>
            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-block mb-4">Send</button>
        </form>
    </div>
</section>
<style>
#left{
    width: 50%;
    float: left;
    padding: 2%;
}
#right{
    width: 47%;
    float: left;
    margin-left: 2%;
    padding: 1%;
}
</style>
</div></div>