$(document).ready(function() {
   $('#calcBtn').on('click', calculate);
   function calculate(){
        let col=$('#selected').val();
        let th=$('th');
        let index;
        for(let i=0;i<th.length;i++){
            if($(th[i]).text()==col){
                index=i;
            }
        }
        let rows=$('.data');
        let sum=0;
        for(let i=0;i<rows.length;i++){
            sum+=Number($(rows[i]).children().eq(index).text());
        }
        $('#result').text(sum);
   } 
});