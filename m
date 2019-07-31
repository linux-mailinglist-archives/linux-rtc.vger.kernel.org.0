Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B51277B802
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2019 04:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfGaCdo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Jul 2019 22:33:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:59454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbfGaCdn (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 30 Jul 2019 22:33:43 -0400
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4044F206E0;
        Wed, 31 Jul 2019 02:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564540423;
        bh=mOgp1gGuB0ZTei6SqT972fot/2M39pzT02+gl9jejbA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YJ8V0yxJ+fxwpThn3lp89oCV859VEwbAMyhwRys3utwcaQGiEo/xYZpI75BK70cP+
         xMqnsgC+k+L+5096dJwXEKnTIJi7jmLhvVsR5CxlULbx3QTFzDdmR+TOTmX0suZamq
         bgjrl/NHjn8IYsE9tlcQtbV77Nqnv5iAtVA8qFAY=
Date:   Tue, 30 Jul 2019 19:33:41 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Hillf Danton <hdanton@sina.com>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: Reminder: 1 open syzbot bug in rtc subsystem
Message-ID: <20190731023341.GD687@sol.localdomain>
Mail-Followup-To: Hillf Danton <hdanton@sina.com>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <20190724025008.GL643@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724025008.GL643@sol.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jul 29, 2019 at 03:47:45PM +0800, Hillf Danton wrote:
> 
> On Tue, 23 Jul 2019 19:50:08 -0700
> > 
> > [This email was generated by a script.  Let me know if you have any suggestions
> > to make it better, or if you want it re-generated with the latest status.]
> > 
> > Of the currently open syzbot reports against the upstream kernel, I've manually
> > marked 1 of them as possibly being a bug in the rtc subsystem.
> > 
> > If you believe this bug is no longer valid, please close the syzbot report by
> > sending a '#syz fix', '#syz dup', or '#syz invalid' command in reply to the
> > original thread, as explained at https://goo.gl/tpsmEJ#status
> > 
> > If you believe I misattributed this bug to the rtc subsystem, please let me
> > know, and if possible forward the report to the correct people or mailing list.
> > 
> > Here is the bug:
> > 
> > --------------------------------------------------------------------------------
> > Title:              BUG: workqueue lockup (4)
> > Last occurred:      40 days ago
> > Reported:           289 days ago
> > Branches:           Mainline and others
> > Dashboard link:     https://syzkaller.appspot.com/bug?id=0041bf1423916e9ae458b08b760e269a33c14960
> > Original thread:    https://lkml.kernel.org/lkml/0000000000005764090577a27486@google.com/T/#u
> > 
> Better if %s=lkml.kernel.org=lore.kernel.org=
> 

Out of curiosity, is there a reason for this?  They both go to the same place,
but the reason I used lkml.kernel.org is that some high-profile kernel
developers (e.g. Andrew Morton) are using it in the "Link: " tag in commits.
So it seems like lkml.kernel.org is maybe "right" one that is intended to
always keep working in the future?

But then I see Greg KH is using lore.kernel.org, so maybe it doesn't matter?

Maybe lore.kernel.org is better because people won't confuse it with lkml.org
and refuse to go to it :-)

- Eric
