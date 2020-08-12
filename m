Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643D724309A
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Aug 2020 23:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgHLVg6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 Aug 2020 17:36:58 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57795 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbgHLVg5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 Aug 2020 17:36:57 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E597120007;
        Wed, 12 Aug 2020 21:36:55 +0000 (UTC)
Date:   Wed, 12 Aug 2020 23:36:55 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 5.9
Message-ID: <20200812213655.GA81005@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Linus,

I'm sorry for the very late pull request. There is not much this cycle
anyway, mostly non urgent fixes.

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.9

for you to fetch changes up to 27006416be16b7887fb94b3b445f32453defb3f1:

  rtc: pcf2127: fix alarm handling (2020-08-12 11:48:29 +0200)

----------------------------------------------------------------
RTC for 5.9

Drivers:
 - ds1374: use watchdog core
 - pcf2127: add alarm and pcf2129 support

----------------------------------------------------------------
Alexander A. Klimov (1):
      rtc: Replace HTTP links with HTTPS ones

Alexandre Belloni (3):
      rtc: ds1374: fix RTC_DRV_DS1374_WDT dependencies
      rtc: ds1374: remove unused define
      rtc: pcf2127: fix alarm handling

Chris Packham (1):
      rtc: ds1307: provide an indication that the watchdog has fired

Huacai Chen (1):
      rtc: goldfish: Enable interrupt in set_alarm() when necessary

Johnson CH Chen (陳昭勳) (1):
      rtc: ds1374: wdt: Use watchdog core for watchdog part

Jon Hunter (1):
      rtc: max77686: Fix wake-ups for max77620

Krzysztof Kozlowski (1):
      rtc: max77686: Do not allow interrupt to fire before system resume

Liam Beguin (2):
      rtc: pcf2127: add pca2129 device id
      rtc: pcf2127: add alarm support

Misono Tomohiro (1):
      rtc: cleanup obsolete comment about struct rtc_class_ops

Sebastian Reichel (1):
      rtc: cpcap: fix range

Sudeep Holla (1):
      rtc: pl031: fix set_alarm by adding back call to alarm_irq_enable

Tales L. da Aparecida (1):
      rtc: imxdi: fix trivial typos

 .../devicetree/bindings/rtc/trivial-rtc.yaml       |   2 +
 drivers/rtc/Kconfig                                |   3 +-
 drivers/rtc/rtc-ab-b5ze-s3.c                       |   2 +-
 drivers/rtc/rtc-bq32k.c                            |   2 +-
 drivers/rtc/rtc-cpcap.c                            |   2 +-
 drivers/rtc/rtc-ds1307.c                           |   6 +
 drivers/rtc/rtc-ds1374.c                           | 262 +++++----------------
 drivers/rtc/rtc-goldfish.c                         |   1 +
 drivers/rtc/rtc-imxdi.c                            |   4 +-
 drivers/rtc/rtc-max77686.c                         |  23 +-
 drivers/rtc/rtc-mcp795.c                           |   2 +-
 drivers/rtc/rtc-pcf2127.c                          | 144 ++++++++++-
 drivers/rtc/rtc-pcf85063.c                         |   4 +-
 drivers/rtc/rtc-pl031.c                            |   1 +
 include/linux/rtc.h                                |   4 -
 15 files changed, 244 insertions(+), 218 deletions(-)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
