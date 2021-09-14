Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A9240B5CA
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Sep 2021 19:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhINRW0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Sep 2021 13:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhINRW0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Sep 2021 13:22:26 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E36FC061762;
        Tue, 14 Sep 2021 10:21:09 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id l9so12663156vsb.8;
        Tue, 14 Sep 2021 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+mDwE36Zke+PiuA7+VNvUx8z4xBQRfTwxEpfcAzi3rU=;
        b=mrb8Qjm+1VcJe3mP+wkmzWB2z+qoxKqSsGPQxKd7KwUkv6Tp7mHCjRxjSV//wypnit
         WYKTwZ93H8OhVF7IBiYOPq9t/jWRYJRyIXN/cJJoN+iIWR6azSf4Ocof017npFGHdAQO
         D2LTs5k66k0hbO8m1DO65kYBVxRab4RY1gOixIxNgcnmCTzfWadlI6nse8vEyE8ccQc9
         tblQ4RHyQ/Ay+s1CGyw2VeI1J61IA+RVFWQKgHMOHGnMwNvfdygb5VHezZFKMtbTtoCt
         Md3vXGadGo4tPGK1NFsXRf6TF4uPu1PJ7+/FRBS43fRqV981L9hCkkq75M9b3tfG4BM2
         uLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+mDwE36Zke+PiuA7+VNvUx8z4xBQRfTwxEpfcAzi3rU=;
        b=kxGqW6gpANCMiWODXAAM4+ODIggZEP65ARLCnbSA+hLbPCicj7eWpapexu8NPnipvW
         WF1V5uEx/70sSCYJegGBqIbU2zIfGaismqz1YG27oYUhQkxLLz6zAUUBoq0IPLErf2Up
         rQqP3weFMYvp5dl1s6bCVT1wBN4cLEk8n8Ask/WICe329DXDULsyZTfJ2BipAMN4yXoU
         Sz9cNaY4ZI9OLKVLkyYMl4BXzevKuICGNV/Go2K1Yy/vBKUBN/aBDerYY+bTp8lypjJ6
         GTTCbgCTCeuUJTPDzxcqFkqt7vWsn/16wn4U/yfP3OdETkSHKVD7fowhS1otvEU8dMsL
         xOdw==
X-Gm-Message-State: AOAM532Zsdn8wkDUkMHtcyIltXI8R/9yFgmQrsG+gY3Vnq5tt0TTqf/n
        xjEcKumh+ypfxbU+Oi7NMqvS221SK0l/L8eJLf0=
X-Google-Smtp-Source: ABdhPJzZxkoTBgrfJLrIIluP+RRyNCxyBKVDDsn0YXtVl/FUgzI4fLB8giL87QUL8PNg8ZHag8xYOAGvZkxFBSdS2Jk=
X-Received: by 2002:a05:6102:22eb:: with SMTP id b11mr356913vsh.36.1631640068127;
 Tue, 14 Sep 2021 10:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210823171613.18941-1-romain.perier@gmail.com>
In-Reply-To: <20210823171613.18941-1-romain.perier@gmail.com>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Tue, 14 Sep 2021 19:20:56 +0200
Message-ID: <CABgxDoJYL-3BDb4p8c85k9j1hB5Bp5s_iWHE8V6MiiG1iB4dmQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add RTC for MStar SoCs
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

ping,

Regards,
Romain

Le lun. 23 ao=C3=BBt 2021 =C3=A0 19:16, Romain Perier <romain.perier@gmail.=
com> a =C3=A9crit :
>
> This patches series adds a new driver for the RTC found in the Mstar
> MSC313e SoCs and newer. It adds a basic rtc driver, the corresponding
> devicetree bindings and its documentation.
>
> The rtctest (from selftests) has been passed on this driver, with the
> following output:
> $ rtctest
> TAP version 13
> 1..7
> # Starting 7 tests from 2 test cases.
> #  RUN           rtc.date_read ...
> # rtctest.c:47:date_read:Current RTC date/time is 01/01/1970 00:02:03.
> #            OK  rtc.date_read
> ok 1 rtc.date_read
> #  RUN           rtc.uie_read ...
> #            OK  rtc.uie_read
> ok 2 rtc.uie_read
> #  RUN           rtc.uie_select ...
> #            OK  rtc.uie_select
> ok 3 rtc.uie_select
> #  RUN           rtc.alarm_alm_set ...
> # rtctest.c:136:alarm_alm_set:Alarm time now set to 00:02:12.
> # rtctest.c:156:alarm_alm_set:data: 1a0
> #            OK  rtc.alarm_alm_set
> ok 4 rtc.alarm_alm_set
> #  RUN           rtc.alarm_wkalm_set ...
> # rtctest.c:192:alarm_wkalm_set:Alarm time now set to 01/01/1970 00:02:15=
.
> #            OK  rtc.alarm_wkalm_set
> ok 5 rtc.alarm_wkalm_set
> #  RUN           rtc.alarm_alm_set_minute ...
> # rtctest.c:238:alarm_alm_set_minute:Alarm time now set to 00:03:00.
> # rtctest.c:258:alarm_alm_set_minute:data: 1a0
> #            OK  rtc.alarm_alm_set_minute
> ok 6 [  180.545015] random: fast init done
> rtc.alarm_alm_set_minute
> #  RUN           rtc.alarm_wkalm_set_minute ...
> # rtctest.c:294:alarm_wkalm_set_minute:Alarm time now set to 01/01/1970 0=
0:04:00.
> #            OK  rtc.alarm_wkalm_set_minute
> ok 7 rtc.alarm_wkalm_set_minute
> # PASSED: 7 / 7 tests passed.
> # Totals: pass:7 fail:0 xfail:0 xpass:0 skip:0 error:0
>
> Changes since v3:
> - Fixed bad device table in MODULE_DEVICE_TABLE()
> - Use reverse christmas tree ordering for local variables in the probe()
>   function
> - Removed the "clk" field from the msc313_rtc data structure (not
>   required, only used in the probe function)
>
> Changes since v2:
> - Added dual-license header to the dt-bindings documentation
> - Reordered dts entries, so the rtc device_node is before the watchdog
>   device_node (because it has a lower address)
> - Updated rtc range_max to U32_MAX
> - Leave range_min to 0 (default value when it is not set at all)
> - Fixed the CNT_EN_BIT logic, so .read_time will only read the time when
>   the RTC has been previously set and has a valid state (which is not
>   the case after a POR).
>
> Changes since v1:
> - Fixed the DT bindings documentation and fixed dt_binding_check (an
>   include was missing)
> - Added || COMPILE_TEST to kconfig
> - Removed rtc_valid_tm from msc313_rtc_read_time()
> - Removed the last write of the msc313_rtc_set_time() function (not
>   required) and improved comments
> - Replaced the relaxed io by normal io in msc313_rtc_interrupt()
> - Added checks to be sure that the alarm fired in msc313_rtc_interrupt()
> - Removed msc313_rtc_remove() (replaced by devm_add_action_or_reset)
> - Removed unnecessary software reset of the IP in the probe function
>   (the soft reset is never executed, it is a mistake from the initial
>   refactoring)
> - Switched to devm_rtc_allocate_device() and devm_rtc_register_device(),
>   and dropped the error message related to the rtc device allocation
> - Added an RTC range by setting .range_min and .range_max
> - Added the "start-year" property to the DT bindings documentation
>
> Daniel Palmer (1):
>   rtc: Add support for the MSTAR MSC313 RTC
>
> Romain Perier (2):
>   dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings
>     documentation
>   ARM: dts: mstar: Add rtc device node
>
>  .../bindings/rtc/mstar,msc313-rtc.yaml        |  49 ++++
>  MAINTAINERS                                   |   1 +
>  arch/arm/boot/dts/mstar-v7.dtsi               |   8 +
>  drivers/rtc/Kconfig                           |  10 +
>  drivers/rtc/Makefile                          |   1 +
>  drivers/rtc/rtc-msc313.c                      | 258 ++++++++++++++++++
>  6 files changed, 327 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-rt=
c.yaml
>  create mode 100644 drivers/rtc/rtc-msc313.c
>
> --
> 2.30.2
>
