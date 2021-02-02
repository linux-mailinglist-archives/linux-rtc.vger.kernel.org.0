Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE8B30BD2C
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 12:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhBBLcW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 06:32:22 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:56579 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhBBLXH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Feb 2021 06:23:07 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 352C36000B;
        Tue,  2 Feb 2021 11:22:23 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 00/21] rtc: remove make W=1 warnings
Date:   Tue,  2 Feb 2021 12:21:57 +0100
Message-Id: <20210202112219.3610853-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

This series removes some make W=1 warning, especially when CONFIG_OF is
not defined.

Alexandre Belloni (21):
  rtc: class: remove bogus documentation
  rtc: armada38x: depend on OF
  rtc: bq32k: quiet maybe-unused variable warning
  rtc: brcmstb-waketimer: quiet maybe-unused variable warning
  rtc: digicolor: quiet maybe-unused variable warning
  rtc: ds1672: quiet maybe-unused variable warning
  rtc: ds3232: quiet maybe-unused variable warning
  rtc: isl1208: quiet maybe-unused variable warning
  rtc: m41t80: quiet maybe-unused variable warning
  rtc: meson: quiet maybe-unused variable warning
  rtc: pcf85063: quiet maybe-unused variable warnings
  rtc: pcf85363: quiet maybe-unused variable warning
  rtc: rs5c372: quiet maybe-unused variable warning
  rtc: rv3028: quiet maybe-unused variable warning
  rtc: rv3029: quiet maybe-unused variable warning
  rtc: rv3032: quiet maybe-unused variable warning
  rtc: rv8803: quiet maybe-unused variable warning
  rtc: rx8010: quiet maybe-unused variable warning
  rtc: rx8581: quiet maybe-unused variable warning
  rtc: s35390a: quiet maybe-unused variable warning
  rtc: sd3078: quiet maybe-unused variable warning

 drivers/rtc/Kconfig                 |  1 +
 drivers/rtc/class.c                 |  5 ----
 drivers/rtc/rtc-bq32k.c             |  2 +-
 drivers/rtc/rtc-brcmstb-waketimer.c |  2 +-
 drivers/rtc/rtc-digicolor.c         |  2 +-
 drivers/rtc/rtc-ds1672.c            |  2 +-
 drivers/rtc/rtc-ds3232.c            |  2 +-
 drivers/rtc/rtc-isl1208.c           |  2 +-
 drivers/rtc/rtc-m41t80.c            |  2 +-
 drivers/rtc/rtc-meson.c             |  2 +-
 drivers/rtc/rtc-pcf85063.c          | 38 ++++++++++++++---------------
 drivers/rtc/rtc-pcf85363.c          |  2 +-
 drivers/rtc/rtc-rs5c372.c           |  2 +-
 drivers/rtc/rtc-rv3028.c            |  2 +-
 drivers/rtc/rtc-rv3029c2.c          |  2 +-
 drivers/rtc/rtc-rv3032.c            |  2 +-
 drivers/rtc/rtc-rv8803.c            |  2 +-
 drivers/rtc/rtc-rx8010.c            |  2 +-
 drivers/rtc/rtc-rx8581.c            |  2 +-
 drivers/rtc/rtc-s35390a.c           |  2 +-
 drivers/rtc/rtc-sd3078.c            |  2 +-
 21 files changed, 38 insertions(+), 42 deletions(-)

-- 
2.29.2

