Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38F7D138BEB
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2020 07:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387432AbgAMGmw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Jan 2020 01:42:52 -0500
Received: from smtprelay0191.hostedemail.com ([216.40.44.191]:60821 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732311AbgAMGmq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Jan 2020 01:42:46 -0500
X-Greylist: delayed 349 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 Jan 2020 01:42:46 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave05.hostedemail.com (Postfix) with ESMTP id A06851801D3EC
        for <linux-rtc@vger.kernel.org>; Mon, 13 Jan 2020 06:36:57 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 0DBB9100E7B43;
        Mon, 13 Jan 2020 06:36:56 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:599:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:2892:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3872:3873:3874:4250:4321:4552:4605:5007:6119:7514:7809:7903:9010:10004:10400:10848:11026:11232:11473:11658:11914:12043:12048:12296:12297:12555:12740:12760:12895:13019:13071:13163:13229:13439:13870:13891:14093:14097:14180:14181:14659:14721:21060:21080:21433:21451:21627:21819:30003:30022:30054:30075:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: sail11_3c6014f468a37
X-Filterd-Recvd-Size: 2927
Received: from XPS-9350.home (unknown [47.151.135.224])
        (Authenticated sender: joe@perches.com)
        by omf15.hostedemail.com (Postfix) with ESMTPA;
        Mon, 13 Jan 2020 06:36:54 +0000 (UTC)
Message-ID: <9286d81a883f4795176182fdb9e69bc19a8232c7.camel@perches.com>
Subject: Re: [PATCH] rtc: i2c/spi: Avoid inclusion of REGMAP support when
 not needed
From:   Joe Perches <joe@perches.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sun, 12 Jan 2020 22:36:00 -0800
In-Reply-To: <20200112171349.22268-1-geert@linux-m68k.org>
References: <20200112171349.22268-1-geert@linux-m68k.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 2020-01-12 at 18:13 +0100, Geert Uytterhoeven wrote:
> Merely enabling I2C and RTC selects REGMAP_I2C and REGMAP_SPI, even when
> no driver needs it.  While the former can be moduler, the latter cannot,
> and thus becomes built-in.
> 
> Fix this by moving the select statements for REGMAP_I2C and REGMAP_SPI
> from the RTC_I2C_AND_SPI helper to the individual drivers that depend on
> it.
> 
> Note that the comment for RTC_I2C_AND_SPI refers to SND_SOC_I2C_AND_SPI
> for more information, but the latter does not select REGMAP_{I2C,SPI}
> itself, and defers that to the individual drivers, too.
> 
> Fixes: 080481f54ef62121 ("rtc: merge ds3232 and ds3234")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Joe: When merging addresses, scripts/get_maintainer.pl replaces
>      Alexandre's authoritative email address from MAINTAINERS by the
>      obsolete address in the SoB-line of the commit referred to by the
>      Fixes-line.

Hi Geert

What are you doing to get this changed output?

I get the same get_maintainer address output either way
with only with the 'blamed_fixes:' content added.

Your email with 'Fixes:' line:

$ ./scripts/get_maintainer.pl ~/geert_1.mbox 
Alessandro Zummo <a.zummo@towertech.it> (maintainer:REAL TIME CLOCK (RTC) SUBSYSTEM)
Alexandre Belloni <alexandre.belloni@bootlin.com> (maintainer:REAL TIME CLOCK (RTC) SUBSYSTEM,blamed_fixes:1/1=100%)
Akinobu Mita <akinobu.mita@gmail.com> (blamed_fixes:1/1=100%)
linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)

Your email without 'Fixes:' line:

$ ./scripts/get_maintainer.pl ~/geert_2.mbox 
Alessandro Zummo <a.zummo@towertech.it> (maintainer:REAL TIME CLOCK (RTC) SUBSYSTEM)
Alexandre Belloni <alexandre.belloni@bootlin.com> (maintainer:REAL TIME CLOCK (RTC) SUBSYSTEM)
linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM)
linux-kernel@vger.kernel.org (open list)



