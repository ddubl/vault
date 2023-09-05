---
id: pdlp2dim12y4zujwyfis1ap
title: Flowhood
desc: ''
updated: 1633199319548
created: 1633199319548
---
(image/png)[London Biohackspace](https://biohackspace.org/)

- [Home](https://biohackspace.org/)
- [Posts](https://biohackspace.org/news/)
  - [Latest News](https://biohackspace.org/news/)
  - [Recent Talks](https://biohackspace.org/recent-talks-presentations1/)
- [Projects](https://biohackspace.org/building-a-diy-flow-hood/null)
  - [Wiki](https://wiki.london.hackspace.org.uk/view/Biohacking)
  - [JuicyPrint](https://biohackspace.org/projects/juicyprint/)
  - [Pyrocystis fusiformis](https://biohackspace.org/projects/pyrocystis-fusiformis/)
  - [OD600 Spectrophotometer](https://biohackspace.org/projects/od600-spectrophotometer/)
- [Join](https://biohackspace.org/join/)
- [Donate](https://biohackspace.org/donate/)
- [Contact](https://biohackspace.org/contact/)
  - [Slack](https://biohackspace.org/slack/)
  - [Contact](https://biohackspace.org/contact/)
  - [Sponsors](https://biohackspace.org/sponsors/)

IMG_20140717_015307 (image/png)

## Building a DIY Flow Hood

On 23 Jul, 2014 By [Ilya Levantis](https://biohackspace.org/author/czechton/) With [19 Comments](https://biohackspace.org/building-a-diy-flow-hood/#comments)

Anyone following me on twitter may have noticed I posted a few pictures of my progress during my build of a simple HEPA filter based laminar flow box (not sure if it’s actually considered a flow hood). The idea of this build being to greatly improve the reliability of the aseptic protocols in our lab.

To come up with the design I did a lot of research and ended up finding some great resources on various psychedelic mushroom growing forums, a surprisingly good resource. The design that is popular and that I ended up going with (at least for mk I of the flow hood) is essentially just a box with a fan blowing in one side and the HEPA filter mounted on another side. While the construction side of things is therefore rather simple, the crucial aspect is actually achieving a laminar airflow by pairing a suitable fan with your chosen filter.

I found that [this guide by EvilMushroom666](http://myco-tek.org/showthread.php?49-EvilMushroom666-s-Flowhood-Build) explained the maths of figuring out what fan to pair with what filter really well. In summary, you need to source a fan that is capable of blowing enough air for the size of your filter at the given amount of pressure drop (back pressure) that your filter creates.

So step 1 was to find a filter that was reasonably priced and would give a decently sized working area. Unfortunately for us Brits, it seems there are far more options in the US than in the UK for reasonably priced HEPA filters, however Jasun Filtration had the [Ultima MPW78 18×24](http://www.jasunfiltration.com/acatalog/Jasun_Envirocare_plc_Grade_H13_256.html) for £100. Right. Filter sorted.

Step 2 was where the inimitable EvilMushroom666’s guide lead the way for me and helped me to arrive at the necessary specification of the fan I would have to find. It seems that most people have to resort to squirrel cage blower fans to achieve the kinds of airflow necessary despite the high pressure drop of HEPA filters. However, after several hours of looking through fans on mouser.co.uk I managed to a find a [beastly 12V DC fan](http://uk.mouser.com/ProductDetail/Sanyo-Denki/9GV1512H501/?qs=sGAEpiMZZMtmglTKXDHoWiEX1mLPmXqu1%252bkk5Gft5iQ%3d) that could handle the pressure drop and still put out enough air for our filter at around a quarter of the price of the squirrel cage blowers.

Bp4cghqCMAAg3l0 (image/png)

Now came the assembly, which was essentially just the building of a box. And though being located in a hackspace certainly helps with getting this done, this could all be done with very minimal tools should you not have access to a fully kitted out workshop. One thing to note was that my attempt to make the box airtight using the spare drain sealant lying around the hackspace didn’t actually work, however this was easily remedied with a bit of tape to seal all the box’s joints properly.

Bp80ok9CQAAnaG9 (image/png)

Finally, I attached a prefilter and we connected the fan to a power supply and overvolted it a tad to reach the required airflow. We tested to see if the air coming out of the filter was indeed laminar using a bit of liquid nitrogen and some water to produce a thick cloud of easily visible moist air.

The final test was to carry out a dummy plating procedure where the LB agar plates were not inoculated with anything but then incubated for a few days. Our first attempt was somewhat disheartening as the plates that were prepared in the “sterile” zone did infact become contaminated (though less than the controls). For attempt 2 we created a raised shelf in front of the filter on which to work, and this lead to success.

[Br8BHtmIUAEBZIX (image/png)](http://biohackspace.org/wp-content/uploads/2014/07/Br8BHtmIUAEBZIX.jpg)

In this improved configuration, our controls, where the plating was done outside the clean airflow, were covered in a colourful mosaic of colonies. And, apart from the two plates that were furthest away from the filter at the corners of the clean work area, the rest of the plates were completely sterile.

Obviously, though this is an incredibly encouraging result, it has not quite proven that the “sterile” work area is indeed sterile. However since we would rather not waste time and petri dishes by doing further dedicated experiments to establish the effectiveness of the DIY flowhood, we have marked the 8 spaces in which petri dishes can be placed in the sterile area. Every time a plating protocol is carried out we shall record the what space it was carried out in and if/how many contaminant colonies grow on the plates. Over time we should build up a nice picture of the statistical likelihood of contamination based on the spatial position of within the sterile area.

This is only the beginning however. I have as yet not found any examples of people constructing a vertical laminar flow cabinet, and as you can see from the [wiki page](https://wiki.london.hackspace.org.uk/view/Project:Flow_Hood) for this project, that is the eventual aim of the DIY flow hood mk II).

[VerticalhoodSketchup (image/png)](http://biohackspace.org/wp-content/uploads/2014/07/VerticalhoodSketchup.png)[Tweet This Post](http://twitter.com/share?text=Building%20a%20DIY%20Flow%20Hood%20-%20https://biohackspace.org/building-a-diy-flow-hood/)

## 19 comments on “Building a DIY Flow Hood”

1. (image/png)
   [14 August 2014 at 6:30 am](https://biohackspace.org/building-a-diy-flow-hood/#comment-138)

   Great build! It makes life so much easier to have one of these.

   HEPA filters are often sold as replacement items for office air purifiers. I’ve got mine from Followed.

   I constructed a big down flow for a bio printing workshop earlier this year. It had to be large enough to contain a custom agar printer. The design was derived from amateur orchid websites.

   Here’s a picture <http://farm6.static.flickr.com/5502/12366127263_fe4e07d2f9_m.jpg>

   [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=138#respond)

   1. (image/png)
      [14 August 2014 at 8:50 am](https://biohackspace.org/building-a-diy-flow-hood/#comment-139)

      Do you mean ‘Fellowes’ as the source of a HEPA filter? I actually came across their cheap air purifier replacement filters and thought they might work as a cheap alternative to HEPA filters manufactured specifically for flow hoods. However after tracking down the actual [specifications for the Fellowes HEPA filter](https://www.dropbox.com/s/1i7qo8v6xgxwov7/DOP%20test.pdf) (Winix uses the same filters but puts their own brand on them) you can see that the pressure drop they create is MASSIVE and that they are only rated as HEPA upto a very slow air speed.

      I decided that trying to use them in a laminar flow set up would be a waste of time since you would probably need some huge fan or an array of leafblowers to actually push enough air through them, and by that point the actual particle catching efficiency would probably not be as effective.

      I am really interested to know how well your set up works. Does the vertical nature mean that you don’t need laminar flow?

      [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=139#respond)

2. (image/png)
   [30 August 2014 at 1:15 am](https://biohackspace.org/building-a-diy-flow-hood/#comment-183)

   I really like your scientific approach to determining the sterile zones within the laminar flow. Please keep us updated on the dataset you collect.

   [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=183#respond)

3. (image/png)
   [22 January 2015 at 11:37 pm](https://biohackspace.org/building-a-diy-flow-hood/#comment-675)

   Hi, will that fan definitely be powerful enough? And can I ask how you overvolt it? Many Thanks

   [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=675#respond)

   1. (image/png)
      [25 January 2015 at 2:16 pm](https://biohackspace.org/building-a-diy-flow-hood/#comment-680)

      I spent a lot of time searching for a cheap fan that would produce the required airflow for that filter. You can check the data sheet for the fan I linked to for yourself. Additionally, our setup works fantastically so the fan definitely does the job. To overvolt it to 13.8v you can buy a fixed 13.8v supply such as this: <http://www.ukwholesale.info/tools-testing-equipment/switch-mode-5a-138v-bench-top-power-supply-650656.html>

      [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=680#respond)

4. (image/png)
   [17 February 2015 at 5:10 am](https://biohackspace.org/building-a-diy-flow-hood/#comment-714)

   For true laminar flow you need the proper hepa filter not just any hepa filter and it has to be matched to the proper blower to acheive 100 cfm. Anything else is a waste of time and money.

   [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=714#respond)

   1. (image/png)
      [17 February 2015 at 1:59 pm](https://biohackspace.org/building-a-diy-flow-hood/#comment-716)

      You’re concerns are addressed in the post.

      [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=716#respond)

5. (image/png)
   [20 February 2015 at 1:07 pm](https://biohackspace.org/building-a-diy-flow-hood/#comment-724)

   I just wanted to say how much I liked your post. The links are super too. The explaination of how to determine how many CFM the blower will need to move was sooo easy to understand. I am thinking about building another laminar hood and would definately try your way.

   thanks![Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=724#respond)

6. (image/png)
   [24 February 2015 at 4:45 pm](https://biohackspace.org/building-a-diy-flow-hood/#comment-743)

   I’m thinking of following your example and building one of these.

   Now you’ve had some time to use it is there anything you would do differently ?

   [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=743#respond)

7. (image/png)
   [28 February 2015 at 7:52 pm](https://biohackspace.org/building-a-diy-flow-hood/#comment-749)

   Nice 3D model and thanks for sharing!

   Like Sam I’m planning to build one inspired on yours too. Please, post more news about this project, so we can compare results.   (image/png)

8. (image/png)
   [12 March 2015 at 4:19 pm](https://biohackspace.org/building-a-diy-flow-hood/#comment-766)

   Great writeup. followed the links and noticed that sadly the Ultima MPW78 18×24 has now increased in price   (image/png)

   [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=766#respond)

9. (image/png)
   [27 April 2015 at 6:45 pm](https://biohackspace.org/building-a-diy-flow-hood/#comment-830)

   hello,

   your working area is 800x45x660, after making this can you confirm that the blower you used is actually enough to get 100cf² out of the unit?

   i need a setup like yours 100% but i have never thought that this little blower could deliver enough!

   [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=830#respond)

   1. (image/png)
      [5 June 2015 at 11:48 am](https://biohackspace.org/building-a-diy-flow-hood/#comment-860)

      Yes, the fan does a good job. Make sure to run it at 13.8v however! Stay tuned though as I’m building a mark II model that is a bit more complicated but should give a better working area.

      [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=860#respond)

      1. (image/png)
         [31 July 2015 at 11:09 am](https://biohackspace.org/building-a-diy-flow-hood/#comment-932)

         Looking forward to the 2nd version, will hold off buying supplies till then. Will it be so budget friendly?

         [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=932#respond)

10. (image/png)
    [29 June 2015 at 6:46 pm](https://biohackspace.org/building-a-diy-flow-hood/#comment-898)

    Thanks for answering my question above and links to the over-volter, much appreciated. I have purchased the one you suggested and set up my unit using exactly the same fan and filter.

    After sealing the box and switching on, running to 13.8v there dosent seem to be any air flow at all from the front of the unit, I tried using a flame to test and nothing. Have you any suggestions?

    Thanks in advance

    [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=898#respond)

11. (image/png)
    [26 August 2015 at 12:20 pm](https://biohackspace.org/building-a-diy-flow-hood/#comment-977)

    Hi, interesting post! I work for cleanroom equipment manufacturer Connect 2 Cleanrooms and we would advise anyone producing a similar product to be careful what materials you use. Eg, using wood and adhesive tape could generate particles that could harm your clean environment. Just a helpful tip. For your mark II version, take a look at the HEPA filters on cleanroomshop.com <http://www.cleanroomshop.com/category/39-fan-filter-units.aspx> – may be worth a look to see if they are are better value than your current supply.

    [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=977#respond)

12. (image/png)
    [25 September 2015 at 11:35 am](https://biohackspace.org/building-a-diy-flow-hood/#comment-1013)

    i’m curious whether an automotive blower fan would work well enough.

    they are often much cheaper, sold as scrap

    [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=1013#respond)

13. (image/png)
    [13 January 2016 at 1:39 pm](https://biohackspace.org/building-a-diy-flow-hood/#comment-1145)

    Hi and many thanks for this post. Finally found an inexpensive Fan through this!

    I would be intersted in how you fixed the HEPA filter against the housing, any hints there?

    Kind regards!

    [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=1145#respond)

14. (image/png)
    [15 January 2016 at 1:45 pm](https://biohackspace.org/building-a-diy-flow-hood/#comment-1146)

    Just found out that there is even a cheaper fan model with the same pressure specs (doesnt have the pulse sensor wire) : <http://www.mouser.de/search/ProductDetail.aspx?R=0virtualkey0virtualkey9GV1512H5011>

    [Reply](https://biohackspace.org/building-a-diy-flow-hood/?replytocom=1146#respond)

### Leave a Reply

Your email address will not be published. Required fields are marked \*

Comment

Name \*

Email \*

Website

« [The iGEM kit has arrived!](https://biohackspace.org/the-igem-kit-has-arrived/)
[Itty Bitty Creatures](https://biohackspace.org/itty-bitty-creatures/) »

Help fund us!

(image/png)[Donate Bitcoin (image/png)](#)

Benefactors:

(image/png)(image/png)(image/png)

Theme by [Ilya Levantis](https://twitter.com/MouldGod), based on Sublime by [amplifiii](http://amplifiii.com/)

Header image based on photo by [Jekson Robertlee](https://www.flickr.com/photos/jeksonr/) / [CC BY-NC 2.0](https://creativecommons.org/licenses/by-nc/2.0/)

[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://www.facebook.com/LondonBiohackspace)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://twitter.com/LondonBioHack)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://biohackspace.org/feed) [London Biohackspace- Biohacking / DIYBio in London (image/png)](https://www.facebook.com/LondonBiohackspace)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://twitter.com/LondonBioHack)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://biohackspace.org/feed) [London Biohackspace- Biohacking / DIYBio in London (image/png)](https://www.facebook.com/LondonBiohackspace)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://twitter.com/LondonBioHack)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://biohackspace.org/feed) [London Biohackspace- Biohacking / DIYBio in London (image/png)](https://www.facebook.com/LondonBiohackspace)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://twitter.com/LondonBioHack)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://biohackspace.org/feed) [London Biohackspace- Biohacking / DIYBio in London (image/png)](https://www.facebook.com/LondonBiohackspace)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://twitter.com/LondonBioHack)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://biohackspace.org/feed) [London Biohackspace- Biohacking / DIYBio in London (image/png)](https://www.facebook.com/LondonBiohackspace)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://twitter.com/LondonBioHack)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://biohackspace.org/feed) [London Biohackspace- Biohacking / DIYBio in London (image/png)](https://www.facebook.com/LondonBiohackspace)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://twitter.com/LondonBioHack)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://biohackspace.org/feed) [London Biohackspace- Biohacking / DIYBio in London (image/png)](https://www.facebook.com/LondonBiohackspace)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://twitter.com/LondonBioHack)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://biohackspace.org/feed) [London Biohackspace- Biohacking / DIYBio in London (image/png)](https://www.facebook.com/LondonBiohackspace)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://twitter.com/LondonBioHack)[London Biohackspace- Biohacking / DIYBio in London (image/png)](https://biohackspace.org/feed)© 2017 London Biohackspace // [back up ↑](https://biohackspace.org/building-a-diy-flow-hood/#toplink)

