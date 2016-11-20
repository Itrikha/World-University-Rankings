filename ranking
  "\\vmware-host\Shared Folders\Desktop\Courses\Multivariate-652\FinalProject\Rankings.csv";

data Rankings;
 infile ranking  delimiter = ','  missover;
 input world_rank
	  institution  $
	  country	   $
      national_rank	
      quality_of_education	
      alumni_employment	
      quality_of_faculty	
      publications	
      influenc
      citations	
      broad_impact
      patents
      score
      year
;

run;


data Rankings_2012;
set rankings;
where 
year<2013;
run;

proc reg data=rankings_2012;

	model world_rank =  national_rank quality_of_education alumni_employment quality_of_faculty publications influenc citations broad_impact patents  /STB VIF dwProb selection=MAXR;

	OUTPUT OUT=regout_world_ranking  PREDICTED=predict   RESIDUAL=Res 
                      L95M=l95m  U95M=u95m  L95=l95 U95=u95
       rstudent=rstudent h=lev cookd=Cookd  dffits=dffit
     STDP=s_predicted  STDR=s_residual  STUDENT=student    ;  


run;
