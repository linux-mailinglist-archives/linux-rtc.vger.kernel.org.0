Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFF72356F7
	for <lists+linux-rtc@lfdr.de>; Sun,  2 Aug 2020 15:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbgHBNEs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 2 Aug 2020 09:04:48 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:39681 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgHBNEs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 2 Aug 2020 09:04:48 -0400
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id A54B9100005;
        Sun,  2 Aug 2020 13:04:39 +0000 (UTC)
Date:   Sun, 2 Aug 2020 15:04:39 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Grant Feng <von81@163.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: interface^ 1969-12-31T23:59:59 is set as rtc_time
 if rtc_time is invalid in __rtc_read_time
Message-ID: <20200802130439.GF3679@piout.net>
References: <20200801112007.2148-1-von81@163.com>
 <20200801132813.GE3679@piout.net>
 <a83510fa-54be-8dc1-8ec1-b2957346e402@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a83510fa-54be-8dc1-8ec1-b2957346e402@163.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 02/08/2020 14:51:41+0800, Grant Feng wrote:
> On 2020-08-01 21:28, Alexandre Belloni wrote:
> > On 01/08/2020 19:20:07+0800, Grant Feng wrote:
> > > 1969-12-31T23:59:59 is an error more clear than Invalid argument
> > Definitively not, 1969-12-31T23:59:59 is a valid date and should not be
> > returned when it is known the current date is not set in the RTC.
> 'rtc_valid_tm' is used to check rtc_time and 1969-12-31T23:59:59 is invalid.
> when the RTC clock is not set, some rtc devices always return '0' or almost
> random data, and different rtc devices may give different return data.
> so, I think, it's usful to return a default date when the current date is
> not set in the RTC.

You are not solving the issue you mention here. If the RTC doesn't know
whether the date/time is invalid and the core think it is valid, then
your code will not run.

> > > For example, when the RTC clock is not set, it will print a kernel
> > > error log every time someone tries to read the clock:
> > >          ~ # hwclock -r
> > >          hwclock: RTC_RD_TIME: Invalid argument
> > > 
> > > It's clear and easy to understand what happened if print
> > > 1969-12-31T23:59:59 in this situation：
> > >          ~ # hwclock -r
> > >          Wed Dec 31 23:59:59 1969  0.000000 seconds
> > > 
> > How do you know this is an error an not what is actually set on the RTC?
> 'rtc_valid_tm' will check rtc_time when someone set the RTC, the time
> should not be earlier than 1970-1-1T00:00:00. so 1969-12-31T23:59:59
> can not be actually set on the RTC.
>     When someone get
> ~ # hwclock -r
> Wed Dec 31 23:59:59 1969  0.000000 seconds
>     he knows: the RTC time doesn't match my watch, change it now.
> but still lots of people don't know what happened if they see
> ~ # hwclock -r
> hwclock: RTC_RD_TIME: Invalid argument
> 

This makes userspace checking for errors way worse. Think about it, first
userspace will need to check for an error when calling the ioctl then it
will have to check the time and consider a vlid date invalid. Seriously,
if hwclock doesn't do what you want, you can either patch it or use
another tool.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
