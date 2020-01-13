Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4513138C73
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2020 08:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728738AbgAMHlH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Jan 2020 02:41:07 -0500
Received: from smtprelay0060.hostedemail.com ([216.40.44.60]:59570 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728687AbgAMHlG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Jan 2020 02:41:06 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 8B517182CED2A;
        Mon, 13 Jan 2020 07:41:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:599:800:960:966:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2196:2199:2393:2525:2553:2560:2563:2682:2685:2828:2859:2892:2895:2902:2909:2924:2926:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3354:3622:3653:3865:3866:3867:3868:3870:3871:3872:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4385:4605:5007:6119:7903:9025:9121:10004:10400:11026:11232:11233:11473:11658:11914:12043:12262:12296:12297:12438:12555:12679:12740:12760:12895:12986:13439:13846:13870:14093:14096:14097:14180:14181:14659:14721:21060:21080:21365:21433:21451:21627:21819:21939:30003:30016:30022:30054:30060:30070:30075:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:3,LUA_SUMMARY:none
X-HE-Tag: wood37_2679249ff1e4c
X-Filterd-Recvd-Size: 3273
Received: from XPS-9350.home (unknown [47.151.135.224])
        (Authenticated sender: joe@perches.com)
        by omf18.hostedemail.com (Postfix) with ESMTPA;
        Mon, 13 Jan 2020 07:41:04 +0000 (UTC)
Message-ID: <f35928f4e8f78be59617c0d49308001d92b314c7.camel@perches.com>
Subject: Re: [PATCH] rtc: i2c/spi: Avoid inclusion of REGMAP support when
 not needed
From:   Joe Perches <joe@perches.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Sun, 12 Jan 2020 23:40:10 -0800
In-Reply-To: <CAMuHMdXRpKJNm6tFjccO67dQr=_Hc4rD1NmJzzrHPDEyja0R5w@mail.gmail.com>
References: <20200112171349.22268-1-geert@linux-m68k.org>
         <9286d81a883f4795176182fdb9e69bc19a8232c7.camel@perches.com>
         <CAMuHMdXRpKJNm6tFjccO67dQr=_Hc4rD1NmJzzrHPDEyja0R5w@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 2020-01-13 at 08:25 +0100, Geert Uytterhoeven wrote:
> Hi Joe,
> 
> On Mon, Jan 13, 2020 at 7:36 AM Joe Perches <joe@perches.com> wrote:
> > On Sun, 2020-01-12 at 18:13 +0100, Geert Uytterhoeven wrote:
> > > Merely enabling I2C and RTC selects REGMAP_I2C and REGMAP_SPI, even when
> > > no driver needs it.  While the former can be moduler, the latter cannot,
> > > and thus becomes built-in.
> > > 
> > > Fix this by moving the select statements for REGMAP_I2C and REGMAP_SPI
> > > from the RTC_I2C_AND_SPI helper to the individual drivers that depend on
> > > it.
> > > 
> > > Note that the comment for RTC_I2C_AND_SPI refers to SND_SOC_I2C_AND_SPI
> > > for more information, but the latter does not select REGMAP_{I2C,SPI}
> > > itself, and defers that to the individual drivers, too.
> > > 
> > > Fixes: 080481f54ef62121 ("rtc: merge ds3232 and ds3234")
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > Joe: When merging addresses, scripts/get_maintainer.pl replaces
> > >      Alexandre's authoritative email address from MAINTAINERS by the
> > >      obsolete address in the SoB-line of the commit referred to by the
> > >      Fixes-line.
> > 
> > Hi Geert
> > 
> > What are you doing to get this changed output?
> 
> scripts/get_maintainer.pl
> 0001-rtc-i2c-spi-Avoid-inclusion-of-REGMAP-support-when-n.patch
> 
> > I get the same get_maintainer address output either way
> > with only with the 'blamed_fixes:' content added.
> 
> Thanks, I can confirm it's fixed in next-20200110.
> With v5.5-rc6, it still gives the old addresss.

Well, OK, get_maintainer is the same but there is a
different .mailmap in -next

$ git log --stat -p -1 94a250713
commit 94a25071301a898d8c603db2f05a0016eb7b7d28
Author: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date:   Tue Dec 10 14:46:53 2019 +0100

    mailmap: Update email address for Alexandre Belloni
    
    Free Electrons is now Bootlin.
    
    Link: https://lore.kernel.org/r/20191210134653.2995661-1-alexandre.belloni@bootlin.com
    Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


