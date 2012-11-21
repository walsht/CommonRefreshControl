CommonRefreshControl
====================

CommonRefreshControl is a subclass helper for UITableViewController to implement UIRefershControl into your iOS 6 apps

Install:

1. Add CommonRefreshControl directory to your app

2. Add #import "CommonTableViewController.h" to yout UITableViewController .h file

3. Change UITableViewController in your .h file to CommonTableViewController 

4. In your UITableViewController .m file, add the following to viewDidLoad


    __weak MasterViewController *weakself = self;
    [self setUpRefresh:^(void){
        
      //Add logic here to do refresh the table.

       [weakself endRefreshWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterMediumStyle];
                     
    }];


Customizations:

//This call can be used default text values for a sync process

-(void)setUpSync:(RefreshLogicBlock)refreshLogicBlock;

//This call can be used default text values for a refresh process

-(void)setUpRefresh:(RefreshLogicBlock)refreshLogicBlock;

//This call can be used to enter your own default text values for a refresh process

-(void)setUpRefresh:(NSAttributedString*)title
       workingTitle:(NSAttributedString*)workingTitle
         retryTitle:(NSAttributedString*)retryTitle
  refreshLogicBlock:(RefreshLogicBlock)refreshLogicBlock;

//Helper to call refresh the table outside of the pull down

-(void)refreshView:(UIRefreshControl *)refresh;

//Starts refresh

-(void)startRefresh;

//Ends refresh with default text

-(void)endRefresh;

//Ends refresh with date set based on style sent in.

-(void)endRefreshWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
