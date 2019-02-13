// var app = new Vue({
//   el: '#app',
//    current: 0,
//   data: {
//     current: 0,
//     quizes: ['aaa','bbb','ccc','ddd','eee','fff '],
//   },
//   methods: {
//     current: 0,
//     next: function () {
//       this.current += 1;
//       alert('yo')
//     }
//   }
// })


new Vue({
  el: '#app',
  
  data: {
    index: 0,

    quizes: 
    [
      {
        title: "What of the following is the default value of a local variable?",
        choices: ["A - null", "B - 0", "C - Depends upon the type of variable", "D - Not assigned"],
        explanation: "Local variables are not assigned any value by default.",
        answer: "D"
      },
      {
        title: "What is the size of float variable?",
        choices: ["A - 8 bit", "B - 16 bit", "C - 32 bit", "D - 64 bit"],
        explanation: "The float data type is represented by single-precision 32-bit IEEE 754 floating point.",
        answer: "C"
      },
      {
       title: "What is polymorphism?",
       choices: ["A - Polymorphism is a technique to define different objects of same type.", "B - Polymorphism is the ability of an object to take on many forms.", "C - Polymorphism is a technique to define different methods of same type.", "D - None of the above."],
       explanation: "Polymorphism is the ability of an object to take on many forms. The most common use of polymorphism in OOP occurs when a parent class reference is used to refer to a child class object.",
       answer: "B"
     }
    ] // quizes
  }, // data

  methods: {
    say: function (message) 
    {
      alert(message)
    },

    next: function () 
    {
      //console.log("len=" + this.quizes.length);
      //console.log("quiz 0=" + this.quizes[0]);
      if (this.index < this.quizes.length-1) 
      {
        this.index += 1
      }
    },
    prev: function () 
    {
      if (this.index > 0) 
      {
        this.index -= 1
      }
     
    },

    quiz: function  () 
    {
      return this.quizes[this.index]
    }



  }
})


