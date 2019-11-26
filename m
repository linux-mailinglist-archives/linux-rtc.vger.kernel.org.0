Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB4410A5D7
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2019 22:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfKZVQc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Nov 2019 16:16:32 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:57517 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfKZVQc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 26 Nov 2019 16:16:32 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-1-1723-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 50F5B1C0002;
        Tue, 26 Nov 2019 21:16:30 +0000 (UTC)
Date:   Tue, 26 Nov 2019 22:16:29 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] rtc: ds1685: fix build error with make W=1
Message-ID: <20191126211629.GP299836@piout.net>
References: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
 <20191122102212.400158-5-alexandre.belloni@bootlin.com>
 <bee6cf44-a3e5-f217-388c-47165f1d5f90@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bee6cf44-a3e5-f217-388c-47165f1d5f90@gentoo.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/11/2019 00:19:45-0500, Joshua Kinard wrote:
> On 11/22/2019 05:22, Alexandre Belloni wrote:
> > Fix the following parsing errors when building with W=1:
> > drivers/rtc/rtc-ds1685.c:1053: error: Cannot parse struct or union!
> > drivers/rtc/rtc-ds1685.c:1062: error: Cannot parse struct or union!
> > drivers/rtc/rtc-ds1685.c:1363: warning: cannot understand function prototype: 'struct platform_driver ds1685_rtc_driver = '
> > 
> > Cc: Joshua Kinard <kumba@gentoo.org>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >  drivers/rtc/rtc-ds1685.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> > index 8419595e7da7..56c670af2e50 100644
> > --- a/drivers/rtc/rtc-ds1685.c
> > +++ b/drivers/rtc/rtc-ds1685.c
> > @@ -1039,7 +1039,7 @@ ds1685_rtc_sysfs_serial_show(struct device *dev,
> >  }
> >  static DEVICE_ATTR(serial, S_IRUGO, ds1685_rtc_sysfs_serial_show, NULL);
> >  
> > -/**
> > +/*
> >   * struct ds1685_rtc_sysfs_misc_attrs - list for misc RTC features.
> >   */
> >  static struct attribute*
> > @@ -1050,7 +1050,7 @@ ds1685_rtc_sysfs_misc_attrs[] = {
> >  	NULL,
> >  };
> >  
> > -/**
> > +/*
> >   * struct ds1685_rtc_sysfs_misc_grp - attr group for misc RTC features.
> >   */
> >  static const struct attribute_group
> > @@ -1355,7 +1355,7 @@ ds1685_rtc_remove(struct platform_device *pdev)
> >  	return 0;
> >  }
> >  
> > -/**
> > +/*
> >   * ds1685_rtc_driver - rtc driver properties.
> >   */
> >  static struct platform_driver ds1685_rtc_driver = {
> > 
> 
> /** is for kerneldoc comments.  Is this a bug in kbuild's W=1 implementation
> of not parsing kerneldoc on a struct correctly?  I'm sure I got that syntax
> for structs out of the kerneldoc guide, unless it changed at some point.
> 

I would think it is gcc that is choking on that, probably because the
members are not described.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
