import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  static const String name = "infinite_screen";

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5,6];

  final ScrollController scrollController = ScrollController();
  
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() { 
      //if I'm nearby the final, load more images
          //current position
      if ( (scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        //load next page

        loadNextPage();
      }

    });
  }


  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }


  Future loadNextPage() async{
    
    if(isLoading){
      //al ready making a request, so do not load again the list
        return;
    }
    isLoading = true;
    setState(() { });

    await Future.delayed(const Duration(seconds: 2));

    addSixImages();
    isLoading = false;

    
    //antes de llamar el setState de manera asíncrona,
    //el widget debe existir
    if(!isMounted){
        return;
    }
    setState(() { });
    moveScrollToBottom();
  }



  Future<void> onRefresh() async{
    isLoading = true;
    setState(() {
      
    });

    await Future.delayed( const Duration(seconds: 3) );

    if(!isMounted){
      return;
    }

    final lastId = imagesIds.last;
    
    imagesIds.clear();

    imagesIds.add(lastId+1);
    addSixImages();

    isLoading = false;
    setState(() { });
    
  }


  void moveScrollToBottom(){
    if( scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent){
      return;
    }

    scrollController.animateTo(
      scrollController.position.pixels+120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }

  void addSixImages(){
    final int lastItem = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5,6].map((e) => lastItem + e)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            //with builder, list items will be shown on demand
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: AssetImage("assets/Images/jar-loading.gif"),
                image: NetworkImage("https://picsum.photos/id/${imagesIds[index]}/500/300")
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),

        //build the las icon when i'm not loading the list

        child: isLoading ? SpinPerfect(
            infinite: true,
            child: const Icon(Icons.refresh_outlined)
          ) : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}