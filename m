Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 553A011F465
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 23:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfLNWDD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 17:03:03 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:34965 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfLNWDD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 17:03:03 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 4C502FF803;
        Sat, 14 Dec 2019 22:03:01 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 00/17] rtc: Unify RTC_VL_READ meaning
Date:   Sat, 14 Dec 2019 23:02:42 +0100
Message-Id: <20191214220259.621996-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

This series unifies the meaning of RTC_VL_READ by redefining it as a
bitfield and defining the values of the various bits. This doesn't break
compatibility with userspaceas long as the return value was used as a
boolean, which should be the case.

The series also ensures RTC_VL_CLR doesn't clear the information when it
is about the data being invalid so the following rtc reads will properly
fail.

Alexandre Belloni (17):
  rtc: define RTC_VL_READ values
  rtc: Document RTC_VL_READ and RTC_VL_CLR ioctls
  rtc: abx80x: return meaningful value for RTC_VL_READ
  rtc: pcf2127: return meaningful value for RTC_VL_READ
  rtc: pcf8523: return meaningful value for RTC_VL_READ
  rtc: pcf8563: remove RTC_VL_CLR handling
  rtc: pcf8563: remove conditional compilation
  rtc: pcf8563: stop caching voltage_low
  rtc: pcf8563: return meaningful value for RTC_VL_READ
  rtc: pcf85063: remove RTC_VL_CLR handling
  rtc: pcf85063: return meaningful value for RTC_VL_READ
  rtc: rv3028: remove RTC_VL_CLR handling
  rtc: rv3028: return meaningful value for RTC_VL_READ
  rtc: rv8803: avoid clearing RV8803_FLAG_V2F in RTC_VL_CLR
  rtc: rv8803: return meaningful value for RTC_VL_READ
  rtc: rx8010: remove RTC_VL_CLR handling
  rtc: rx8010: return meaningful value for RTC_VL_READ

 Documentation/ABI/testing/rtc-cdev |  8 +++++++
 drivers/rtc/rtc-abx80x.c           |  7 ++----
 drivers/rtc/rtc-pcf2127.c          |  6 ++---
 drivers/rtc/rtc-pcf85063.c         | 16 ++-----------
 drivers/rtc/rtc-pcf8523.c          |  6 ++---
 drivers/rtc/rtc-pcf8563.c          | 36 ++++++------------------------
 drivers/rtc/rtc-rv3028.c           | 17 ++------------
 drivers/rtc/rtc-rv8803.c           | 16 ++++++-------
 drivers/rtc/rtc-rx8010.c           | 23 +++----------------
 include/uapi/linux/rtc.h           |  7 +++++-
 10 files changed, 42 insertions(+), 100 deletions(-)

-- 
2.23.0

