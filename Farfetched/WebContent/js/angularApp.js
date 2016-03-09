var angularApp = angular.module('angularApp',['ngRoute']);

angularApp.config(function($routeProvider){
	
	$routeProvider.
		when('/:blogId/:urlTitle',{
			
			templateUrl: 'jsp/individualBlog.jsp',
			controller: 'displayBlogController'
				
		}).
		when('/',{
			
			templateUrl: 'jsp/blogHome.jsp',
			controller: 'displayBlogController'
				
		}).
		when('/search/:searchString',{
			
			templateUrl: 'jsp/blogHome.jsp',
			controller: 'displayBlogController'
				
		}).otherwise({
			redirectTo: '/'
		});
	
});

angularApp.run(function($rootScope,persistState,$location){
	console.log("Inside run");
	/*$rootScope.$on("$routeChangeStart", function (event, next, current) {
		persistState.model.previousURL = $location.$$url;	        
		console.log("Route changed");	    
	}); */
	
	window.onbeforeunload = function (event) {
		console.log("OnbeforeUnLoad");
		$rootScope.$broadcast('deleteState');
	};
});



angularApp.factory('persistState', ['$rootScope','$location', function ($rootScope,$location) {
	console.log("Inside factory");
    var service = {
    		
        model: {
            serverState: ''
        },

        SaveState: function () {           	
        	sessionStorage.persistState = angular.toJson(service.model);
        	console.log("Saving state");        	
        },
        
        DeleteState: function () {           	
        	service.model.serverState = '';  
        	sessionStorage.persistState = angular.toJson(service.model);
        	console.log("Deleted state");
        },

        RestoreState: function () {        	
        	if(typeof sessionStorage.persistState !== 'undefined'){
	            service.model = angular.fromJson(sessionStorage.persistState);
	            if(typeof service.model.serverState !== 'undefined'){
		            if(service.model.serverState == ''){
		            	return "fetch";
		            } else{
		            	return "retain";
		            }
	            } else{
	            	return "fetch";
	            }
        	} else{
        		return "fetch";
        	}
        }
    };
    
    service.setServerResponseToSession = function(serverResponse){
    	service.model.serverState = serverResponse;
    	$rootScope.$broadcast('savestate');
    	console.log("RetrieveServerstate and save session");
    };

    $rootScope.$on("deleteState", service.DeleteState);
    $rootScope.$on("savestate", service.SaveState);
    //$rootScope.$on("restorestate", service.RestoreState);

    return service;
}]);


angularApp.controller('displayBlogController',function($scope,$http,$filter,$sce,$routeParams,persistState){
	
	$scope.globalCounter = 0;
	$scope.serverResponse;
	$scope.searchKeyword = '';
	$scope.sortBy = 'Date';
	$scope.categoryFilter = 'All';
	$scope.individualResponse = '';
	
	$scope.blogID = $routeParams.blogId;
	$scope.urlTitle = $routeParams.urlTitle;
	
	$scope.retrieveSavedState = function(){
		if(persistState.RestoreState() == "fetch"){
			$scope.getBlogDetails();
		} else{
			$scope.serverResponse = persistState.model.serverState;
			console.log("");
		}
	}
	
	$scope.getBlogDetails = function(){
		
		$('.cssload-plus-loader').show();
		$http({
			method: 'GET',
			url:'/Farfetched/ajaxAction',
			cache: true,
			params: { "method" : "populateBlogEntriesOnPageLoad", "sortBy" : $scope.sortBy, "categoryFilter" : $scope.categoryFilter }
		}).success(function successCallback(response) {
			
			alert(JSON.stringify(response));
			
			$scope.globalCounter += Object.keys(response).length;
			$scope.serverResponse = response;		
			$scope.trustAsHtml = $sce.trustAsHtml;
			$scope.counter = 0;
			
			persistState.setServerResponseToSession($scope.serverResponse);
			
			$('.cssload-plus-loader').fadeOut();
			
		}).error(function errorCallback(response) {
			    // called asynchronously if an error occurs
			    // or server returns response with an error status.
		});
	
	};
	
	$scope.getAdditionalDetails = function(){
		$http({
			method: 'GET',
			url: '/Farfetched/ajaxAction',
			cache: true,
			params: { "method" : "fetchMoreBlogEntries", "globalCounter" : $scope.globalCounter, "sortBy" : $scope.sortBy}
		}).success(function successCallback(response){
			
			alert(JSON.stringify(response));
			
			if(typeof response != 'undefined'){
				$scope.globalCounter += Object.keys(response).length;
				angular.extend($scope.serverResponse, response);
				alert(JSON.stringify($scope.serverResponse));
			}
		});	
	};
	
	$scope.getIndividualBlogEntry = function(){
		$http({
			method: 'GET',
			url: '/Farfetched/ajaxAction',
			cache: true,
			params: { "method" : "fetchIndividualBlogEntry", "blogId" : $scope.blogID }
		}).success(function successCallback(response){
			
			alert(JSON.stringify(response));
			
			if(typeof response != 'undefined'){
				$scope.individualResponse = response;	
			}
		});	
	}
	
	$scope.blogFilterRefresh = function(event){
		
		var $this = $(event.target);
		if($this.hasClass("sort-filter")){
			$scope.sortBy = $this.html();
		} else{
			$scope.categoryFilter = $this.html();
		}
		
		$scope.getBlogDetails();
		
	};
	
	$scope.likeButtonPressed = function(image){
		
		var $this = $(image.target);
		var dataId = $this.parents('.blog-item').attr('data-id');
		var blogId = $this.parents('.blog-item').attr('id');
		var operation;
		
		//Swapping like button image
		if($this.attr('src').match(/\/unliked\.png/)){
			$this.attr("src","images/blog/liked.png");
			$this.toggleClass("liked");
		} else{
			$this.attr("src","images/blog/unliked.png");
			$this.toggleClass("liked");
		}
		
		
		//Setting operation add or subtract
		if($this.hasClass("liked")){
			operation = "add";	
		} else {
			operation = "sub";
		}
		
		//Making async call to update like count
		$http({
			method: 'GET',
			url: '/Farfetched/ajaxAction',
			params: { "method" : "updateFavCount", "blogId" : blogId, "operation" : operation}
		}).success(function successCallback(response){
			$scope.serverResponse[dataId].favCount = response;		
		});	
		
		
		//Setting cookie
		if($.cookie('blogLikes')){
			var likes = $.cookie('blogLikes').split(',');
			
			if($this.hasClass("liked")){
				likes.push(blogId);
			} else{
				$.each(likes,function(index,like){
					if(like === blogId){
						likes.splice(index,1);
					}
				});
			}
			
			$.cookie('blogLikes',likes.join(), { expires: 365, path: '/' });
		} else{
			$.cookie('blogLikes', blogId, { expires: 365, path: '/' });
		}		
		
	};
	
	$scope.getIncludeFile = function() {
		return 'jsp/blogEntry.html';
	};
	
});

angularApp.directive('repeatEndDirective',function(){
	return function(scope, element, attrs){
		if(scope.$last){
			if(scope.$index < 4){
				$('.no-items-to-display').fadeIn();
			    $('.more-items-to-display').fadeOut();
			} else{
				$('.no-items-to-display').fadeOut();
			    $('.more-items-to-display').fadeIn();
			}
		}
	};
});

angularApp.filter('reverse', function() {
	return function(items) {
	    var filtered = [];
	    angular.forEach(items, function(item) {
	      filtered.push(item);
	    });
	    filtered.reverse();
	    return filtered;
	};
});