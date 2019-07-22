Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD294704BB
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2019 17:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729477AbfGVP63 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jul 2019 11:58:29 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39974 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728154AbfGVP63 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Jul 2019 11:58:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id r1so39977916wrl.7
        for <linux-rtc@vger.kernel.org>; Mon, 22 Jul 2019 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jeBc9QMBTIbPNcWr5JyxOr3G6seZ+H3AFkSIXXyaYuI=;
        b=lQWUtEkRe/2ygHKRMp/C/W4ZUMpL/CyTZzFYv0nTdlF3hjqUuPK6Z/z3w2GDd0YrWU
         LAZ6WSERvFOvI5ESYxlvyWipW2gD2gLXU75bSnk6XPk1RgMVhxSlvG9IQEtYDb6wgBAK
         DrRQkMlLjxJxmRMDqJoJzBANvGWXHvSkPpKuSH+uU+XsWRcjHxr+I2dLUjYOwR6iCcBk
         8f3WqCJbbb1oelacXg6f6RNq+Ko8KcRGsGsOtPHrbVkexT/dLzal31So7yLIJad007tu
         cEkWpYbDyYNW/aOmriDE+Hc8XpW98fU7yBERB/pWXeRugYbgpelNzfGJ331HKsRffUOz
         huIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jeBc9QMBTIbPNcWr5JyxOr3G6seZ+H3AFkSIXXyaYuI=;
        b=XX2KTGuT6NSpnLrQfv4TIuTp209YQ8NtjwVu2/Zm3aUkKHFg7aMPdNTdGB+ugt0NVq
         TbK7vhTYNz6s9GV9sLwwst2WvKXjW7UPiIap+qpnyqHM4pyz838yisvRLsP56SUEGxY2
         a3Dq1Y4cKhoeL4rAwiRXxKreyCcXZqfXPG0yq0l3evO/DY/rZxzdy2361E9B13dLWEwB
         4YL5sqhAre22WQ3YcRIbp5m9huT9zrJPg76UTBpFB8QRX1HNRbEM+HzafzRFkXzafftR
         qX0UuxzaSCqEI/ISkT49ojLI8q6jkvgefkhLDxlYvI/DFcDtit8YQ7DzVpia/aNKiuip
         ZqsQ==
X-Gm-Message-State: APjAAAWmIfap6ky3axGGrqiEdifaUnd6+tXH9ub+yMIRhBZGFDjivHMJ
        sp9NonCqSQHI4P5y1/McjhrdCaYQNWg=
X-Google-Smtp-Source: APXvYqxq0AI7sx9LvqqemGRJHZrydErO3ORS2Ty7e8bqeJWp2hSXJIEnwFtMJ8GpMD+ZYb/sbOD3rA==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr78201858wrw.304.1563811107236;
        Mon, 22 Jul 2019 08:58:27 -0700 (PDT)
Received: from localhost.localdomain (3e6b1cc1.rev.stofanet.dk. [62.107.28.193])
        by smtp.googlemail.com with ESMTPSA id 91sm84840716wrp.3.2019.07.22.08.58.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 08:58:26 -0700 (PDT)
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
To:     linux-rtc@vger.kernel.org
Cc:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        bruno.thomsen@gmail.com, bth@kamstrup.com,
        u.kleine-koenig@pengutronix.de
Subject: [PATCH 0/4] rtc: pcf2127: tamper timestamp and watchdog feature support
Date:   Mon, 22 Jul 2019 17:58:07 +0200
Message-Id: <20190722155811.11980-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Alexandre

This patch series adds support for 2 chip features; tamper
timestamp and watchdog. Including improvements and cleanup
of existing code.

Tamper timestamp sysfs interface should match ISL1208 and
RV3028 RTC drivers; /sys/class/rtc/rtcX/timestamp0.

Watchdog functionality can be enabled with a Kconfig option,
just like in DS1374 and M41T80 RTC drivers.

In the future we could consider making a generic optional
RTC device tree binding property to enable the watchdog
feature, ex. enable-watchdog.

Patches has been tested on a pcf2127 chip using 2MHz SPI
interface both as built-in and module including with and
without watchdog feature.

/Bruno

Bruno Thomsen (4):
  rtc: pcf2127: convert to devm_rtc_allocate_device
  rtc: pcf2127: cleanup register and bit defines
  rtc: pcf2127: add tamper detection support
  rtc: pcf2127: add watchdog feature support

 drivers/rtc/Kconfig       |  10 ++
 drivers/rtc/rtc-pcf2127.c | 360 +++++++++++++++++++++++++++++++++++---
 2 files changed, 341 insertions(+), 29 deletions(-)

-- 
2.21.0

