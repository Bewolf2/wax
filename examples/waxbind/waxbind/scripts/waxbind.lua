waxBind()

-- waxBind() 会做一些waxbind初始化的事  注：大小写敏感
----------------------------------------

--[[
function test(self)

    local label = UILabel:initWithFrame(CGRect(0, 100, 320, 40))
    label:setFont(UIFont:boldSystemFontOfSize(30))
    label:setColor(UIColor:whiteColor())
    label:setBackgroundColor(UIColor:colorWithRed_green_blue_alpha(0.173, 0.651, 0.627, 1))
    label:setText("Hello Lua!")
    label:setTextAlignment(UITextAlignmentCenter)
    self:view():addSubview(label)

    
    local viewDetailButton = UIButton:buttonWithType(UIButtonTypeCustom);
    viewDetailButton:addTarget_action_forControlEvents(self, "closeView", UIControlEventTouchUpInside);
    
    print(viewDetailButton)

    viewDetailButton:setFrame(CGRect(8, 12, 149, 44))
    viewDetailButton:titleLabel():setFont(UIFont:boldSystemFontOfSize(16.0))
    viewDetailButton:setTitleColor_forState(UIColor:blackColor(), UIControlStateNormal);
    local viewDetailBkgImage = UIImage:imageNamed("item_large_white_btn_bkg.png");
    viewDetailButton:setBackgroundImage_forState(viewDetailBkgImage, UIControlStateNormal);
    viewDetailButton:setImage_forState(UIImage:imageNamed("item_detail_icon.png"), UIControlStateNormal);
    viewDetailButton:setTitle_forState("add in lua", UIControlStateNormal);
    self:view():addSubview(viewDetailButton);
end

function closeView(self)

    print('closeView')

    local descViewController = ItemDetailDescViewController:alloc():init();
    descViewController:setAuction(self:itemDetailModel():tbWapItem());
    descViewController:setItemTitle(self:itemDetailModel():item():title());
    descViewController:setAuctionNumIid(self:itemDetailModel():itemId());
    descViewController:refreshDisplay();
    self:navigationController():pushViewController_animated(descViewController, true);

end
]]--


function viewDidLoad(self) 
    self:waxCallNative('viewDidLoad');
    print('viewDidLoad called from lua.');
end

function viewWillAppear(self, animated)
    self:waxCallNative('viewWillAppear:', animated);
    print('viewWillAppear called from lua.');
end

function viewDidAppear(self, animated)
    self:waxCallNative('viewDidAppear:', animated);
    print('viewDidAppear called from lua.');
end


