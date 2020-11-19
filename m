Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B289D2B9147
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Nov 2020 12:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgKSLmJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Nov 2020 06:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726848AbgKSLmH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Nov 2020 06:42:07 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9EBC0613D4
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:05 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id s13so6449778wmh.4
        for <linux-rtc@vger.kernel.org>; Thu, 19 Nov 2020 03:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9afXHpsFFFMReLazXHFDNvpQ/jmHRwRiVTZeBNQpt5Q=;
        b=H40DW6cEelRGoBSsiZknYzcwNDsVlpYHbxdMsX+Yn2ruel3GTp4Poq5Z/zoXz5b5C8
         t+6T+JZ4ytGYaQkNLTgkMNf4A6h9SEvTDBaIb7D2L3hlWEaOgt6I2SmlqL9FMIHJ2J1N
         UsJlgj8IlxTLDYuT3kJTJ3axeL3eWWbJ2/HU5/ladX0K03b/TSB6LrACScNL5lKFFzBh
         pL9fykkuPfFEJ4KVmeBhL7duzEBYw2GNuTXH62XcdlH0FotSjdjjQYYXPFizC8FEO+Ka
         fErV/a+sG6D3Pi5DbnTb4z1HwEAUGRuVBpByKL0KTGUWQKUTQWj7rs9e51P3nBba/xC8
         XmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9afXHpsFFFMReLazXHFDNvpQ/jmHRwRiVTZeBNQpt5Q=;
        b=oFSDmXmcbylJdm/NuZqxTwvrePl5T/AG52QMjRejBMjICS7C4YgHkcmjejIF2oqzkw
         yEZx1uoihLX6dB596w16R2xG7jWCHpygAeHCjy4bEt+0luQjNUz1Epku1WC2S+Sgl3im
         P0+Th9KVdBPMuCT/yhL/bh4mt7TbFlzy9inAtklpXFDMoWPp2QK0zIdP9qMuzI8KQhef
         PgXV/G58l6efxYC+RTpdTsBEiZyjHhNQmuWaTZ0A0vH9y/zJRWfGxQKYQAE8y58acy/A
         E4kf6fIluxaZr6fgEeU4d8Ipen4b81R87HBWuAmeXnLRrDGhOe3WR/JNVTuUWb+2K6L/
         31xw==
X-Gm-Message-State: AOAM533vlIN6ob6OeS6c/XM2cydcUpXdqds3/mqHooT9ALiFdWPomNto
        rL8Hh1tnReKL9iT8RBiYKxQjFw==
X-Google-Smtp-Source: ABdhPJzXbuvJTNv+tpsiZ0oMG10VMg1DHDQC9XSL5LcpvqyMgxhxO32YLGqIFmdLq9a60dLM2b/Xkw==
X-Received: by 2002:a05:600c:2c50:: with SMTP id r16mr3950098wmg.153.1605786124526;
        Thu, 19 Nov 2020 03:42:04 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-190-206.w2-15.abo.wanadoo.fr. [2.15.39.206])
        by smtp.gmail.com with ESMTPSA id u23sm9745178wmc.32.2020.11.19.03.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:42:03 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 00/59] rtc: remove all uses of devm_rtc_device_register()
Date:   Thu, 19 Nov 2020 12:40:50 +0100
Message-Id: <20201119114149.4117-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

So we now have two functions whose names are easy to confuse. I spent some
time and simply converted all RTC drivers to using the preferred interface.

Obviously these have only been compile-tested. I hope I didn't broke too
many drivers in the process. Most of the conversions was easy, sometime
it required removing unnecessary goto labels. There's also one patch
using a different devres helpers in here.

Bartosz Golaszewski (59):
  rtc: da9055: stop using deprecated RTC API
  rtc: m41t94: stop using deprecated RTC API
  rtc: ds1390: stop using deprecated RTC API
  rtc: ds3232: stop using deprecated RTC API
  rtc: rx6110: stop using deprecated RTC API
  rtc: palmas: stop using deprecated RTC API
  rtc: bq32k: stop using deprecated RTC API
  rtc: m48t35: stop using deprecated RTC API
  rtc: pcf50633: stop using deprecated RTC API
  rtc: pcf8583: stop using deprecated RTC API
  rtc: efi: stop using deprecated RTC API
  rtc: pcf8523: stop using deprecated RTC API
  rtc: stm32: stop using deprecated RTC API
  rtc: max8925: stop using deprecated RTC API
  rtc: max8907: stop using deprecated RTC API
  rtc: pxa: stop using deprecated RTC API
  rtc: hym8563: stop using deprecated RTC API
  rtc: max6916: stop using deprecated RTC API
  rtc: max8998: stop using deprecated RTC API
  rtc: s5m: use devm_i2c_new_dummy_device()
  rtc: s5m: stop using deprecated RTC API
  rtc: moxart: stop using deprecated RTC API
  rtc: hid: stop using deprecated RTC API
  rtc: generic: stop using deprecated RTC API
  rtc: lpc24xx: stop using deprecated RTC API
  rtc: spear: stop using deprecated RTC API
  rtc: max77686: stop using deprecated RTC API
  rtc: ds1286: stop using deprecated RTC API
  rtc: twl: stop using deprecated RTC API
  rtc: s3c: stop using deprecated RTC API
  rtc: mcp795: stop using deprecated RTC API
  rtc: x1205: stop using deprecated RTC API
  rtc: max6902: stop using deprecated RTC API
  rtc: max6900: stop using deprecated RTC API
  rtc: rx8025: stop using deprecated RTC API
  rtc: asm9260: stop using deprecated RTC API
  rtc: opal: stop using deprecated RTC API
  rtc: rc5t583: stop using deprecated RTC API
  rtc: wm8350: stop using deprecated RTC API
  rtc: r7301: stop using deprecated RTC API
  rtc: max8997: stop using deprecated RTC API
  rtc: isl12022: stop using deprecated RTC API
  rtc: tps80031: stop using deprecated RTC API
  rtc: rs5c372: stop using deprecated RTC API
  rtc: mt7622: stop using deprecated RTC API
  rtc: ds1302: stop using deprecated RTC API
  rtc: bq4802: stop using deprecated RTC API
  rtc: rs5c313: stop using deprecated RTC API
  rtc: em3027: stop using deprecated RTC API
  rtc: v3020: stop using deprecated RTC API
  rtc: ds1216: stop using deprecated RTC API
  rtc: rx4581: stop using deprecated RTC API
  rtc: m41t93: stop using deprecated RTC API
  rtc: fm3130: stop using deprecated RTC API
  rtc: rtd119x: stop using deprecated RTC API
  rtc: msm6242: stop using deprecated RTC API
  rtc: as3722: stop using deprecated RTC API
  rtc: lp8788: stop using deprecated RTC API
  rtc: remove devm_rtc_device_register()

 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/rtc/class.c                           | 36 -------------
 drivers/rtc/rtc-as3722.c                      | 14 +++---
 drivers/rtc/rtc-asm9260.c                     | 10 ++--
 drivers/rtc/rtc-bq32k.c                       |  8 +--
 drivers/rtc/rtc-bq4802.c                      | 30 +++++------
 drivers/rtc/rtc-da9055.c                      | 19 +++----
 drivers/rtc/rtc-ds1216.c                      |  8 +--
 drivers/rtc/rtc-ds1286.c                      | 15 +++---
 drivers/rtc/rtc-ds1302.c                      | 14 +++---
 drivers/rtc/rtc-ds1390.c                      | 13 +++--
 drivers/rtc/rtc-ds3232.c                      |  7 +--
 drivers/rtc/rtc-efi.c                         |  6 +--
 drivers/rtc/rtc-em3027.c                      |  6 +--
 drivers/rtc/rtc-fm3130.c                      | 22 +++-----
 drivers/rtc/rtc-generic.c                     |  6 +--
 drivers/rtc/rtc-hid-sensor-time.c             | 21 ++++----
 drivers/rtc/rtc-hym8563.c                     |  6 +--
 drivers/rtc/rtc-isl12022.c                    | 11 ++--
 drivers/rtc/rtc-lp8788.c                      | 11 ++--
 drivers/rtc/rtc-lpc24xx.c                     | 10 ++--
 drivers/rtc/rtc-m41t93.c                      |  6 +--
 drivers/rtc/rtc-m41t94.c                      |  8 +--
 drivers/rtc/rtc-m48t35.c                      | 10 ++--
 drivers/rtc/rtc-max6900.c                     |  6 +--
 drivers/rtc/rtc-max6902.c                     |  7 +--
 drivers/rtc/rtc-max6916.c                     |  6 +--
 drivers/rtc/rtc-max77686.c                    | 13 ++---
 drivers/rtc/rtc-max8907.c                     | 14 +++---
 drivers/rtc/rtc-max8925.c                     | 14 +++---
 drivers/rtc/rtc-max8997.c                     | 21 ++++----
 drivers/rtc/rtc-max8998.c                     | 13 ++---
 drivers/rtc/rtc-mcp795.c                      |  7 +--
 drivers/rtc/rtc-moxart.c                      | 12 ++---
 drivers/rtc/rtc-msm6242.c                     |  7 +--
 drivers/rtc/rtc-mt7622.c                      | 10 ++--
 drivers/rtc/rtc-opal.c                        |  6 +--
 drivers/rtc/rtc-palmas.c                      | 15 +++---
 drivers/rtc/rtc-pcf50633.c                    |  8 +--
 drivers/rtc/rtc-pcf8523.c                     |  7 +--
 drivers/rtc/rtc-pcf8583.c                     | 10 ++--
 drivers/rtc/rtc-pxa.c                         | 13 ++---
 drivers/rtc/rtc-r7301.c                       |  7 +--
 drivers/rtc/rtc-rc5t583.c                     | 14 +++---
 drivers/rtc/rtc-rs5c313.c                     |  9 ++--
 drivers/rtc/rtc-rs5c372.c                     | 36 +++++--------
 drivers/rtc/rtc-rtd119x.c                     | 13 +++--
 drivers/rtc/rtc-rx4581.c                      |  7 +--
 drivers/rtc/rtc-rx6110.c                      | 12 ++---
 drivers/rtc/rtc-rx8025.c                      | 11 ++--
 drivers/rtc/rtc-s3c.c                         | 10 ++--
 drivers/rtc/rtc-s5m.c                         | 50 ++++++++-----------
 drivers/rtc/rtc-spear.c                       | 10 ++--
 drivers/rtc/rtc-stm32.c                       | 18 ++++---
 drivers/rtc/rtc-tps80031.c                    | 15 +++---
 drivers/rtc/rtc-twl.c                         | 12 ++---
 drivers/rtc/rtc-v3020.c                       |  9 +++-
 drivers/rtc/rtc-wm8350.c                      | 14 +++---
 drivers/rtc/rtc-x1205.c                       |  7 ++-
 include/linux/rtc.h                           |  4 --
 60 files changed, 346 insertions(+), 399 deletions(-)

-- 
2.29.1

