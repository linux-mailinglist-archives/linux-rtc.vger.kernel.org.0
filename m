Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68C688BD39
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Aug 2019 17:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfHMPgS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Aug 2019 11:36:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43378 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfHMPgR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Aug 2019 11:36:17 -0400
Received: by mail-wr1-f66.google.com with SMTP id y8so2229677wrn.10;
        Tue, 13 Aug 2019 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3UC+PD9kS/WGfZDXc4tichks2oQOuR9t5uPbZ3jfIak=;
        b=jCOEiAkcGH7yXnW/f/cx/ETAQRKf6Q/oI11zhi7T6r23lwK2Y6zj1SORMcnN72LhU2
         hp428fqezeEyRMNPYGKdHdsXsI9UZh0+dlhGnYY7Ez4IC993qIUF6ochX7ti86JX28oA
         9PHCGuxRhtaEklJeLMa/0y8i1B6akEtIjDE88MpsveLvnFD1NwW5/Kpw6J7iYGdyML1k
         6ZcQAb4pzZwRwtC1aeNX2ErYUn9fLil4C1UaAZqZTbuKVURvXfJSqjSa+vgk0IFqgT3+
         UluFqa9Xjh6pwRAoOAFA6HtEIPunSC2cuByaMN/XoINKBWuilAkpXX8GySzYv1mMpoPM
         uRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3UC+PD9kS/WGfZDXc4tichks2oQOuR9t5uPbZ3jfIak=;
        b=IW4q/ikISrjbRNElzY+WuOpIgkeYS7hFO8tsu/JiwfhnPGN5siUW1DAiLPub1ReBnh
         pjA7i9L9f1XhtwlSdzq9nsy+hE3SNKm/2pShuPvewabxTLojsFsYjEGiEYZNsed7qR6X
         u3hSNtzEYih/6d0vPl8LXRKgPusHxu3Cfa0v1Wov/kW0LZWiVobhugd8MP0gGml03VnG
         8CBWH6feam3g8GhLRnUISHi5FQUvdduuoObrMZYaXWhJqDpHfsz53rSZZcYNKjH3MTI6
         65eb/krZJwIFsLRZmNm+ohqYxZyLSk9Axfai5oy7Uly/nQV93Hnle6NdD1/uYBAVHAX1
         s7jg==
X-Gm-Message-State: APjAAAW74xdwfpCiEO6Zpb6r/TEDJYhr71KT7bPSI4HgDLyrURgHRm/R
        jwwwof9NKUTm0x7TXsBdGNBo8Fo1zQttoA==
X-Google-Smtp-Source: APXvYqycOfkIw9uh+myOAYBLFRuRcU/GKKQEhlFpr9aqIiTMosEHmh6x3DDmIpWbgZwFKGFgyGKvLA==
X-Received: by 2002:adf:ed85:: with SMTP id c5mr17071499wro.268.1565710575205;
        Tue, 13 Aug 2019 08:36:15 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id j16sm64744819wrp.62.2019.08.13.08.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2019 08:36:14 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        wim@linux-watchdog.org, linux@roeck-us.net,
        u.kleine-koenig@pengutronix.de, sean.nyekjaer@prevas.dk,
        bth@kamstrup.com, bruno.thomsen@gmail.com
Subject: [PATCH v2 0/5] rtc: pcf2127: tamper timestamp and watchdog feature support
Date:   Tue, 13 Aug 2019 17:35:55 +0200
Message-Id: <20190813153600.12406-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi all

This patch series still adds support for 2 chip features; tamper timestamp
and watchdog. Including code cleanup which improves code readability of the
device driver and better aligned with kernel coding style. There is also a
bugfix of pcf2127_rtc_read_time() which causes accidental watchdog disabling,
which was not included in v1.

All review comments from v1 have been handled.
The series now adds watchdog feature before tamper as the later needs to call
pcf2127_wdt_active_ping() as workaround for CTRL2 watchdog issue.

I have also tested if reading the other watchdog control register called WD_CTL
results in disabling of the watchdog feature, but that is luckily not the case.

Test script[1] for tamper function can be used to test the feature and verify
that the pcb circuit is working without issues during EMC immunity tests.

 Starting tamper detection (dev: rtc0, irq: rtc-tamper-irq)!
 event: FALLING EDGE offset: 12 timestamp: [1565695589.907980206]
 Tamper! Tue Aug 13 11:26:31 UTC 2019 (1565695591)
 event: FALLING EDGE offset: 12 timestamp: [1565695595.759132013]
 Tamper! Tue Aug 13 11:26:36 UTC 2019 (1565695596)


Watchdog driver has been tested with systemd version 242 and the following
/etc/systemd/system.conf parameters:

 RuntimeWatchdogSec=30
 ShutdownWatchdogSec=4min


Bug in pcf2127_rtc_read_time() can be reproduced with the following code:

	unsigned char test[10];

	ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL,
			  (unsigned int *)(test));
	dev_info(dev, "%s: before, wd_val=%02x\n",
		 __func__, test[0]);

 /* "regmap_read/regmap_bulk_read()" */

	ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL,
			  (unsigned int *)(test));
	dev_info(dev, "%s: after, wd_val=%02x\n",
		 __func__, test[0]);

Which output something like this when using hwclock -r -f /dev/rtc0 in dmesg:

 [ 1407.334031] rtc-pcf2127-spi spi1.0: pcf2127_rtc_read_time: before, wd_val=12
 [ 1407.342521] rtc-pcf2127-spi spi1.0: pcf2127_rtc_read_time: after, wd_val=00
 [ 2104.383726] rtc-pcf2127-spi spi1.0: pcf2127_rtc_read_time: before, wd_val=17
 [ 2104.392212] rtc-pcf2127-spi spi1.0: pcf2127_rtc_read_time: after, wd_val=00
 [ 2800.393418] rtc-pcf2127-spi spi1.0: pcf2127_rtc_read_time: before, wd_val=14
 [ 2800.401950] rtc-pcf2127-spi spi1.0: pcf2127_rtc_read_time: after, wd_val=00

After bugfix patch:

 [  125.095718] rtc-pcf2127-spi spi1.0: pcf2127_rtc_read_time: before, wd_val=16
 [  125.104010] rtc-pcf2127-spi spi1.0: pcf2127_rtc_read_time: after, wd_val=16
 [  128.415844] rtc-pcf2127-spi spi1.0: pcf2127_rtc_read_time: before, wd_val=13
 [  128.424134] rtc-pcf2127-spi spi1.0: pcf2127_rtc_read_time: after, wd_val=13


I also have a battery switch-over mode patch, but I will send it later as
it might need configuration based on hardware design.

/Bruno

[1] https://github.com/baxeno/linux-emc-test/blob/master/tamper/tamper.sh

Bruno Thomsen (5):
  rtc: pcf2127: convert to devm_rtc_allocate_device
  rtc: pcf2127: cleanup register and bit defines
  rtc: pcf2127: bugfix: read rtc disables watchdog
  rtc: pcf2127: add watchdog feature support
  rtc: pcf2127: add tamper detection support

 drivers/rtc/Kconfig       |   7 +-
 drivers/rtc/rtc-pcf2127.c | 387 +++++++++++++++++++++++++++++++++-----
 2 files changed, 343 insertions(+), 51 deletions(-)

-- 
2.21.0

