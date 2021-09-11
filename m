Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B095D407A57
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Sep 2021 21:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbhIKTrz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 11 Sep 2021 15:47:55 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:41815 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhIKTrz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 11 Sep 2021 15:47:55 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 3549A40002;
        Sat, 11 Sep 2021 19:46:41 +0000 (UTC)
Date:   Sat, 11 Sep 2021 21:46:40 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] RTC changes for 5.15
Message-ID: <YT0HoCMW6nGEnpPL@piout.net>
References: <YTzSVk5Scx/nRP7K@piout.net>
 <CAHk-=wgPJrMhr1_62O2xwD1QbT9oxJJ_uXw2mm6sa0hNDrFuwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgPJrMhr1_62O2xwD1QbT9oxJJ_uXw2mm6sa0hNDrFuwQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/09/2021 10:05:02-0700, Linus Torvalds wrote:
> On Sat, Sep 11, 2021 at 8:59 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > The broken down time conversion is similar to what is done
> > in the time subsystem since v5.14.
> 
> By "similar" you mean "identical", no?
> 
> Why is the rtc subsystem not just using the generic time64_to_tm()?
> 
> Yes, yes, I realize that due to historical mistakes, there's a
> duplicate 'struct rtc_time' struct, but it turns out that that is
> _identical_ to 'struct tm' except it also has a 'int tm_isdst' at the
> end.
> 
> So you could literally make a union of the two, pass the 'struct tm'
> part down to the generic code, and just do
> 
>      rtc_tm->tm_isdst = 0;
> 
> at the end.
> 
> Rather than have a duplicate copy of that admittedly clever Neri and
> Schneider algorithm.
> 
> Hmm?
> 

Yes, most of it is historical, I did have a look at removing the copy
but at the time, rtc_time64_to_tm was slightly more efficient because
it knew the time was positive.

The other issue is that struct rtc_time is exposed to userspace while
the kernel struct tm is not and this would tie both struct and if you
look close enough, struct tm has long tm_year and struct rtc_time has
int tm_year which on 32-bit ARM has a different size.

I've been reluctant to change struct tm because I didn't take the time
to check the impact on all the users (IIRC, mainly in filesystems).

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
