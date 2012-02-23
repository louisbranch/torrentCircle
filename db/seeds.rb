ReleaseFormat.create([

  { :name => 'Unknown', :description => 'It was not possible to find in which format this movie was encoded.'},

  { :name => 'Cam', :labels => %w(CAMRip CAM), :description => 'A copy made in a cinema using a camcorder or mobile phone. The sound source is the camera microphone.'},

  { :name => 'Telesync', :labels => %w(TS TELESYNC PDVD), :description => 'A copy was shot in an empty cinema or from the projection booth with a professional camera mounted on a tripod, directly connected to the sound source.'},

  { :name => 'Workprint', :labels => %w(WP WORKPRINT), :description => 'A copy made from an unfinished version of a film produced by the studio.'},

  { :name => 'Telecine', :labels => %w(TC TELECINE), :description => 'A copy captured from a film print using a machine that transfers the movie from its analog reel to digital format.'},

  { :name => 'Pay-Per-View Rip', :labels => %w(PPV PPVRip), :description => 'PPVRips come from Pay-Per-View sources, all the PPVRip releases are brand new movies which have not yet been released to Screener or DVD but are available for viewing by Hotel customers.'},

  { :name => 'Screener', :labels => %w(SCR SCREENER DVDSCR DVDSCREENER BDSCR), :description => 'These are early DVD or BD releases of the theatrical version of a film, typically sent to movie reviewers, Academy members, and executives for review purposes.'},

  { :name => 'Digital Distribution Copy', :labels => %w(DDC), :description => 'DDC is basically the same as a Screener, but sent digitally (email/ftp/http/etc.) to companies instead of via the postal system. '},

  { :name => 'R5', :labels => %w(R5 R5LINE), :description => 'The R5 is a retail DVD from region 5. R5 releases differ from normal releases in that they are a direct Telecine transfer of the film without any of the image processing.'},

  { :name => 'DVD-Rip', :labels => %w(DVDRip), :description => 'A final retail version of a film, typically released before it is available outside its originating region.'},

  { :name => 'DVD-R', :labels => %w(DVDR DVD-Full Full-Rip DVD-5 DVD-9), :description => 'A final retail version of a film in DVD format, generally a complete copy from the original DVD.'},

  { :name => 'HDTV', :labels => %w(DSR DSRip DTHRip DVBRip HDTV PDTV TVRip), :description => 'HDTV rips often come from Over-the-Air transmissions. With an HDTV source, the quality can sometimes even surpass DVD. '},

  { :name => 'VODRip', :labels => %w(VODRip VODR), :description => 'VODRip stands for Video-On-Demand Rip. This can be done by recording or capturing a video/movie from an On-Demand service such as through a cable or satellite TV service.'},

  { :name => 'BluRay Rip', :labels => %w(BDRip BRRip Blu-Ray BluRay BLURAY BDR BD5 BD9), :description => 'Similar to DVD-Rip, only the source is a Blu-ray Disc. A BD/BR Rip in DVD-Rip size often looks better than a same-size DVD rip because encoders have better source material.'}

])
