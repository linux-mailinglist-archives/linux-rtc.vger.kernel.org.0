Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBB2858FC
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Aug 2019 06:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfHHEYB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Aug 2019 00:24:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725270AbfHHEYA (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 8 Aug 2019 00:24:00 -0400
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net [71.197.186.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D658721743;
        Thu,  8 Aug 2019 04:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565238239;
        bh=N/wFSY2QeHiCGs1awO6e44rKQI8CrPBMon45BpRu5Ng=;
        h=From:To:Cc:Subject:Date:From;
        b=KWYMkZ7G1KYXOquJ3YGp1iDdc1CQ9VmEbtgJ1eWSGag6i3PPcXIruU5G+RF2TuVB0
         o6Lok9MTnhRFFxCezVybOJzFeFFENDH0F8vBdklRxZSlI3Qz8SGq4EQE1JHWU8htbw
         MuKTSVZgFCVMnymyqYTf6YwY5G+zY6c5iOPhtIq8=
From:   Kevin Hilman <khilman@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 0/2] rtc: add new Amlogic Virtual Wake RTC
Date:   Wed,  7 Aug 2019 21:23:55 -0700
Message-Id: <20190808042357.4663-1-khilman@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Kevin Hilman <khilman@baylibre.com>

Add a new driver for the virtual wake RTC on Amlogic SoCs.

The RTC is virtual from the Linux side because it's a hardware timer
managed by firmware on the secure co-processor (SCP.)  The interface
is 1 register where a wakeup time (in seconds) is written.  The SCP then
uses this value to program an always-on timer.

Changes since v1:
- add MAINTAINERS entry
- add nop ->alarm_irq_enable() (workaround for RTC core
  limitation pointed out by Alexandre Belloni)
- remove unused ->read_alarm()
- fix statics
- move resume to dev_pm_ops
- add suspend hook
- don't calculate (or write) the alarm timer value until suspend time

Changes since Neil's original version
- move from do_gettimeofday() to ktime_get()

Kevin Hilman (1): dt-bindings: rtc: new binding for Amlogic VRTC

Neil Armstrong (1):
  rtc: Add Amlogic Virtual Wake RTC

 .../bindings/rtc/rtc-meson-vrtc.txt           |  22 +++
 drivers/rtc/Kconfig                           |  11 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-meson-vrtc.c                  | 149 ++++++++++++++++++
 4 files changed, 183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
 create mode 100644 drivers/rtc/rtc-meson-vrtc.c

-- 
2.22.0

