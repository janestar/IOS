//
//  CalculatorViewController.m
//  Calculator
//
//  Created by JANESTAR on 14-11-5.
//  Copyright (c) 2014年 JANESTAR. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
   

@property (nonatomic) BOOL isInTheMiddleofinput;
@property (nonatomic,strong)CalculatorBrain *brain;
@property (nonatomic) BOOL flag;
@property (nonatomic) BOOL mark;
@property double value;
@property (nonatomic) BOOL mark2;
@property (nonatomic) BOOL mark3;
@property  (nonatomic)BOOL mark4;
@end

@implementation CalculatorViewController
@synthesize brain=_brain;

-(CalculatorBrain*)brain{
    if(!_brain){
        _brain=[[CalculatorBrain alloc]init];
    
    }
    return _brain;


}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString* digit=[sender currentTitle];
   
    //NSLog(@"ths num is %@",digit);
    if(self.isInTheMiddleofinput){
        if([digit isEqualToString:@"."]&&self.flag==YES){}
        else if([digit isEqualToString:@"."]&&self.flag==NO){self.flag=YES;
        self.display.text=[self.display.text stringByAppendingString:digit];
            self.display2.text=[self.display2.text stringByAppendingString:digit];
        }
        else {self.display.text=[self.display.text stringByAppendingString:digit];
            self.display2.text=[self.display2.text stringByAppendingString:digit];

        }
        
    }else{
       
        if([digit isEqualToString:@"."]){
           self.display.text=[self.display.text stringByAppendingString:digit];
           self.display2.text=[self.display2.text stringByAppendingString:digit];
            printf("flag is %d\n",self.flag);
            self.flag=YES;
          
        }else{
            self.display.text=digit;
           self.display2.text=[self.display2.text stringByAppendingString:digit];

        }
        self.isInTheMiddleofinput=YES;
    }
    
  
    
}

-(void)check:(NSString*)c{
    NSString* s=[self.brain.operandStack lastObject];
    NSLog(@"the opreand3 is%@",s);
   
    int t=[self.brain.operatorStack count];
    printf("tt is %d\n",t);
    if(s==nil){
        printf("i have get in\n");
        [self.brain.operandStack addObject:c];
        return;
    }
    int x=[self.brain getPrior:c];
    if(x==-1){
        if([c isEqualToString:@"("])
        {
            [self.brain.operandStack addObject:c];
        }
        else{
            if([s isEqualToString:@")"]||[s isEqualToString:@"("]){
                printf("mark2 is there\n");
                self.mark2=YES;
                return;
                }
            while((![s isEqualToString:@"("])&&(s!=nil)){
                [self.brain.operandStack removeLastObject];
                [self.brain pushOperator:s];
                s=[self.brain.operandStack lastObject];
            }
            [self.brain.operandStack removeLastObject];
        
    }
    }
    else{
        if([self.brain getPrior:s]<[self.brain getPrior:c]){
            [self.brain pushOperand:c];
            printf("is there\n");
        }
        else{
             printf("so what \n");
            [self.brain.operandStack removeLastObject];
            [self.brain.operatorStack addObject:s];
            [self check:c];
            
        
        }
    
    
    
    }
    
    
    
    
    
    
    
}


- (IBAction)operationPressed:(UIButton *)sender {
  //  BOOL boo= self.isInTheMiddleofinput;
  //  NSString* s= self.display.text;
   // NSLog(@"hello %@",s);
    //if(boo){printf("true\n");}
    
   // NSString* s=[self.brain.operandStack lastObject];
    //NSLog(@"the opreand is%@",s);
    if(self.mark){
        self.display2.text=self.display.text;
        self.mark=NO;
    }
   
   // NSString* s3=[self.brain.operatorStack lastObject];
  //  NSLog(@"the**** is%@",s3);
  //  self.brain.operatorStack_copy=[self.brain.operatorStack mutableCopy];
  //  NSString* s5=[self.brain.operatorStack_copy lastObject];
    
  //  NSLog(@"the****s5 is%@",s5);
  //  self.brain.operandStack_copy=[self.brain.operandStack mutableCopy];
    
    if(self.isInTheMiddleofinput){
        printf("world is nice\n");
        [self enterPressed];
        self.mark3=NO;
       }
    NSString* last=[self.brain.origin lastObject];
    NSLog(@"the lastobj is%@",last);
    //NSString* s2=[self.brain.operandStack lastObject];
    //NSLog(@"the xxxxx is%@",s2);
   
       NSString* oper=[sender currentTitle];
    
   /// NSString* s4=[self.brain.operandStack_copy lastObject];
  //  NSLog(@"the xxxxxs4 is%@",s4);
    
 
    
    
   // BOOL x=[last isEqual:oper];
   // if(x){
    
     //   printf("the x isfasdf\n");
   // }
    /*
        

        */
        
    
  //  int x=[self.brain getPrior:last];
      // printf(" x%d\n",x);
    //if((x==0||x==1)&&(y==0){
    BOOL f1=([last isEqual:@"+"]||[last isEqual:@"-"]||[last isEqual:@"x"]||[last isEqual:@"/"]);
    BOOL f2=[oper isEqual:@"+"]||[oper isEqual:@"-"]||[oper isEqual:@"x"]||[oper isEqual:@"/"];
    
    if((f2&&f1)){
        printf("liu liang jian\n");
        int len=[last length];
        [self.brain.origin removeLastObject];
        int total=[self.display2.text length];
        // NSLog(@"s is %@",s);
        NSString* s2=[self.display2.text substringToIndex:(total-len)];
        
        self.display2.text=s2;
       // self.brain.operandStack=[self.brain.operandStack_copy mutableCopy];
       // self.brain.operatorStack=[self.brain.operatorStack_copy mutableCopy];
       // int x=[self.brain.operandStack count];
       // int y=[self.brain.operatorStack count];
       // int m=[self.brain.operandStack_copy count];
       // int n=[self.brain.operatorStack_copy count];
       // printf("x is%d y is %d m %d n%d\n",x,y,m,n);
        //NSString* z=[self.brain.operatorStack lastObject];
       // NSString* z2=[self.brain.operandStack lastObject];
       /// NSString* z3=[self.brain.operatorStack_copy lastObject];
        //NSString* z4=[self.brain.operandStack_copy lastObject];
        //NSLog(@"the oper is%@ the oprand is%@ cc %@ cc %@",z,z2,z3,z4);
    //}
   // } }*/
        [self.brain.operatorStack removeAllObjects];
        [self.brain.operandStack removeAllObjects];
        for(NSString* s in self.brain.origin){
            NSLog(@"the s is%@",s);
            BOOL f1=([s isEqual:@"+"]||[s isEqual:@"-"]||[s isEqual:@"x"]||[s isEqual:@"/"]||[s isEqualToString:@"("]||[s isEqual:@")"]);
            if(!f1){
                [self.brain pushOperator:s];
                self.isInTheMiddleofinput=NO;
                self.flag=NO;
            }
            else{
                [self check:s];
                
            }
            
            
        }

        
        

    }
    self.display2.text=[self.display2.text stringByAppendingString:oper];
    [self.brain.origin addObject:oper];
    //self.brain.operatorStack_copy=[self.brain.operatorStack_copy mutableCopy];
     
    NSLog(@"the operand2 is %@",oper);
    

    [self check:oper];
   
    NSLog(@"the oper is%lu ",(unsigned long)[self.brain.operandStack count]);
    //[self.brain pushOperand:oper];
    //self.display.text=[self.display.text stringByAppendingString:oper];
    NSLog(@"the text is%@",self.display.text);
    
    
    //double result=[self.brain performOperation:sender.currentTitle];
 // NSString *resultString=[NSString stringWithFormat:@"%g",result];
  //self.display.text=resultString;
    //}
    
}



- (IBAction)compute:(UIButton*)sender {
    if(self.mark2){
        NSString * test=@"ERROR";
        self.display.text=test;
        return;
    }
    printf("comput begin\n");
    NSString* bra=[self.brain.origin lastObject];
    NSLog(@"the bra is%@",bra);
    if(![bra isEqualToString:@")"]){
        [self enterPressed];}
    int x=[self.brain.operatorStack count];
    printf("the x is%d\n",x);
    NSString* equal=[sender currentTitle];
    self.display2.text=[self.display2.text stringByAppendingString:equal];
    [self.brain.origin addObject:equal];
    NSString* t= [self.brain.operandStack lastObject];
    NSLog(@"the opreandStack lastobject is%@",t);
    while(t!=nil){
        if([t isEqual:@"("]||[t isEqual:@")"]){
             NSString * test=@"ERROR";
            self.display.text=test;
            return;
        }
        [self.brain.operandStack removeLastObject];
        [self.brain pushOperator:t];
        t=[self.brain.operandStack lastObject];
    
    }
    int d= [self.brain.operatorStack count];
    if(d==0){
        NSString * test=@"ERROR";
        self.display.text=test;
        return;

    }
    NSLog(@"the d is%d",d);
    while(d--){
       NSString* y= [self.brain.operatorStack firstObjectCommonWithArray:self.brain.operatorStack];
        [self.brain.operatorStack removeObjectAtIndex:0];
        if([y isEqualToString:@"+"]){
            double a1= [self.brain popResult];
            double a2= [self.brain popResult];
            double x=a1+a2;
            printf("+ a1 %f a2 %f\n",a1,a2);
           // NSString* a3=[NSString stringWithFormat:@"%f",x];
            
            NSNumber* a3=[NSNumber numberWithDouble:x];
            [self.brain.result addObject:a3];
        
        }
        else if([y isEqualToString:@"-"]){
            double a1= [self.brain popResult];
            double a2= [self.brain popResult];
            double x=a2-a1;
             printf("- a1 %f a2 %f\n",a1,a2);
            NSNumber* a3=[NSNumber numberWithDouble:x];
           // NSString* a3=[NSString stringWithFormat:@"%f",x];
            [self.brain.result addObject:a3];

        
        }
        else if([y isEqualToString:@"x"]){
            double a1= [self.brain popResult];
            double a2= [self.brain popResult];
            double x=a1*a2;
             printf("x a1 %f a2 %f\n",a1,a2);
           // NSString* a3=[NSString stringWithFormat:@"%f",x];
            NSNumber* a3=[NSNumber numberWithDouble:x];
            [self.brain.result addObject:a3];
            
        
        }
        else if([y isEqualToString:@"/"]){
            double a1= [self.brain popResult];
            double a2= [self.brain popResult];
            double x=a2/a1;
             printf("/ a1 %f a2 %f\n",a1,a2);
            //NSString* a3=[NSString stringWithFormat:@"%f",x];
            NSNumber* a3=[NSNumber numberWithDouble:x];
            [self.brain.result addObject:a3];
        
        
        }
        else{
          
            NSNumber* y2=[NSNumber numberWithDouble:[y doubleValue]];
            [self.brain.result addObject:y2];
        
        }
        
    
    }
    NSNumber* s=[self.brain.result lastObject];
    //NSString* s=[self.brain.result lastObject];
    [self.brain.result removeAllObjects];
    double s2=[s doubleValue];
    NSLog(@"the result is%f",s2);
    NSString* s3=[s stringValue];
    //[self enterPressed];
    self.isInTheMiddleofinput=YES;
    self.display.text=s3;
    //self.display.text=s;
    int tmp=[self.brain.operatorStack count];
    printf("tmp is %d\n",tmp);
    [self.brain.origin removeAllObjects];
    [self.brain.origin addObject:s3];
    [self.brain.operatorStack removeAllObjects];
    //self.display2.text=s3;
    self.mark=YES;
}

- (IBAction)moper:(UIButton *)sender {
    NSString* type=[sender currentTitle];
    NSLog(@"type is %@",type);
    if([type isEqualToString:@"MC"]){
         self.value=0;
         self.display3.text=@"";
        
    
    }
    else if([type isEqualToString:@"M+"]){
        self.value+=[self.display.text doubleValue];
        self.display3.text=@"M";
    }
    else if([type isEqualToString:@"M-"]){
        self.value+=[self.display.text doubleValue]*(-1);
         self.display3.text=@"M";
    }
    else if([type isEqualToString:@"MR"]){
        NSNumber *s=[NSNumber numberWithDouble:self.value];
        
        self.display.text=[s stringValue];
        //self.display3.text=@"M";
    }
      
    
    
}

- (IBAction)judge:(UIButton*)sender{
    NSString* title=[sender currentTitle];
    NSString * last=[self.brain.origin lastObject];
    //BOOL f1=([last isEqual:@"+"]||[last isEqual:@"-"]||[last isEqual:@"x"]||[last isEqual:@"/"]);
   
    double t=[self.display.text doubleValue];
    printf("look is %f",t);
  //  if(!f1){
    if(!self.mark3){
    [self.brain pushOrigin:self.display.text];
        printf("is get this\n");
        self.mark3=YES;
       
    }//}
    if([title isEqual:@"+-"]){
       
        t=t*(-1);
    
    }else{
        t=t*0.01;
    }
        
        NSNumber* s=[NSNumber numberWithDouble:t];
       NSLog(@"answer is%@",s);
        self.display.text=[s stringValue];
        NSString* tt=[s stringValue];
      //  self.mark2=YES;
        NSString* s2=[self.brain.origin lastObject];
    NSLog(@"the s2 is%@",s2);
        int len=[s2 length];
        int cnt=[self.brain.origin count];
    printf("cnt is %d\n",cnt);
   // if(f1){
      //  self.display2.text=[self.display2.text stringByAppendingString:tt];
      //  [self.brain.origin addObject:tt];

    
    
    //}
    //else{
    if(cnt!=2&&cnt!=1){
        int total=[self.display2.text length];
        printf("total is%d len is %d\n",total,len);
        NSString* s3=[self.display2.text substringToIndex:(total-len)];
        self.display2.text=s3;
   // self.display2.text=[s3 stringByAppendingFormat:tt];
    self.display2.text=[self.display2.text stringByAppendingString:tt];
        [self.brain.origin removeLastObject];
       [self.brain.origin addObject:tt];
   // }
    }
else{
   
   
    self.display2.text=self.display.text;
    [self.brain.origin removeLastObject];
        [self.brain pushOrigin:tt];
}
  
    
}
//}


- (IBAction)del {
    if(!self.mark3){
    [self.brain pushOrigin:self.display.text];
        self.mark3=YES;}
    NSString* s=[self.brain.origin lastObject];
    int len=[s length];
    NSLog(@"the del last is%@",s);
    int count=[self.brain.origin count];
    printf("the count is%d\n",count);
    if(count<=1){
        [self clear];
        
    }
    else{
    
    
    int total=[self.display2.text length];
    printf("total is%d len is %d\n",total,len);
    NSString* s2=[self.display2.text substringToIndex:(total-len)];
    //self.display2.text=@"";
        self.display2.text=s2;
    }
   
    [self.brain.origin removeLastObject];
    [self.brain.operatorStack removeAllObjects];
    [self.brain.operandStack removeAllObjects];
    for(NSString* s in self.brain.origin){
        NSLog(@"the s is%@",s);
      BOOL f1=([s isEqual:@"+"]||[s isEqual:@"-"]||[s isEqual:@"x"]||[s isEqual:@"/"]||[s isEqualToString:@"("]||[s isEqual:@")"]);
        if(!f1){
            [self.brain pushOperator:s];
            self.isInTheMiddleofinput=NO;
            self.flag=NO;
        }
        else{
            [self check:s];
        
        }
    
    
    }
    
    
}



- (IBAction)clear {
    self.display.text=@"0";
    self.display2.text=@"";
    self.isInTheMiddleofinput=NO;
    self.flag=NO;
    self.mark=NO;
    self.mark3=NO;
    self.mark2=NO;
    [self.brain.operatorStack removeAllObjects];
    [self.brain.operandStack removeAllObjects];
   [self.brain.origin removeAllObjects];
    [self.brain.result removeAllObjects];
}

- (IBAction)enterPressed {
    
    
    [self.brain pushOperator:self.display.text];
    if(!self.mark3){
        [self.brain pushOrigin:self.display.text];
        
    }
    self.isInTheMiddleofinput=NO;
    self.flag=NO;
    
}

@end
