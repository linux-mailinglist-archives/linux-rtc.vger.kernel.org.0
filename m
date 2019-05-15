Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 735C01F608
	for <lists+linux-rtc@lfdr.de>; Wed, 15 May 2019 15:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfEONyL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 May 2019 09:54:11 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34672 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728215AbfEONyK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 15 May 2019 09:54:10 -0400
Received: by mail-ed1-f68.google.com with SMTP id p27so4292619eda.1
        for <linux-rtc@vger.kernel.org>; Wed, 15 May 2019 06:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FKV+uSM8ED3SyB5lJb/FZewRZDk4c2DIjIkqO9WcvJ0=;
        b=NVTnC0Ie5XWK7QVTDvul3LRHk3EvVSRyo7cTLoQNPRAamduiRDXkYcJ/Ytv6iDxH2/
         23bQAXbUZ6H4BT5QlNky91b6mn07g0QlVEoXG1OFGaCYDlGjdwMnNa5Ii36QfRHNH9hA
         +D5nxQ1oFWbIRmtkuB1a32nvJMr2C2JsN7NqWhX6lk6JETQCdw4D/8tIZ2sCXIoW5isk
         ElgW++GL8jgwpOM82/g/xJBxB2mxW+SW4GHJhdRA5iXw1zHlvipBzkMrJsAQqcjn6n6A
         TYgr2Fb9T8vmo2GE2Y9FZyzfykFAckO+GPz7q0BuawIUstPOLrXl+y8gs/TtK3RDhrkF
         UuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FKV+uSM8ED3SyB5lJb/FZewRZDk4c2DIjIkqO9WcvJ0=;
        b=dBQ78F5pdfs56lPnKApMDPQ3g0mn6Lansw60WIu7dlSu6o4oUPCLXcrEXLW+i9cDW7
         vG6IMDlK2ZkxPZrHA17Qsq2xom2sKGmPkC5Mb3bCAL2SLgPcEJA5KSp/KqoSxff09FR3
         3fpGU85YprrQ60EPCs3CeaphO/HIeusKzkMUEx5lzG+PyybTFpbpFF55+S5ekLoExu06
         tGcVXddIPS19tLd7EWlKcaq9auOYlNiB1K5HRiS5NAZjL34nwkLHg+og6qdgg2zkL3MF
         7f0YmwpjsCljcxveg2HN2U5wvFxyYxfVb7FPwjk2zPrjtQ3CCHiKJDEk1/Hu7Wr15xsE
         oIkA==
X-Gm-Message-State: APjAAAXRA2Oh6nMsnk2ck3x1bqpCneVVxC3VUbqhNE8lWNgu4YnwgnVh
        WDzAZq1MyG1rVFz0G3VDf5b9BZmPJI14g0P5lEuIqA==
X-Google-Smtp-Source: APXvYqzRmoeD2vpymxFiAGQFSGz4QZRDGGzJMEQiMwkPUkjEncjhQY5mvhbAnBhNEbe10t44+E9P0okUkbnlKj2a/qc=
X-Received: by 2002:a17:906:5e10:: with SMTP id n16mr32619643eju.143.1557928448803;
 Wed, 15 May 2019 06:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190515111436.14513-1-roman.stratiienko@globallogic.com>
 <20190515123241.GL7622@piout.net> <CAODwZ7vuBndm2i7CFm0RT1wM3phyQkQ+g0Gyjb1GE7k1-bHccQ@mail.gmail.com>
In-Reply-To: <CAODwZ7vuBndm2i7CFm0RT1wM3phyQkQ+g0Gyjb1GE7k1-bHccQ@mail.gmail.com>
From:   Roman Stratiienko <roman.stratiienko@globallogic.com>
Date:   Wed, 15 May 2019 16:53:57 +0300
Message-ID: <CAODwZ7t1UgPMeMYcadALD_gCa1Zp1fq65oF9fL65u5DTTft0Sw@mail.gmail.com>
Subject: Re: [PATCH] rtc: test: enable wakeup flags
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre,

Thank you for the review.
See my answers below.


On Wed, May 15, 2019 at 3:32 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> (You didn't use my correct email address, please update your kernel)

Fixed.

>
> On 15/05/2019 14:14:36+0300, roman.stratiienko@globallogic.com wrote:
> > From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> >
> > Alarmtimer interface uses only the RTC with wekeup flags enabled.
> > Allow to use rtc-test driver with alarmtimer interface.
> >
> > Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> > ---
> >  drivers/rtc/rtc-test.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-test.c b/drivers/rtc/rtc-test.c
> > index 6c5f09c815e8..c839ae575c77 100644
> > --- a/drivers/rtc/rtc-test.c
> > +++ b/drivers/rtc/rtc-test.c
> > @@ -123,6 +123,8 @@ static int test_probe(struct platform_device *plat_dev)
> >
> >       platform_set_drvdata(plat_dev, rtd);
> >
> > +     device_init_wakeup(&plat_dev->dev, 1);
> > +
>
> The first created RTC doesn't have any alarm, so this must not be done
> for all the devices.

Thanks. I will fix this in v2.

>
> Also, this driver will never wake up the platform so I'm not sure it is
> relevant to test alarmtimers.

Alarmtimer interface relies only on RTC with alarm support,
but it also checks wake flags for some reason.
As far as rtc-test driver do have alarm support, I expect
that related drivers should use it.

Let me share some information about my use-case:
Alarmtimer support is required for generic AOSP bluedroid library.
To enable Bluetooth in Android on the devices that does not
have hardware RTC, enabling rtc-test driver is a good option.

>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Best regards,
Roman Stratiienko
Global Logic Inc.
