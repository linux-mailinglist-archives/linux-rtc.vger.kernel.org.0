Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 913DF4B2EC6
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Feb 2022 21:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244161AbiBKUuq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Feb 2022 15:50:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244388AbiBKUuq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Feb 2022 15:50:46 -0500
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E740CFA;
        Fri, 11 Feb 2022 12:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
        ; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
        :From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date
        :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
        References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
        List-Owner:List-Archive; bh=lpJ4MA+dtr6H4ii799kYmqLrukxPa2paDrP6IBW/K0s=; b=y
        N29W/j+gcimxShZH7AdmAVdUwCoFpRwUNKRc9fYQVCaZdvhXeMGYyQ4vNL4IViW0dShbqL7NempA8
        4b1Cl6gsrOApW3a/asNGI0j22ePIouL/ThdZh0wgU+T+oTPWgh3zrFnOJAl170Dh2kGSiWs7v42Pg
        yIdzpQNgWFkc2bo8=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:55280 helo=pettiford.lan)
        by mail.hugovil.com with esmtpa (Exim 4.92)
        (envelope-from <hugo@hugovil.com>)
        id 1nIcsK-00067w-2T; Fri, 11 Feb 2022 15:50:41 -0500
From:   Hugo Villeneuve <hugo@hugovil.com>
To:     hvilleneuve@dimonoff.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com
Cc:     hugo@hugovil.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 11 Feb 2022 15:50:15 -0500
Message-Id: <20220211205029.3940756-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
Subject: [PATCH v2 00/14] rtc: pcf2127: add PCF2131 driver
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hello,
this patch series adds the driver for the PCF2131 real-time clock.

This RTC is very similar in functionality to the PCF2127/29 with the
following differences:
  -supports two new control registers at offsets 4 and 5
  -supports a new reset register
  -supports 4 tamper detection functions instead of 1
  -has no nvmem (like the PCF2129)
  -has two output interrupt pins instead of one
  -has 1/100th seconds capabilities (not supported in this driver)
  -pcf2127 has watchdog clock sources: 1/60,   1, 64 and 4096Hz
   pcf2131 has watchdog clock sources: 1/64, 1/4,  4 and   64Hz
  -watchdog value register cannot be read after being set

Most of the register addresses are very different, although they still
follow the same layout. For example, the time/date and tamper registers
have a different base address, but the offsets are all the same.
Consequently, the source code of the PCF2127 driver can be easily adapted
to support this new device.

This patch series need the following patch to be applied first:
[PATCH] rtc: pcf2127: fix bug when reading alarm registers
Link: https://patchwork.ozlabs.org/project/rtc-linux/patch/20220208162908.3182581-1-hugo@hugovil.com/

Patches 1 to 6 modify the existing pcf2127 driver to make it more generic
and able to support multiple variants, like the PCF2131. This is done
mostly by using offsets instead of absolute hardcoded register addresses.

Patch 7 add actual support for the PCF2131.

Patch 8 configures all interrupt sources to go through the INT A pin.

Patch 9 changes the PWRMNG bits to be the same with the PCF2131 as they
      are with the PCF2127/29 (different default values).

Patch 10 allow to confirm PCF2131 device presence by reading the reset
      register fixed pattern.

Patch 11 adapt the time/date registers write sequence for PCF2131 (STOP and
      CPR bits).

Patch 12 add support for generic watchdog timing configuration.

Patch 13 add a new flag to identify if device has read support for reading
      watchdog register value.
      Since the watchdog value register cannot be read on the PCF2131 after
      being set, it seems that we cannot detect if watchdog timer was
      started by bootloader. I am not sure what is the best way to handle
      this situation, suggestions are welcomed.

Patch 14 add the dt-bindings for the PCF2131.

I have tested the driver using a PCF2131-ARD evaluation board connected to
an NXP imx8mp evaluation board:
  - Time get/set ok;
  - Alarms get/set ok
  - Timestamp 1 to 4 ok
  - IRQ alarm ok
  - Watchdog ok
  - Also tested successfully with "RTC Driver Test Example" from
    Documentation/rtc.txt

I have not tested the driver on PCF2127 or PCF2129 hardware as I do not
have either one of these devices. However, I compared the registers
read/write access addresses and values before and after modifying the
driver by simulating I2C read and writes for some operations (probe, read
time), and they are the same (apart from new read/writes for all variants).

Thank you.

Link: [v1] https://patchwork.ozlabs.org/project/rtc-linux/patch/20220125200009.900660-2-hugo@hugovil.com/

Changes for V2:
- Add cover letter (in V1, was mailed only to my email address, and not
  to RTC mailing list and maintainers)
- In general, fix and improvements after I have tested on real hardware
- Fix alarm interrupt A/B mask setting for PCF2131:
  PCF2131_BIT_INT_AIE must be cleared, not set, to enable interrupt.
- Remove low_reg validation: only check if TS interrupt flag is
  defined, as low_reg is defined at address 0 for PCF2127/29.
- Change PWRMNG value for PCF2131: default is different than PCF2127/29.
- Adapt time/date registers write sequence for PCF2131 (STOP and CPR bits).
- Map all interrupt sources to INT A pin
- Read and validate PCF2131 device presence from RESET register
- Adapt watchdog configuration for PCF2131

Hugo Villeneuve (14):
  rtc: pcf2127: add variant-specific configuration structure
  rtc: pcf2127: adapt for time/date registers at any offset
  rtc: pcf2127: adapt for alarm registers at any offset
  rtc: pcf2127: adapt for WD registers at any offset
  rtc: pcf2127: adapt for CLKOUT register at any offset
  rtc: pcf2127: add support for multiple TS functions
  rtc: pcf2127: add support for PCF2131 RTC
  rtc: pcf2127: add support for PCF2131 interrupts on output INT_A
  rtc: pcf2127: set PWRMNG value for PCF2131
  rtc: pcf2127: read and validate PCF2131 device signature
  rtc: pcf2127: adapt time/date registers write sequence for PCF2131
  rtc: pcf2127: support generic watchdog timing configuration
  rtc: pcf2127: add flag for watchdog register value read support
  dt-bindings: rtc: pcf2127: add PCF2131

 .../devicetree/bindings/rtc/nxp,pcf2127.yaml  |  19 +-
 drivers/rtc/Kconfig                           |   4 +-
 drivers/rtc/rtc-pcf2127.c                     | 940 ++++++++++++++----
 3 files changed, 769 insertions(+), 194 deletions(-)

-- 
2.30.2

