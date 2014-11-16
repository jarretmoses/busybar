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
  //eevnt handler for button
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
    //remove autofocus on button
    self.$button.blur();
  });
};

Sort.prototype.sort = function(type){
  //sort rows by specified table data
  var sorted = _.sortBy(this.$rows,function(row){
        return $(row).children(type)
            .data(type.replace('.',''));
      }).reverse(); 
    //append newly sorted rows to table
    _.each(sorted,function(row){
        this.$table.append(row);
   }.bind(this));
};

Sort.prototype.changeButton = function(text){
  this.$button.text('Sort By '+ text);
};
