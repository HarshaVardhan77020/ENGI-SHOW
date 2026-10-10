const $ = (id) => document.getElementById(id);
const loginView = $("loginView"), otpView = $("otpView"), dashboardView = $("dashboardView");
let profile = {};

const modules = [
  {name:"Basics", icon:"📘", desc:"Build strong foundations with beginner-friendly lessons.", years:[1,2]},
  {name:"Theory", icon:"📚", desc:"Understand important concepts, topic by topic.", years:[1,2,3,4]},
  {name:"Diagrams", icon:"📐", desc:"Review labelled diagrams and visual explanations.", years:[1,2]},
  {name:"Practicals", icon:"🧪", desc:"Follow lab guides, tasks, and practical checklists.", years:[1,2,3,4]},
  {name:"Question Bank", icon:"📝", desc:"Practise sample questions for revision and exams.", years:[1,2]},
  {name:"Quizzes", icon:"🎯", desc:"Test your understanding and track your scores.", years:[1,2,3,4]},
  {name:"Attendance", icon:"📅", desc:"View class and practical attendance records.", years:[1,2,3,4]},
  {name:"Interview Preparation", icon:"💬", desc:"Practise common technical and HR interview questions.", years:[3,4]},
  {name:"Soft Skills", icon:"🤝", desc:"Improve communication, teamwork, and presentation skills.", years:[3,4]},
  {name:"Projects", icon:"🛠️", desc:"Plan projects, record milestones, and build a portfolio.", years:[3,4]},
  {name:"Career & Jobs", icon:"🚀", desc:"Explore career paths, internships, and partner openings.", years:[3,4]},
  {name:"Certificate", icon:"🏅", desc:"Review the criteria for a performance-based certificate.", years:[1,2,3,4]}
];
function showToast(message){const toast=$("toast");toast.textContent=message;toast.classList.add("show");clearTimeout(showToast.timer);showToast.timer=setTimeout(()=>toast.classList.remove("show"),3200)}
$("mobile").addEventListener("input",e=>e.target.value=e.target.value.replace(/\D/g,"").slice(0,10));
$("otp").addEventListener("input",e=>e.target.value=e.target.value.replace(/\D/g,"").slice(0,6));

$("loginForm").addEventListener("submit",e=>{
  e.preventDefault();
  if(!$("loginForm").reportValidity()) return;
  profile={name:$("studentName").value.trim(),mobile:$("mobile").value,email:$("email").value.trim(),branch:$("branch").value,year:$("year").value};
  if(profile.mobile.length!==10){showToast("Please enter a valid 10-digit mobile number.");return}
  otpView.hidden=false;loginView.hidden=true;
});
$("backBtn").addEventListener("click",()=>{otpView.hidden=true;loginView.hidden=false});
$("otpForm").addEventListener("submit",e=>{
  e.preventDefault();
  if($("otp").value!=="123456"){showToast("For this demo, use OTP 123456.");return}
  otpView.hidden=true;dashboardView.hidden=false;$("logoutBtn").hidden=false;
  $("helloName").textContent=profile.name.split(" ")[0]||"Student";
  $("studentMeta").textContent=`${profile.branch} • ${profile.year} • ${profile.email}`;
  $("subjectYear").value=profile.year;
  renderModules();window.scrollTo({top:0,behavior:"smooth"});
});
$("subjectYear").addEventListener("change",renderModules);
$("logoutBtn").addEventListener("click",()=>{dashboardView.hidden=true;loginView.hidden=false;$("logoutBtn").hidden=true;$("otp").value="";window.scrollTo({top:0,behavior:"smooth"})});

function renderModules(){
  const yearNum=parseInt($("subjectYear").value,10);
  const shown=modules.filter(m=>m.years.includes(yearNum));
  $("moduleGrid").innerHTML=shown.map(m=>`<article class="module-card"><div class="module-icon">${m.icon}</div><h3>${m.name}</h3><p>${m.desc}</p><button type="button" data-module="${m.name}">Open module →</button></article>`).join("");
}
document.addEventListener("click",e=>{
  const btn=e.target.closest("[data-module]");
  if(!btn)return;
  const module=btn.dataset.module;
  const details={
    "Basics":"Basics module: start with introductory lessons and key terms. Add your approved syllabus content in the production version.",
    "Theory":"Theory module: organise notes by branch, semester, subject, and syllabus year.",
    "Diagrams":"Diagrams module: add labelled diagrams and accessible descriptions.",
    "Practicals":"Practicals module: add lab manuals, safety notes, submissions, and instructor-verified marks.",
    "Question Bank":"Question Bank: add past papers and sample questions after checking usage permissions.",
    "Quizzes":"Quizzes: this prototype uses sample scores. A production quiz needs a question database and server-side scoring.",
    "Attendance":"Attendance: sample attendance is displayed. Real attendance must be recorded by authorised faculty or a trusted system.",
    "Interview Preparation":"Interview preparation: practise technical questions, HR questions, and mock interviews.",
    "Soft Skills":"Soft skills: practise communication, teamwork, presentations, and professional writing.",
    "Projects":"Projects: keep project descriptions, milestones, team roles, and portfolio links.",
    "Career & Jobs":"Career & Jobs: company listings require verified partners and real application links.",
    "Certificate":"Certificate rules: define transparent criteria for quizzes, attendance, and practicals. Only issue verified certificates through the institution or authorised partner."
  };
  showToast(details[module]||`${module} module selected.`);
});
