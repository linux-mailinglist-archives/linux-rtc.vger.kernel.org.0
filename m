Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD6EBC9FBE
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 15:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbfJCNnc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 09:43:32 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:38055 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfJCNnc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 09:43:32 -0400
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 58E5420000A;
        Thu,  3 Oct 2019 13:43:30 +0000 (UTC)
Date:   Thu, 3 Oct 2019 15:43:29 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lukasz Majewski <lukma@denx.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Add support for century bits to m41t62 (rv4162) RTC
 devices
Message-ID: <20191003134329.GB575@piout.net>
References: <20190911154803.15969-1-lukma@denx.de>
 <20191003114831.GR4106@piout.net>
 <20191003142150.3d73a9d7@jawa>
 <20191003123538.GS4106@piout.net>
 <20191003151434.49762715@jawa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003151434.49762715@jawa>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/10/2019 15:14:34+0200, Lukasz Majewski wrote:
> Hi Alexandre,
> 
> > On 03/10/2019 14:21:50+0200, Lukasz Majewski wrote:
> > > > 
> > > > See the datasheet:
> > > > 
> > > > "During any year which is a multiple of 4, the RV-4162 RTC will
> > > > automatically insert leap day, February 29.  Therefore, the
> > > > application software must correct for this during the exception
> > > > years (2100, 2200, etc.) as noted above."  
> > > 
> > > I'm wondering what the phrase "application software" means here?
> > > 
> > > If it is the userland SW, then we shall at least be able to set
> > > 2099 in this device and then count on software correction.
> > > 
> > > If the "application software" is the kernel driver - the date
> > > correction shall be done there (maybe some lookup table?).
> > > 
> > > Personally, I do prefer the first option - this means that with this
> > > patch we can set the time to e.g. 2234 year and then rely on
> > > userland software (or libc) to do the correction.
> > >   
> > 
> > It is not possible to ensure this correction is properly done in
> > software, there is no point in letting the user set those bits.
> > 
> > 
> 
> I see your point.
> 
> However, could you share your idea on testing setting RTC time to year
> 2100 on this particular IC (by using hctosys and friends)?
> 

You can use rtc from
https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/

You can also use rtc-range with your patch to observe that it fails in
2100.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
