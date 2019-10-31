Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 040C1EAD66
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2019 11:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbfJaK1U (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 31 Oct 2019 06:27:20 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:50193 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbfJaK1U (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 31 Oct 2019 06:27:20 -0400
X-Originating-IP: 91.217.168.176
Received: from localhost (unknown [91.217.168.176])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D339E24000A;
        Thu, 31 Oct 2019 10:27:17 +0000 (UTC)
Date:   Thu, 31 Oct 2019 11:27:17 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     Ilya Ledvich <ilya@compulab.co.il>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: em3027: correct month value
Message-ID: <20191031102717.GB2967@piout.net>
References: <20191031073643.19410-1-ilya@compulab.co.il>
 <CABMQnVJ-Y4fiE3LnS=JpGHyGdf11KTf0xnmnd-5h5=zpQAx0TQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABMQnVJ-Y4fiE3LnS=JpGHyGdf11KTf0xnmnd-5h5=zpQAx0TQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 31/10/2019 18:53:00+0900, Nobuhiro Iwamatsu wrote:
> Hi,
> 
> 2019年10月31日(木) 16:57 Ilya Ledvich <ilya@compulab.co.il>:
> >
> > The RTC month value is 1-indexed, but the kernel assumes it is 0-indexed.
> > This may result in the RTC not rolling over correctly.
> >
> > Signed-off-by: Ilya Ledvich <ilya@compulab.co.il>
> > ---
> >  drivers/rtc/rtc-em3027.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rtc/rtc-em3027.c b/drivers/rtc/rtc-em3027.c
> > index 77cca1392253..ef3792543f93 100644
> > --- a/drivers/rtc/rtc-em3027.c
> > +++ b/drivers/rtc/rtc-em3027.c
> > @@ -71,7 +71,7 @@ static int em3027_get_time(struct device *dev, struct rtc_time *tm)
> >         tm->tm_hour     = bcd2bin(buf[2]);
> >         tm->tm_mday     = bcd2bin(buf[3]);
> >         tm->tm_wday     = bcd2bin(buf[4]);
> > -       tm->tm_mon      = bcd2bin(buf[5]);
> > +       tm->tm_mon      = bcd2bin(buf[5]) - 1;
> >         tm->tm_year     = bcd2bin(buf[6]) + 100;
> >
> >         return 0;
> > @@ -94,7 +94,7 @@ static int em3027_set_time(struct device *dev, struct rtc_time *tm)
> >         buf[3] = bin2bcd(tm->tm_hour);
> >         buf[4] = bin2bcd(tm->tm_mday);
> >         buf[5] = bin2bcd(tm->tm_wday);
> > -       buf[6] = bin2bcd(tm->tm_mon);
> > +       buf[6] = bin2bcd(tm->tm_mon) + 1;
> 
> I think '+'1 should be set in bin2bcd().
> 

This is correct.

Ilya, could you also run
https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/tree/rtc-range.c
on that rtc? I'm interested in the full output. It seems this RTC
working range is 2000 to 2079

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
