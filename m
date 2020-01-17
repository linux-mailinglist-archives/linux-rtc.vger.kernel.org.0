Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A79AE1413BA
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jan 2020 22:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729497AbgAQVys (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jan 2020 16:54:48 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:43055 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgAQVyr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jan 2020 16:54:47 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B79F11BF207;
        Fri, 17 Jan 2020 21:54:44 +0000 (UTC)
Date:   Fri, 17 Jan 2020 22:54:44 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Laurent Vivier <laurent@vivier.eu>,
        Filip Bozuta <Filip.Bozuta@rt-rk.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "amarkovic@wavecomp.com" <amarkovic@wavecomp.com>,
        "philmd@redhat.com" <philmd@redhat.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 08/12] linux-user: Add support for setting alsa timer
 enhanced read using ioctl
Message-ID: <20200117215444.GD3036@piout.net>
References: <1579103618-20217-9-git-send-email-Filip.Bozuta@rt-rk.com>
 <CAK8P3a187rPhma7Q6o+hCF3h0=5MLZwh49+JqKt6BvVsAB1efQ@mail.gmail.com>
 <ceaf44c0-fd6c-c280-7f95-7bc133553089@vivier.eu>
 <CAK8P3a36KqWD4fKBLDpFhJg079bNdJDSDUAP2Zu_i1+H62Q6ZQ@mail.gmail.com>
 <518d717d-9f1e-e00e-f2a9-df8861241d1c@rt-rk.com>
 <cdcce2a3-00f5-f6d1-3083-dc36892ac5b4@vivier.eu>
 <CAL1e-=i3-nYJMo6ptA7fdcK8r6P4vv20x2+LLV6BA9ELO8H53w@mail.gmail.com>
 <CAL1e-=g8X___59zLPKLRjFNAP9bs3rVWhc8+OhMuF3TriBiynw@mail.gmail.com>
 <CAK8P3a3o1tM__gP0keo0Dg03tiJQt=5hRGhiXWga4B6gjsVbxA@mail.gmail.com>
 <CAL1e-=gv_L0fuq9t8mmOiZ2D-CwpPrZZOjwrDwKwe09jvWJpXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL1e-=gv_L0fuq9t8mmOiZ2D-CwpPrZZOjwrDwKwe09jvWJpXQ@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

Quick answers to your very good questions below:

On 17/01/2020 21:50:34+0100, Aleksandar Markovic wrote:
> Alexandre (and Arnd too, or any other person knowledgeable in the area),
> 
> I just need to clarify a couple of details with you, please.
> 
> Firstly, here is what man page rtc(4) says:
> 
> "The /dev/rtc (or /dev/rtc0, /dev/rtc1, etc.) device can be opened
> only once (until it is closed) and it is read-only. On read(2) and
> select(2) the calling process is blocked until the next interrupt from
> that RTC is received. Following the interrupt, the process can read a
> long integer, of which the least significant byte contains a bit mask
> encoding the types of interrupt that occurred, while the remaining 3
> bytes contain the number of interrupts since the last read(2)."
> 
> So, it looks read() will always return only 4 bytes of useful info
> (regardless of host being 32-bit/64-bit).
> 
> My questions are:
> 
> - Is the description in man page genuinely accurate?
> 

It is accurate. It is a mask of:

#define RTC_IRQF 0x80   /* Any of the following is active */
#define RTC_PF 0x40     /* Periodic interrupt */
#define RTC_AF 0x20     /* Alarm interrupt */
#define RTC_UF 0x10     /* Update interrupt for 1Hz RTC */

Which will most likely be RTC_IRQF | RTC_AF.

> - To me (but I am really an outsider to using RTC in applications),
> this feature (blocking read()/select()) even looks very nice and
> convenient, in all fairness. But I would like to ask you: Is this
> feature used rarely or frequently by other libraries/tools/etc.? In
> other words, is the feature "obscure" or "crucial" part of RTC kernel
> support? Or, something in between?
> 

Nobody is actually using the return value.

> - Does MC146818 support this feature?
> 

This feature is implemented in the RTC core so it is supported by all
RTCs that have alarms.

Internally, the value is an unsigned long and it is casted properly by
put_user in rtc_dev_read:

https://elixir.bootlin.com/linux/v5.4/source/drivers/rtc/dev.c#L178

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
