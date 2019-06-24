Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4AA508FF
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2019 12:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbfFXKem (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 Jun 2019 06:34:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:34228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726774AbfFXKem (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 24 Jun 2019 06:34:42 -0400
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 91F7920674;
        Mon, 24 Jun 2019 10:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561372480;
        bh=SV0KHLSN6vZLGUuMtl2V9cwKaGSyM/pYO/cQlIB7+N8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KHXvwsNq1LygJo8JdUvMLWgk46PFYmBHeLBdlNfQw3UC89qCWnRZmfG6IOB21ylON
         sX4XSQm8nZzE3qS7ahxxH/zkrTtLrYOOv68hB7DwPIyJWqMEzeAgesl5XLhbwarzMb
         f/MogTTy76s13ELZfcWWC7vYoiRCQOZtx3USwQ7U=
Received: by mail-wr1-f41.google.com with SMTP id f9so13278489wre.12;
        Mon, 24 Jun 2019 03:34:40 -0700 (PDT)
X-Gm-Message-State: APjAAAUnMlt9Lkdp+F40LQsUHHFP4ZLqzKp03mbQVZ3T8lYvh6DzHMiW
        A6iYgwsfEliwnDmrKLE2xDtG1FFnK+yx/Q7uJt0=
X-Google-Smtp-Source: APXvYqyH1r9rbTDr7f7A3CGLAPvjyUC9pTOBeqwhjMPglEFiQUwQ6jrIqyXxSd9CiE9M6mJbLG2M70cCye4u1ookXM0=
X-Received: by 2002:adf:fc85:: with SMTP id g5mr22528717wrr.324.1561372479250;
 Mon, 24 Jun 2019 03:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190604042337.26129-1-wens@kernel.org> <20190620162220.GA23549@piout.net>
In-Reply-To: <20190620162220.GA23549@piout.net>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Mon, 24 Jun 2019 18:34:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v67sf3L9zH9Li6tF3xunQ4-isoodBLQmSv2VJtAj6hS7Ug@mail.gmail.com>
Message-ID: <CAGb2v67sf3L9zH9Li6tF3xunQ4-isoodBLQmSv2VJtAj6hS7Ug@mail.gmail.com>
Subject: Re: [PATCH 0/3] rtc: pcf8563: Fix unhandled interrupt storm
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jun 21, 2019 at 12:22 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 04/06/2019 12:23:34+0800, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > Hi everyone,
> >
> > While bringing up my Pine H64, I encountered an interrupt storm from the
> > pcf8563 RTC. The RTC chip's interrupt line is shared with the PMIC, and
> > was not properly added to the device tree. Also, the driver was using an
> > trigger method incompatible with the PMIC, preventing the interrupt line
> > from being shared. Last, the driver only clears and masks the alarm
> > interrupt, while leaving the timer interrupt untouched. This is a
> > problem if previous systems left the timer interrupt enabled, and there
> > was an interrupt pending.
> >
> > This patch set fixes all three issues, one per patch.
> >
> > Please have a look.
> >
>
> I don't have that particular RTC so I can't test but the interrupt
> handling in pcf8563_irq seems problematic too. I guess the RTC will only
> trigger once per second because the call to pcf8563_set_alarm_mode will
> explicitely leave the alarm enabled. The core doesn't really care but it
> doesn't really expect the alarm to stay enabled. i.e. It will ensure the
> alarm is enabled again after setting it when necessary. I think it would
> be safer to simply clear both AIE and AF here. Could you test?

Yeah, that bit looked weird to me as well. And actually the alarm doesn't
go down to the second, only the minute.

Is there a test program I can use to test the alarms?

Thanks
ChenYu

> > Chen-Yu Tsai (3):
> >   rtc: pcf8563: Fix interrupt trigger method
> >   rtc: pcf8563: Clear event flags and disable interrupts before
> >     requesting irq
> >   arm64: dts: allwinner: h6: Pine H64: Add interrupt line for RTC
> >
> >  .../arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts |  2 ++
> >  drivers/rtc/rtc-pcf8563.c                           | 13 ++++++-------
> >  2 files changed, 8 insertions(+), 7 deletions(-)
> >
> > --
> > 2.20.1
> >
>
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
