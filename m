Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6956011F4A0
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfLNWK2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:10:28 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:39499 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfLNWK2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:10:28 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 41FBA1BF204;
        Sat, 14 Dec 2019 22:10:26 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 00/16] rtc: rv3029: cleanup and features
Date:   Sat, 14 Dec 2019 23:10:06 +0100
Message-Id: <20191214221022.622482-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

This series cleans up the rv3029 driver and adds a few features:
RTC_VL_READ and RTC_VL_CLR support, correct rtc range enforcement, NVRAM
support.

This series depends on the previously sent RTC_VL_READ unification.

Alexandre Belloni (16):
  rtc: rv3029: use proper name for the driver
  rtc: rv3029: let regmap validate the register ranges
  rtc: rv3029: remove open coded regmap_update_bits
  rtc: rv3029: remove race condition when update STATUS
  rtc: rv3029: avoid reading the status register uselessly
  rtc: rv3029: get rid of rv3029_get_sr
  rtc: rv3029: simplify rv3029_alarm_irq_enable
  rtc: rv3029: simplify rv3029_set_alarm
  rtc: rv3029: drop rv3029_read_regs and rv3029_write_regs
  rtc: rv3029: add RTC_VL_READ and RTC_VL_CLEAR support
  rtc: rv3029: correctly handle PON and VLOW2
  rtc: rv3029: convert to devm_rtc_allocate_device
  rtc: rv3029: let the core handle rtc range
  rtc: rv3029: remove useless error messages
  rtc: rv3029: annotate init and exit functions
  rtc: rv3029: add nvram support

 drivers/rtc/rtc-rv3029c2.c | 444 +++++++++++++++----------------------
 include/linux/rtc.h        |   1 +
 2 files changed, 185 insertions(+), 260 deletions(-)

-- 
2.23.0

