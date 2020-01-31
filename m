Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7DF714EE39
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Jan 2020 15:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728730AbgAaON1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 31 Jan 2020 09:13:27 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:38899 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728659AbgAaON1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 31 Jan 2020 09:13:27 -0500
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1649AC0005;
        Fri, 31 Jan 2020 14:13:25 +0000 (UTC)
Date:   Fri, 31 Jan 2020 15:13:24 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     JH <jupiter.hce@gmail.com>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: rtc rtc0: Timeout trying to get valid LPSRT Counter read
Message-ID: <20200131141324.GD3515@piout.net>
References: <CAA=hcWQcVi79AW9aOSGQSzEwL-sPwvt=4zR+_25mJKvbkBON1w@mail.gmail.com>
 <20200112110353.GC1253990@piout.net>
 <CAA=hcWQoY95oPbLYyD306_wxmj=GU57t8m-m_kWwyy5-7Quj=Q@mail.gmail.com>
 <20200130104756.GC3583@piout.net>
 <CAA=hcWQaDrAHnLJXjcfvbL_+HkZraqfbCA70rfsD4i5kqXOqOw@mail.gmail.com>
 <20200130144044.GG3583@piout.net>
 <CAA=hcWQoacmPsi-VH3B1BGFHJhHi1a-tLaJXBiwAn03E7BiTiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=hcWQoacmPsi-VH3B1BGFHJhHi1a-tLaJXBiwAn03E7BiTiQ@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 31/01/2020 16:27:15+1100, JH wrote:
> Hi Alexandre,
> 
> On 1/31/20, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> >> So it was already included in 4.19, I don't need to patch it, that is
> >> good :-). Sorry I am still not clear how to stop that error message of
> >> "rtc rtc0: Timeout trying to get valid LPSRT Counter read", the
> >> message says "To avoid kernel hangs, put in timeouts", I am running
> >> kernel 4.19.75 on iMX6, where should I put in timeouts?
> >>
> >
> > The patch is adding the timeouts, without them, your kernel would be
> > freezing. I'd say your issue is the 32k clock.
> 
> Did you mean that is the issue of the hardware setup IMX6ULL for 32k
> RTC_XTALI? That is nominal frequency 32.768 kHz for IMX6ULL EVK and
> customized devices. Change to which frequency (64k?) can fix the
> problem and remove the error message?
> 

I can't help much more without seeing the schematics of your particular
board. 32k is the correct frequency but are your sure it is going to the
RTC? Are you sure you have power on VDD_SNVS_IN? Was there a security
violation detected?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
