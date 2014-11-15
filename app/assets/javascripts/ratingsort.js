'use strict';
$(function(){
  var sorter = new Sort();
  sorter.init();
});


function Sort(){
  this.$button = $('button');
  this.$table = $('tbody');
  this.$rows = $('.data');
};

Sort.prototype.init = function(){
  this.setListener();
};

Sort.prototype.setListener = function(){
  var self = this;
  this.$button.click(function(event){
    event.preventDefault();
    if (/rating/i.test($(this).text())){
      self.sort('.rating');
      self.changeButton('Checkins');
    } else {
      self.sort('.checkins');
      self.changeButton('Ratings');
    } 
  });
};

Sort.prototype.sort = function(type){
  var sorted = _.sortBy(this.$rows,function(row){
        return $(row).children(type).data(type.replace('.',''));
      }).reverse(); 
    _.each(sorted,function(row){
        this.$table.append(row);
   }.bind(this));
};

Sort.prototype.changeButton = function(text){
  this.$button.text('Sort By '+ text);
};


    //   var sorted = _.sortBy(this.$rows,function(row){
    //     return $(row).children('.rating').data('rating')
    //   }).reverse();   
    //   console.log(sorted);
    //    _.each(sorted,function(row){
    //     this.$table.append(row);
    //   }.bind(this));
    // }.bind(this));