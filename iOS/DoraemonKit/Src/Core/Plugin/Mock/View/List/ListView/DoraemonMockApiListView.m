//
//  DoraemonMockApiListView.m
//  AFNetworking
//
//  Created by didi on 2019/11/15.
//

#import "DoraemonMockApiListView.h"
#import "DoraemonMockApiCell.h"

@interface DoraemonMockApiListView()

@end

@implementation DoraemonMockApiListView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.dataArray = [DoraemonMockManager sharedInstance].mockArray;
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    DoraemonMockBaseModel* model = [self.dataArray objectAtIndex:indexPath.row];
    return [DoraemonMockApiCell cellHeightWith:model];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"detailcell";
    DoraemonMockApiCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[DoraemonMockApiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.delegate = self;
    }
    DoraemonMockBaseModel* model = [self.dataArray objectAtIndex:indexPath.row];
    [cell renderCellWithData:model];
    return cell;
}

- (void)cellExpandClick{
    [self.tableView reloadData];
}

- (void)sceneBtnClick{
    [self.tableView reloadData];
}

- (void)cellSwitchClick{
    [self.tableView reloadData];
}

@end