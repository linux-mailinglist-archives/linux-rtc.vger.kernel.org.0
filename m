Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41FE391722
	for <lists+linux-rtc@lfdr.de>; Wed, 26 May 2021 14:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233714AbhEZMOd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 26 May 2021 08:14:33 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44293 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233709AbhEZMOc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 26 May 2021 08:14:32 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5A4216000A;
        Wed, 26 May 2021 12:12:59 +0000 (UTC)
Date:   Wed, 26 May 2021 14:12:59 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "qxj511mail@gmail.com" <qxj511mail@gmail.com>
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        "a.zummo" <a.zummo@towertech.it>,
        linux-rtc <linux-rtc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        =?utf-8?B?6YKx5pmT6YeR?= <qiuxiaojin@cvte.com>
Subject: Re: Re: [PATCH] rtc: rs5c372: Fix read the time from RTC is illegal
 When reading time from an uninitialized RTC chip, The value may be illegal
Message-ID: <YK47S4840JFacxfT@piout.net>
References: <20210520033156.23209-1-qxj511mail@gmail.com>
 <CABMQnV+5gN_6BA4tYS+GugrA0HrQD9+_EkQk_emqsUy1YzFCOA@mail.gmail.com>
 <202105251924130320028@gmail.com>
 <YK1pmXd8ODTzw0r/@piout.net>
 <202105261935305975621@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202105261935305975621@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/05/2021 19:35:31+0800, qxj511mail@gmail.com wrote:
> > If the time on the RTC is invalid, then rtc_valid_tm has to fail, there
> > is nothing to fix here.
> 
> I mean, if you try to get the time or execute hwclock command, Invalid arguments are returned when the RTC chip is not initialized
> therefore，we need to get a valid time
> 

Well, the time is invalid so hwclock needs to know it is invalid.
Returning a bogus time and date doesn't make it right. hwclock needs to
fail.

> 
> 
> qxj511mail@gmail.com
>  
> From: Alexandre Belloni
> Date: 2021-05-26 05:18
> To: qxj511mail@gmail.com
> CC: Nobuhiro Iwamatsu; a.zummo; linux-rtc; linux-kernel; 邱晓金
> Subject: Re: Re: [PATCH] rtc: rs5c372: Fix read the time from RTC is illegal When reading time from an uninitialized RTC chip, The value may be illegal
> Hi,
>  
> On 25/05/2021 19:24:14+0800, qxj511mail@gmail.com wrote:
> > Please briefly describe the patch contained in the email to the subject.
> > And, please write a description of the patch in the text
> > ---->   The legal days are 1 to 31 and the legal month is less than or equal to 12.
> >            But for an uninitialized RTC chip, the time is random.
> >            Days and month may be zero, leading to RTC_valid_TM failed
> > 
>  
> If the time on the RTC is invalid, then rtc_valid_tm has to fail, there
> is nothing to fix here.
>  
> > add description  && fix build error, so I modefied my code :
> >  
> > Signed-off-by: qiuxiaojin <qiuxiaojin@cvte.com>
> > ---
> >  drivers/rtc/rtc-rs5c372.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> > index 3bd6eaa0dcf6..cb3f90983778 100644
> > --- a/drivers/rtc/rtc-rs5c372.c
> > +++ b/drivers/rtc/rtc-rs5c372.c
> > @@ -128,6 +128,9 @@ struct rs5c372 {
> >   char *regs;
> >  };
> >  
> > +
> > +static int rs5c372_rtc_set_time(struct device *dev, struct rtc_time *tm);
> > +
> >  static int rs5c_get_regs(struct rs5c372 *rs5c)
> >  {
> >   struct i2c_client *client = rs5c->client;
> > @@ -212,6 +215,7 @@ static int rs5c372_rtc_read_time(struct device *dev, struct rtc_time *tm)
> >   struct rs5c372 *rs5c = i2c_get_clientdata(client);
> >   int status = rs5c_get_regs(rs5c);
> >   unsigned char ctrl2 = rs5c->regs[RS5C_REG_CTRL2];
> > + int flags_utime = 0;
> >  
> >   if (status < 0)
> >   return status;
> > @@ -239,12 +243,28 @@ static int rs5c372_rtc_read_time(struct device *dev, struct rtc_time *tm)
> >   tm->tm_wday = bcd2bin(rs5c->regs[RS5C372_REG_WDAY] & 0x07);
> >   tm->tm_mday = bcd2bin(rs5c->regs[RS5C372_REG_DAY] & 0x3f);
> >  
> > + /* The value read from the register may be zero, which is an illegal value */
> > + if (tm->tm_mday < 1) {
> > + flags_utime++;
> > + tm->tm_mday = 1;
> > + }
> > +
> >   /* tm->tm_mon is zero-based */
> >   tm->tm_mon = bcd2bin(rs5c->regs[RS5C372_REG_MONTH] & 0x1f) - 1;
> >  
> > + if (tm->tm_mon < 0) {
> > + /* avoid illegal month */
> > + flags_utime++;
> > + tm->tm_mon = 0;
> > + }
> > +
> >   /* year is 1900 + tm->tm_year */
> >   tm->tm_year = bcd2bin(rs5c->regs[RS5C372_REG_YEAR]) + 100;
> >  
> > + /* update legal time */
> > + if (flags_utime > 0)
> > + rs5c372_rtc_set_time(dev, tm);
> > +
> >   dev_dbg(&client->dev, "%s: tm is secs=%d, mins=%d, hours=%d, "
> >   "mday=%d, mon=%d, year=%d, wday=%d\n",
> >   __func__,
> > -- 
> > 2.29.0
> > 
> > 
> > 
> > qxj511mail@gmail.com
> >  
> > From: Nobuhiro Iwamatsu
> > Date: 2021-05-24 12:40
> > To: qxj511mail
> > CC: Alessandro Zummo; Alexandre Belloni; linux-rtc; Linux Kernel Mailing List; qiuxiaojin
> > Subject: Re: [PATCH] rtc: rs5c372: Fix read the time from RTC is illegal When reading time from an uninitialized RTC chip, The value may be illegal
> > Hi,
> >  
> > 2021年5月20日(木) 12:32 <qxj511mail@gmail.com>:
> > >
> > > From: qiuxiaojin <qiuxiaojin@cvte.com>
> >  
> > Please briefly describe the patch contained in the email to the subject.
> > And, please write a description of the patch in the text
> >  
> > >
> > > Signed-off-by: qiuxiaojin <qiuxiaojin@cvte.com>
> > > ---
> > >  drivers/rtc/rtc-rs5c372.c | 16 ++++++++++++++++
> > >  1 file changed, 16 insertions(+)
> > >
> > > diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> > > index 3bd6eaa0dcf6..ce61e15d5f3a 100644
> > > --- a/drivers/rtc/rtc-rs5c372.c
> > > +++ b/drivers/rtc/rtc-rs5c372.c
> > > @@ -212,6 +212,7 @@ static int rs5c372_rtc_read_time(struct device *dev, struct rtc_time *tm)
> > >         struct rs5c372  *rs5c = i2c_get_clientdata(client);
> > >         int             status = rs5c_get_regs(rs5c);
> > >         unsigned char ctrl2 = rs5c->regs[RS5C_REG_CTRL2];
> > > +       int flags_utime = 0;
> > >
> > >         if (status < 0)
> > >                 return status;
> > > @@ -239,12 +240,27 @@ static int rs5c372_rtc_read_time(struct device *dev, struct rtc_time *tm)
> > >         tm->tm_wday = bcd2bin(rs5c->regs[RS5C372_REG_WDAY] & 0x07);
> > >         tm->tm_mday = bcd2bin(rs5c->regs[RS5C372_REG_DAY] & 0x3f);
> > >
> > > +       if (tm->tm_mday < 1) {
> > > +               // The value read from the register may be zero, which is an illegal value
> >  
> > Please use C89 style commet (/* */).
> >  
> > > +               flags_utime = flags_utime + 1;
> >  
> > I like using ++ (flags_utime++).
> >  
> > > +               tm->tm_mday = 1;
> > > +       }
> > > +
> > >         /* tm->tm_mon is zero-based */
> > >         tm->tm_mon = bcd2bin(rs5c->regs[RS5C372_REG_MONTH] & 0x1f) - 1;
> > >
> > > +       if (tm->tm_mon < 0) {
> > > +               flags_utime = flags_utime + 1;
> > > +               tm->tm_mday = 0;
> > > +       }
> > > +
> > >         /* year is 1900 + tm->tm_year */
> > >         tm->tm_year = bcd2bin(rs5c->regs[RS5C372_REG_YEAR]) + 100;
> > >
> > > +       if (flags_utime > 0) {
> >  
> > {} is unnecessary.
> >  
> > > +               rs5c372_rtc_set_time(dev, tm);
> >  
> > A build error will occur because there is no declaration of
> > rs5c372_rtc_set_time.
> > Please make sure this can be compiled.
> >  
> > > +       }
> > > +
> > >         dev_dbg(&client->dev, "%s: tm is secs=%d, mins=%d, hours=%d, "
> > >                 "mday=%d, mon=%d, year=%d, wday=%d\n",
> > >                 __func__,
> > > --
> > > 2.29.0
> > >
> >  
> >  
> > -- 
> > Nobuhiro Iwamatsu
> >    iwamatsu at {nigauri.org / debian.org}
> >    GPG ID: 40AD1FA6
>  
>  
>  
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
