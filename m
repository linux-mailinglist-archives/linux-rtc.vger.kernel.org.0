Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C372940B86F
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Sep 2021 21:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhINT7I (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Sep 2021 15:59:08 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:33917 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232983AbhINT7I (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Sep 2021 15:59:08 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9F8D31C0006;
        Tue, 14 Sep 2021 19:57:48 +0000 (UTC)
Date:   Tue, 14 Sep 2021 21:57:47 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Romain Perier <romain.perier@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 0/3] Add RTC for MStar SoCs
Message-ID: <YUD+uw5Nc4hHEC5X@piout.net>
References: <20210823171613.18941-1-romain.perier@gmail.com>
 <CABgxDoJYL-3BDb4p8c85k9j1hB5Bp5s_iWHE8V6MiiG1iB4dmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgxDoJYL-3BDb4p8c85k9j1hB5Bp5s_iWHE8V6MiiG1iB4dmQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14/09/2021 19:20:56+0200, Romain Perier wrote:
> Hi,
> 
> ping,
> 

Well, this was sent to close from the merge window and the merge window
just closed :)

> Regards,
> Romain
> 
> Le lun. 23 août 2021 à 19:16, Romain Perier <romain.perier@gmail.com> a écrit :
> >
> > This patches series adds a new driver for the RTC found in the Mstar
> > MSC313e SoCs and newer. It adds a basic rtc driver, the corresponding
> > devicetree bindings and its documentation.
> >
> > The rtctest (from selftests) has been passed on this driver, with the
> > following output:
> > $ rtctest
> > TAP version 13
> > 1..7
> > # Starting 7 tests from 2 test cases.
> > #  RUN           rtc.date_read ...
> > # rtctest.c:47:date_read:Current RTC date/time is 01/01/1970 00:02:03.
> > #            OK  rtc.date_read
> > ok 1 rtc.date_read
> > #  RUN           rtc.uie_read ...
> > #            OK  rtc.uie_read
> > ok 2 rtc.uie_read
> > #  RUN           rtc.uie_select ...
> > #            OK  rtc.uie_select
> > ok 3 rtc.uie_select
> > #  RUN           rtc.alarm_alm_set ...
> > # rtctest.c:136:alarm_alm_set:Alarm time now set to 00:02:12.
> > # rtctest.c:156:alarm_alm_set:data: 1a0
> > #            OK  rtc.alarm_alm_set
> > ok 4 rtc.alarm_alm_set
> > #  RUN           rtc.alarm_wkalm_set ...
> > # rtctest.c:192:alarm_wkalm_set:Alarm time now set to 01/01/1970 00:02:15.
> > #            OK  rtc.alarm_wkalm_set
> > ok 5 rtc.alarm_wkalm_set
> > #  RUN           rtc.alarm_alm_set_minute ...
> > # rtctest.c:238:alarm_alm_set_minute:Alarm time now set to 00:03:00.
> > # rtctest.c:258:alarm_alm_set_minute:data: 1a0
> > #            OK  rtc.alarm_alm_set_minute
> > ok 6 [  180.545015] random: fast init done
> > rtc.alarm_alm_set_minute
> > #  RUN           rtc.alarm_wkalm_set_minute ...
> > # rtctest.c:294:alarm_wkalm_set_minute:Alarm time now set to 01/01/1970 00:04:00.
> > #            OK  rtc.alarm_wkalm_set_minute
> > ok 7 rtc.alarm_wkalm_set_minute
> > # PASSED: 7 / 7 tests passed.
> > # Totals: pass:7 fail:0 xfail:0 xpass:0 skip:0 error:0
> >
> > Changes since v3:
> > - Fixed bad device table in MODULE_DEVICE_TABLE()
> > - Use reverse christmas tree ordering for local variables in the probe()
> >   function
> > - Removed the "clk" field from the msc313_rtc data structure (not
> >   required, only used in the probe function)
> >
> > Changes since v2:
> > - Added dual-license header to the dt-bindings documentation
> > - Reordered dts entries, so the rtc device_node is before the watchdog
> >   device_node (because it has a lower address)
> > - Updated rtc range_max to U32_MAX
> > - Leave range_min to 0 (default value when it is not set at all)
> > - Fixed the CNT_EN_BIT logic, so .read_time will only read the time when
> >   the RTC has been previously set and has a valid state (which is not
> >   the case after a POR).
> >
> > Changes since v1:
> > - Fixed the DT bindings documentation and fixed dt_binding_check (an
> >   include was missing)
> > - Added || COMPILE_TEST to kconfig
> > - Removed rtc_valid_tm from msc313_rtc_read_time()
> > - Removed the last write of the msc313_rtc_set_time() function (not
> >   required) and improved comments
> > - Replaced the relaxed io by normal io in msc313_rtc_interrupt()
> > - Added checks to be sure that the alarm fired in msc313_rtc_interrupt()
> > - Removed msc313_rtc_remove() (replaced by devm_add_action_or_reset)
> > - Removed unnecessary software reset of the IP in the probe function
> >   (the soft reset is never executed, it is a mistake from the initial
> >   refactoring)
> > - Switched to devm_rtc_allocate_device() and devm_rtc_register_device(),
> >   and dropped the error message related to the rtc device allocation
> > - Added an RTC range by setting .range_min and .range_max
> > - Added the "start-year" property to the DT bindings documentation
> >
> > Daniel Palmer (1):
> >   rtc: Add support for the MSTAR MSC313 RTC
> >
> > Romain Perier (2):
> >   dt-bindings: rtc: Add Mstar MSC313e RTC devicetree bindings
> >     documentation
> >   ARM: dts: mstar: Add rtc device node
> >
> >  .../bindings/rtc/mstar,msc313-rtc.yaml        |  49 ++++
> >  MAINTAINERS                                   |   1 +
> >  arch/arm/boot/dts/mstar-v7.dtsi               |   8 +
> >  drivers/rtc/Kconfig                           |  10 +
> >  drivers/rtc/Makefile                          |   1 +
> >  drivers/rtc/rtc-msc313.c                      | 258 ++++++++++++++++++
> >  6 files changed, 327 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
> >  create mode 100644 drivers/rtc/rtc-msc313.c
> >
> > --
> > 2.30.2
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
