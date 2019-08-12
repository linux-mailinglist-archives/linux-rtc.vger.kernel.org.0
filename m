Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAC988AB16
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Aug 2019 01:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfHLX2y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 19:28:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:59962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbfHLX2x (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 12 Aug 2019 19:28:53 -0400
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net [71.197.186.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA3F620665;
        Mon, 12 Aug 2019 23:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565652532;
        bh=ahoNLQPnX82nGz86Y7FW3a1cpXocBYRKZ1y2smEqp9A=;
        h=From:To:Cc:Subject:Date:From;
        b=SgRawVWOSYB+zs6GRhqN0CAZz+chFVi+ssW8Bfm5yd2twCRJEsMoVGuyJ3Z6aUSFU
         eJ+T6/YYkUkqs+sdXgx9YMhB4k4QkyMQHc44qM4jTCyAlK4bormafrCFgWhr2zhcxz
         Agqf5Ba9N/0iGYbhfQDN1m5mSeXM1yChtFD/51mM=
From:   Kevin Hilman <khilman@kernel.org>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] rtc: add new Amlogic Virtual Wake RTC
Date:   Mon, 12 Aug 2019 16:28:48 -0700
Message-Id: <20190812232850.8016-1-khilman@kernel.org>
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

Changes since v2:
- switch to devm_platform_ioremap_resource()
- switch to devm_rtc_allocate_device() and rtc_register_device()

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


Kevin Hilman (1):
  dt-bindings: rtc: new binding for Amlogic VRTC

Neil Armstrong (1):
  rtc: Add Amlogic Virtual Wake RTC

 .../bindings/rtc/rtc-meson-vrtc.txt           |  22 +++
 MAINTAINERS                                   |   1 +
 drivers/rtc/Kconfig                           |  11 ++
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-meson-vrtc.c                  | 156 ++++++++++++++++++
 5 files changed, 191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
 create mode 100644 drivers/rtc/rtc-meson-vrtc.c

-- 
2.22.0

