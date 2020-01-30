Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2C0E14DCE8
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Jan 2020 15:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbgA3Okq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 30 Jan 2020 09:40:46 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:57271 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbgA3Okq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 30 Jan 2020 09:40:46 -0500
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5D16D200009;
        Thu, 30 Jan 2020 14:40:44 +0000 (UTC)
Date:   Thu, 30 Jan 2020 15:40:44 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     JH <jupiter.hce@gmail.com>
Cc:     linux-rtc@vger.kernel.org
Subject: Re: rtc rtc0: Timeout trying to get valid LPSRT Counter read
Message-ID: <20200130144044.GG3583@piout.net>
References: <CAA=hcWQcVi79AW9aOSGQSzEwL-sPwvt=4zR+_25mJKvbkBON1w@mail.gmail.com>
 <20200112110353.GC1253990@piout.net>
 <CAA=hcWQoY95oPbLYyD306_wxmj=GU57t8m-m_kWwyy5-7Quj=Q@mail.gmail.com>
 <20200130104756.GC3583@piout.net>
 <CAA=hcWQaDrAHnLJXjcfvbL_+HkZraqfbCA70rfsD4i5kqXOqOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=hcWQaDrAHnLJXjcfvbL_+HkZraqfbCA70rfsD4i5kqXOqOw@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/01/2020 22:27:37+1100, JH wrote:
> Hi Alexandre,
> 
> On 1/30/20, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> > On 30/01/2020 13:36:26+1100, JH wrote:
> >> Hi Alexandre,
> >>
> >> Thanks for your response.
> >>
> >> On 1/12/20, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> >> > Hi,
> >> >
> >> > On 02/01/2020 19:40:10+1100, JH wrote:
> >> >> Hi,
> >> >>
> >> >> I am running kernel 4.19 on imx6, could anyone help for clues what
> >> >> that error is about? What I could be missing and how to fix it?
> >> >>
> >> >
> >> > I'd say that you have an issue with the 32k clock or tamper detection,
> >> > have a look at this commit:
> >> >
> >> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cd7f3a249dbed2858e6c2f30e5be7f1f7a709ee2
> >>
> >> Is that a patch for 4.19.75? Or where can I download the patch for
> >> 4.19.75?
> >>
> >
> > This patch was included in 4.19. It introduced the message you are
> > seeing and the commit message explains why you are seeing it.
> 
> So it was already included in 4.19, I don't need to patch it, that is
> good :-). Sorry I am still not clear how to stop that error message of
> "rtc rtc0: Timeout trying to get valid LPSRT Counter read", the
> message says "To avoid kernel hangs, put in timeouts", I am running
> kernel 4.19.75 on iMX6, where should I put in timeouts?
> 

The patch is adding the timeouts, without them, your kernel would be
freezing. I'd say your issue is the 32k clock.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
