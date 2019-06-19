Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2684B986
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2019 15:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfFSNRF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 19 Jun 2019 09:17:05 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33571 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbfFSNRF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 19 Jun 2019 09:17:05 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9070BE0013;
        Wed, 19 Jun 2019 13:17:02 +0000 (UTC)
Date:   Wed, 19 Jun 2019 15:16:59 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dylan Howey <Dylan.Howey@tennantco.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 1/2] Port rtc-pcf2123 to regmap
Message-ID: <20190619131659.GL23549@piout.net>
References: <20190426193648.1599-1-Dylan.Howey@tennantco.com>
 <20190427130054.GY14604@piout.net>
 <20190429150913.GA15052@tennantco.com>
 <20190430092256.GC11339@piout.net>
 <20190502174518.GA12323@tennantco.com>
 <20190502205516.GD22550@piout.net>
 <20190503133008.GA30943@tennantco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503133008.GA30943@tennantco.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Sorry for the very late reply !

On 03/05/2019 13:30:12+0000, Dylan Howey wrote:
> The 05/02/2019 22:55, Alexandre Belloni wrote:
> > > * I don't think pcf2123_read_offset is working correctly. In the case of
> > >   a coarse offset the value is not being sign extended. So a negative
> > >   offset read will not be correct if the coarse bit is set (result would
> > >   be a positive number being returned if this is true). I need to look
> > >   into this some more. The fix would be to sign extend first, then if
> > >   coarse bit is set multiply the result by 2.
> > > 
> > 
> > As the comment says, it is properly extended because after shifting,
> > bits [6:0] become bit [7:1].
> > 
> But what about this:
> 
> # echo 2170 > /sys/class/rtc/rtc0/offset 
> # cat /sys/class/rtc/rtc0/offset 
> 2170
> # echo -2170 > /sys/class/rtc/rtc0/offset 
> # cat /sys/class/rtc/rtc0/offset 
> 0
> # echo 4340 > /sys/class/rtc/rtc0/offset 
> # cat /sys/class/rtc/rtc0/offset 
> 4340
> # echo -4340 > /sys/class/rtc/rtc0/offset 
> # cat /sys/class/rtc/rtc0/offset 
> -2170
> 
> Negative offset reads seem to be off by a factor of 2.
> 

The issue is not the sign extension, it is the rounding function that
only works properly for positive numbers:

reg = (s8)((offset + (OFFSET_STEP >> 1)) / OFFSET_STEP);

I'm sending a patch.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
