Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33FA2FD473
	for <lists+linux-rtc@lfdr.de>; Wed, 20 Jan 2021 16:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732705AbhATPqm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 20 Jan 2021 10:46:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:57650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732938AbhATPmq (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 20 Jan 2021 10:42:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10A7923340;
        Wed, 20 Jan 2021 15:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611157326;
        bh=R+f2k33Ve4mtYV6K2w2v0ZOi7yvOmesEWrbcedPaC5U=;
        h=From:To:Cc:Subject:Date:From;
        b=f4AsjHiTwy3W83PizpxFWA/PUS2dd3RvbVtridcuCIDuXWRw2S7Iqtf4twbGpAHQc
         FLC740/PiOk4z9Vrr5hsUqXTl4d0HoCJzdUsXG5MaRmF544I9lJIMQNgDHiOl29Ntx
         vE+a0SQp8OPqxbJFYTGLewl5wJrxwAebYt0Wi0qqDYrCgJyQQQBIfzrkFsplp2pI/C
         pa5UuIH0KKCpHkH0Z+B/XtjQuxhrg2n6NAEh960wh7NYycoefzOfEZKC4jMhS9GXcf
         z8C9IxUUrZ3Bw1cmsT7OX+pKB3P4OP1tLww+7oJKP3pcmex2xmB2aduNR8g7XY1OSL
         T3WknjEN48ZQA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/3] rtc: remove obsolete drivers
Date:   Wed, 20 Jan 2021 16:41:55 +0100
Message-Id: <20210120154158.1860736-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A few Arm platforms are getting removed in v5.12, this removes
the corresponding rtc drivers.

Link: https://lore.kernel.org/linux-arm-kernel/20210120124812.2800027-1-arnd@kernel.org/T/


Arnd Bergmann (3):
  rtc: remove sirfsoc driver
  rtc: remove ste coh901 driver
  rtc: remove ste ab3100 driver

 .../bindings/rtc/sirf,prima2-sysrtc.txt       |  13 -
 .../bindings/rtc/stericsson,coh901331.txt     |  16 -
 drivers/rtc/Kconfig                           |  27 --
 drivers/rtc/Makefile                          |   3 -
 drivers/rtc/rtc-ab3100.c                      | 254 ----------
 drivers/rtc/rtc-coh901331.c                   | 290 ------------
 drivers/rtc/rtc-sirfsoc.c                     | 446 ------------------
 include/linux/rtc/sirfsoc_rtciobrg.h          |  21 -
 8 files changed, 1070 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/stericsson,coh901331.txt
 delete mode 100644 drivers/rtc/rtc-ab3100.c
 delete mode 100644 drivers/rtc/rtc-coh901331.c
 delete mode 100644 drivers/rtc/rtc-sirfsoc.c
 delete mode 100644 include/linux/rtc/sirfsoc_rtciobrg.h

-- 
2.29.2

