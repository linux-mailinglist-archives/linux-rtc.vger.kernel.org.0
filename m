Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E48B819183B
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Mar 2020 18:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgCXRx6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 24 Mar 2020 13:53:58 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:43062 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbgCXRx6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 24 Mar 2020 13:53:58 -0400
X-Greylist: delayed 540 seconds by postgrey-1.27 at vger.kernel.org; Tue, 24 Mar 2020 13:53:56 EDT
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 7FE358030776;
        Tue, 24 Mar 2020 17:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 882jLCueSa2y; Tue, 24 Mar 2020 20:44:48 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paul.burton@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/6] clocksource: Fix MIPS GIC and DW APB Timer for Baikal-T1 SoC support
Date:   Tue, 24 Mar 2020 20:43:19 +0300
Message-ID: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200306125622.839ED80307C4@mail.baikalelectronics.ru>
References: <20200306125622.839ED80307C4@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Serge Semin <fancer.lancer@gmail.com>

As for all Baikal-T1 SoC related patchsets, which need this, we replaced
the DW APB Timer legacy plain text-based dt-binding file with DT schema.
Similarly the MIPS GIC bindings file is also converted to DT schema seeing
it also defines the MIPS GIC Timer binding.

Aside from MIPS-specific r4k timer Baikal-T1 chip also provides a
functionality of two another timers: embedded into the MIPS GIC timer and
three external DW timers available over APB bus. But we can't use them
before the corresponding drivers are properly fixed. First of all DW APB
Timer shouldn't be bound to a single CPU, since as being accessible over
APB they are external with respect to all possible CPUs. Secondly there
might be more than just two DW APB Timers in the system (Baikal-T1 has
three of them), so permit the driver to use one of them as a clocksource
and the rest - for clockevents. Thirdly it's possible to use MIPS GIC
timer as a clocksource so register it in the corresponding subsystem
(the patch has been found in the Paul Burton MIPS repo so I left the
original Signed-off-by attribute). Finally in the same way as r4k timer
the MIPS GIC timer should be used with care when CPUFREQ config is enabled
since in case of CM2 the timer counting depends on the CPU reference clock
frequency while the clocksource subsystem currently doesn't support the
timers with non-stable clock.

This patchset is rebased and tested on the mainline Linux kernel 5.6-rc4:
commit 98d54f81e36b ("Linux 5.6-rc4").

Changelog v2:
- Fix the SoB tags.
- Our corporate email server doesn't change Message-Id anymore, so the
  patchset is resubmitted being in the cover-letter-threaded format.
- Convert the "snps,dw-apb-timer" binding to DT schema in a dedicated
  patch.
- Convert the "mti,gic" binding to DT schema in a dedicated patch.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Paul Burton (1):
  clocksource: mips-gic-timer: Register as sched_clock

Serge Semin (5):
  dt-bindings: rtc: Convert snps,dw-apb-timer to DT schema
  dt-bindings: interrupt-controller: Convert mti,gic to DT schema
  clocksource: dw_apb_timer: Set clockevent any-possible-CPU mask
  clocksource: dw_apb_timer_of: Fix missing clockevent timers
  clocksource: mips-gic-timer: Set limitations on
    clocksource/sched-clocks usage

 .../interrupt-controller/mips-gic.txt         |  67 --------
 .../interrupt-controller/mti,gic.yaml         | 152 ++++++++++++++++++
 .../devicetree/bindings/rtc/dw-apb.txt        |  32 ----
 .../bindings/rtc/snps,dw-apb-timer.yaml       |  88 ++++++++++
 drivers/clocksource/dw_apb_timer.c            |  18 +--
 drivers/clocksource/dw_apb_timer_of.c         |   9 +-
 drivers/clocksource/mips-gic-timer.c          |  30 +++-
 include/linux/dw_apb_timer.h                  |   2 +-
 8 files changed, 276 insertions(+), 122 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mti,gic.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/dw-apb.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml

-- 
2.25.1

