Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46BD790845
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Aug 2019 21:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbfHPTlB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Aug 2019 15:41:01 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37753 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfHPTlB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Aug 2019 15:41:01 -0400
Received: by mail-ot1-f66.google.com with SMTP id f17so10680237otq.4;
        Fri, 16 Aug 2019 12:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1R66yssDcHWAJTD9zChtdiGEAX5lfwcGN38LfE0HvWY=;
        b=YxkrC8O+lTFZXw87G0yjv5g2u9x3f7kf0/d9hAKBwKd2+HZ5/fAznYMbquKcQ73+3C
         Sf95YGEsxrtd4oMxJpoNxUbKujy0l6mPDYsGqrkeXVEx2eLzNO4y+grESbdDBvCdDq7u
         BCJJSf1IOgC40RDenRFQASYBrfmqqIEOnllNLKu8ixehulzEJBZW1kj2y35D7sht4Qc9
         lZamsveiNkCdTMIU3bwZUu3I82zqMemOg8Ffqbo+IpPEZ9o5+l23wnq96YpvEVBWHhJI
         qw3OYR/G/gbSJVy5DoJiMO/GUtBJ4JbHhTgF8A4q2TK1+3yFJdElqWVmq8A8UB1+8o3p
         yEWw==
X-Gm-Message-State: APjAAAXfLNy+XtHqEYlGuoyk2Sad2MG/TmkDmIlbBwel9tzEm/CTKkEZ
        ZUrkSdjZk2ZiZHwZRUSZ7m+mjdDiVPM=
X-Google-Smtp-Source: APXvYqyc99Wp93T8UT/+7bXts4cD13JmbrdL7MiQUZX03bZmkakHsBH1WsEbcFb+Z8UJpxrwnf+G8g==
X-Received: by 2002:a9d:5911:: with SMTP id t17mr8322460oth.159.1565984459913;
        Fri, 16 Aug 2019 12:40:59 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id t81sm1666315oie.48.2019.08.16.12.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2019 12:40:59 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id c7so10729583otp.1;
        Fri, 16 Aug 2019 12:40:58 -0700 (PDT)
X-Received: by 2002:a05:6830:1bd9:: with SMTP id v25mr905159ota.205.1565984458858;
 Fri, 16 Aug 2019 12:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190816024636.34738-1-biwen.li@nxp.com> <20190816080417.GB3545@piout.net>
 <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com> <20190816162825.GE3545@piout.net>
In-Reply-To: <20190816162825.GE3545@piout.net>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Fri, 16 Aug 2019 14:40:47 -0500
X-Gmail-Original-Message-ID: <CADRPPNQwcGrVXLm8eHbXKmyecMhT6Mt9rNGnspJA1+MnV4K8oQ@mail.gmail.com>
Message-ID: <CADRPPNQwcGrVXLm8eHbXKmyecMhT6Mt9rNGnspJA1+MnV4K8oQ@mail.gmail.com>
Subject: Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>, nandor.han@vaisala.com
Cc:     Biwen Li <biwen.li@nxp.com>, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Aug 16, 2019 at 11:30 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 16/08/2019 10:50:49-0500, Li Yang wrote:
> > On Fri, Aug 16, 2019 at 3:05 AM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > On 16/08/2019 10:46:36+0800, Biwen Li wrote:
> > > > Issue:
> > > >     - # hwclock -w
> > > >       hwclock: RTC_SET_TIME: Invalid argument
> > > >
> > > > Why:
> > > >     - Relative patch: https://lkml.org/lkml/2019/4/3/55 , this patch
> > > >       will always check for unwritable registers, it will compare reg
> > > >       with max_register in regmap_writeable.
> > > >
> > > >     - In drivers/rtc/rtc-pcf85363.c, CTRL_STOP_EN is 0x2e, but DT_100THS
> > > >       is 0, max_regiter is 0x2f, then reg will be equal to 0x30,
> > > >       '0x30 < 0x2f' is false,so regmap_writeable will return false.
> > > >
> > > >     - Root cause: the buf[] was written to a wrong place in the file
> > > >       drivers/rtc/rtc-pcf85363.c
> > > >
> > >
> > > This is not true, the RTC wraps the register accesses properly and this
> >
> > This performance hack probably deserve some explanation in the code comment.  :)
> >
> > > is probably something that should be handled by regmap_writable.
> >
> > The address wrapping is specific to this RTC chip.  Is it also
> > commonly used by other I2C devices?  I'm not sure if regmap_writable
> > should handle the wrapping case if it is too special.
> >
>
> Most of the i2c RTCs do address wrapping which is sometimes the only way
> to properly set the time.

Adding Mark and Nandor to the loop.

Regards,
Leo
