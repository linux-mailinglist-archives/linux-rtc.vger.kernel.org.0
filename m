Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C7C40C47F
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Sep 2021 13:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237489AbhIOLqg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 Sep 2021 07:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237480AbhIOLqf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 15 Sep 2021 07:46:35 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05012C061574;
        Wed, 15 Sep 2021 04:45:17 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id f18so2452325vsp.2;
        Wed, 15 Sep 2021 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JPQ0lmcBAe8dYGkU0EvEYTJrUaS/zQBGvMHqnj9DCpE=;
        b=AfO7uONRJzTenWiiDMTlC3NCBOtOy5RoQbU3QkfWFjGbY2rEBOkwb9UnmXLq/DTymT
         zdb37kZ8f3QaBxy0DtSUydOGBmrqwMpsK/EuxzOYaspnuVDf/7Vt8JPpeWjmtLkRT1H8
         zz0zOEeruRMSAguWpXVD/k5cA356A4VKUhExtEYuAzGhRoSATssH7Hboav+mPDT9mN5n
         WiILOz35dCygaGpSJrkqaN+3NdUQsUWXfe40yMtbga5fNg9z2HRojplR17VP+UkmfqW9
         8U/LwAZPsLMArqs1HGp1SjJc7lOllc96ZZOXJTs1y1wMTO3kLyAQOqWPHGwVdhPyaaYK
         IqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JPQ0lmcBAe8dYGkU0EvEYTJrUaS/zQBGvMHqnj9DCpE=;
        b=Q2+Mo/4XFIVkh3GLhoyiQ98hxY3j4+g64VEX9bRBsVR9vymd7FNwPDln4SrhhTpsR9
         6xJimHOjbzx31LjRSCW52b8xxQcQWnfWJo71l2UuitMFfOuycvmhYb347uF73SVvAd40
         xi6MB3mgTVym4hvx+Bf6VKcKl/RZ2iLiRX4dWnrAl+VaMNmnis2ZdDV0v+rQpgUp92FN
         xyrSIQGWB/xByFZkxW12582gGTdabg0e+A1Po9iU6hn8SYYfZ40BLQlz+FFWmV4yHKsv
         xf2Q1yyNYKDkea8cHgDFzGTIomNyv8OL6sAZ2Ta2V7rpak0R4+C2pFuY/Ttkp7fazZfk
         BYKQ==
X-Gm-Message-State: AOAM533enO+nLGrs70fbkcJYJsGLQtpZC5NonxtykZIwP+DFR1u6Icti
        GWsozk+3K6twxD+Bw3+YJu59PEXjQgoPp6QwY2CifSRw
X-Google-Smtp-Source: ABdhPJwyzBKqC1C8lCUxcSIQpp0deHXrdLPc6RY5aUQRXRA4cYr5b/xSQCGlhITdJG02zJendeLPTnItrQbmtpSwCjU=
X-Received: by 2002:a67:ef85:: with SMTP id r5mr2853450vsp.32.1631706316088;
 Wed, 15 Sep 2021 04:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210823171613.18941-1-romain.perier@gmail.com>
 <CABgxDoJYL-3BDb4p8c85k9j1hB5Bp5s_iWHE8V6MiiG1iB4dmQ@mail.gmail.com> <YUD+uw5Nc4hHEC5X@piout.net>
In-Reply-To: <YUD+uw5Nc4hHEC5X@piout.net>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Wed, 15 Sep 2021 13:45:04 +0200
Message-ID: <CABgxDoKQSCJ=HQw0O22qyDQBOqhX63TgtVGpxFpfynG0cdbhZg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add RTC for MStar SoCs
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Le mar. 14 sept. 2021 =C3=A0 21:57, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> On 14/09/2021 19:20:56+0200, Romain Perier wrote:
> > Hi,
> >
> > ping,
> >
>
> Well, this was sent to close from the merge window and the merge window
> just closed :)

Ah right, I have forgotten that, my bad ^^.  Ignore my comment then

Romain

>
> > Regards,
> > Romain
> >
> > Le lun. 23 ao=C3=BBt 2021 =C3=A0 19:16, Romain Perier <romain.perier@gm=
ail.com> a =C3=A9crit :
> > >
> > > This patches series adds a new driver for the RTC found in the Mstar
> > > MSC313e SoCs and newer. It adds a basic rtc driver, the corresponding
> > > devicetree bindings and its documentation.
> > >
> > > The rtctest (from selftests) has been passed on this driver, with the
> > > following output:
> > > $ rtctest
> > > TAP version 13
> > > 1..7
> > > # Starting 7 tests from 2 test cases.
> > > #  RUN           rtc.date_read ...
> > > # rtctest.c:47:date_read:Current RTC date/time is 01/01/1970 00:02:03=
.
> > > #            OK  rtc.date_read
> > > ok 1 rtc.date_read
> > > #  RUN           rtc.uie_read ...
> > > #            OK  rtc.uie_read
> > > ok 2 rtc.uie_read
> > > #  RUN           rtc.uie_select ...
> > > #            OK  rtc.uie_select
> > > ok 3 rtc.uie_select
> > > #  RUN           rtc.alarm_alm_set ...
> > > # rtctest.c:136:alarm_alm_set:Alarm time now set to 00:02:12.
> > > # rtctest.c:156:alarm_alm_set:data: 1a0
> > > #            OK  rtc.alarm_alm_set
> > > ok 4 rtc.alarm_alm_set
> > > #  RUN           rtc.alarm_wkalm_set ...
> > > # rtctest.c:192:alarm_wkalm_set:Alarm time now set to 01/01/1970 00:0=
2:15.
> > > #            OK  rtc.alarm_wkalm_set
> > > ok 5 rtc.alarm_wkalm_set
> > > #  RUN           rtc.alarm_alm_set_minute ...
> > > # rtctest.c:238:alarm_alm_set_minute:Alarm time now set to 00:03:00.
> > > # rtctest.c:258:alarm_alm_set_minute:data: 1a0
> > > #            OK  rtc.alarm_alm_set_minute
> > > ok 6 [  180.545015] random: fast init done
> > > rtc.alarm_alm_set_minute
> > > #  RUN           rtc.alarm_wkalm_set_minute ...
> > > # rtctest.c:294:alarm_wkalm_set_minute:Alarm time now set to 01/01/19=
70 00:04:00.
> > > #            OK  rtc.alarm_wkalm_set_minute
> > > ok 7 rtc.alarm_wkalm_set_minute
> > > # PASSED: 7 / 7 tests passed.
> > > # Totals: pass:7 fail:0 xfail:0 xpass:0 skip:0 error:0
> > >
> > > Changes since v3:
> > > - Fixed bad device table in MODULE_DEVICE_TABLE()
> > > - Use reverse christmas tree ordering for local variables in the prob=
e()
> > >   function
> > > - Removed the "clk" field from the msc313_rtc data structure (not
> > >   required, only used in the probe function)
> > >
> > > Changes since v2:
> > > - Added dual-license header to the dt-bindings documentation
> > > - Reordered dts entries, so the rtc device_node is before the watchdo=
g
> > >   device_node (because it has a lower address)
> > > - Updated rtc range_max to U32_MAX
> > > - Leave range_min to 0 (default value when it is not set at all)
> > > - Fixed the CNT_EN_BIT logic, so .read_time will only read the time w=
hen
> > >   the RTC has been previously set and has a valid state (which is not
> > >   the case after a POR).
> > >
> > > Changes since v1:
> > > - Fixed the DT bindings documentation and fixed dt_binding_check (an
> > >   include was missing)
> > > - Added || COMPILE_TEST to kconfig
> > > - Removed rtc_valid_tm from msc313_rtc_read_time()
> > > - Removed the last write of the msc313_rtc_set_time() function (not
> > >   required) and improved comments
> > > - Replaced the relaxed io by normal io in msc313_rtc_interrupt()
> > > - Added checks to be sure that the alarm fired in msc313_rtc_interrup=
t()
> > > - Removed msc313_rtc_remove() (replaced by devm_add_action_or_reset)
> > > - Removed unnecessary software reset of the IP in the probe function
> > >   (the soft reset is never executed, it is a mistake from the initial
> > >   refactoring)
> > > - Switched to devm_rtc_allocate_device() and devm_rtc_register_device=
(),
> > >   and dropped the error message related to the rtc device allocation
> > > - Added an RTC range by setting .range_min and .range_max
> > > - Added the "start-year" property to the DT bindings documentation
> > >
> > > Daniel Palmer (1):
> > >   rtc: Add support for the MSTAR MSC313 RTC
> > >
> > > Romain Perier (2):
> > >   dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings
> > >     documentation
> > >   ARM: dts: mstar: Add rtc device node
> > >
> > >  .../bindings/rtc/mstar,msc313-rtc.yaml        |  49 ++++
> > >  MAINTAINERS                                   |   1 +
> > >  arch/arm/boot/dts/mstar-v7.dtsi               |   8 +
> > >  drivers/rtc/Kconfig                           |  10 +
> > >  drivers/rtc/Makefile                          |   1 +
> > >  drivers/rtc/rtc-msc313.c                      | 258 ++++++++++++++++=
++
> > >  6 files changed, 327 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc31=
3-rtc.yaml
> > >  create mode 100644 drivers/rtc/rtc-msc313.c
> > >
> > > --
> > > 2.30.2
> > >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
