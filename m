Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 554D312F681
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Jan 2020 11:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgACKCf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Jan 2020 05:02:35 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:55947 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgACKCf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Jan 2020 05:02:35 -0500
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0AC84200004;
        Fri,  3 Jan 2020 10:02:32 +0000 (UTC)
Date:   Fri, 3 Jan 2020 11:02:32 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc:     J William Piggott <elseifthen@gmx.com>,
        Karel Zak <kzak@redhat.com>, util-linux@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Subject: Re: [bugreport] "hwclock -w" reset time instead of setting the right
 time
Message-ID: <20200103100232.GH3040@piout.net>
References: <CABXGCsODr3tMpQxJ_nhWQQg5WGakFt4Yu5B8ev6ErOkc+zv9kA@mail.gmail.com>
 <20200101141748.GA191637@mit.edu>
 <CABXGCsOv26W6aqB5WPMe-mEynmwy55DTfTeL5Dg9vRq6+Y6WvA@mail.gmail.com>
 <CABXGCsNkzPrjqMRaWpssorxzhMLWBvLeSw9BpKYr_DW4LJQECQ@mail.gmail.com>
 <20200102110817.ahqaqidw3ztw3kax@10.255.255.10>
 <CABXGCsNkm3VuzO60WBCi4VJmDnO=DmprQ1P=dd0FcW2-+dGc0w@mail.gmail.com>
 <20200102131434.tky2hquki23laqqo@10.255.255.10>
 <CABXGCsMV1GRiqrXCQGHqvpBiendU3mG36h0YoG=4nw6spZHq=w@mail.gmail.com>
 <nycvar.YAK.7.76.2001021153220.1385@zhn.tzk.pbz>
 <CABXGCsMLfarquWnzV=e3Ta_HPac+DALfKEOaD3rp5n9MPqgyFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXGCsMLfarquWnzV=e3Ta_HPac+DALfKEOaD3rp5n9MPqgyFw@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 02/01/2020 22:17:26+0500, Mikhail Gavrilov wrote:
> On Thu, 2 Jan 2020 at 21:59, J William Piggott <elseifthen@gmx.com> wrote:
> >
> > You've demonstrated that 'hwclock -w' does not 'reset' the RTC.
> >
> > Does your new motherboard use a battery backup for the RTC?
> > Is the battery good?
> >
> 
> If you look carefully demonstration the RTC 'reset' happens after
> reboot __only__ when 'hwclock -w' have been entered before reboot.
> So if I reboot the computer without 'hwclock -w' the RTC will be not reset.
> 

What is your kernel version?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
