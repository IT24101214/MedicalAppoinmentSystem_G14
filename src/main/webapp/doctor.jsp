<!-- doctor.jsp -->
<html>
<head><title>Doctor Management</title></head>
<body>
<h2>Add or Update Doctor</h2>
<form action="DoctorServlet" method="post">
  <input type="hidden" name="action" value="add" /> <!-- Change to 'update' for updates -->
  ID: <input type="text" name="doctorId" required /><br/>
  Name: <input type="text" name="name" required /><br/>
  Specialization: <input type="text" name="specialization" /><br/>
  Email: <input type="email" name="email" /><br/>
  Phone: <input type="text" name="phone" /><br/>
  Qualification: <input type="text" name="qualification" /><br/>
  Experience (years): <input type="number" name="yearsOfExperience" /><br/>
  Time Slot: <input type="text" name="timeSlot" /><br/>
  Languages: <input type="text" name="languages" /><br/>
  <input type="submit" value="Submit" />
</form>
</body>
</html>