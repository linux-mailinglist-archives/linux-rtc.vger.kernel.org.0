Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A472A10DAD9
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2019 22:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfK2VVM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Nov 2019 16:21:12 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:51714 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727073AbfK2VVM (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 29 Nov 2019 16:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=XwKYSe7gQcC1oU2kW2+rZ3DsikC1ppVrWIQm++k4A3k=; b=RJ7hXQMAhDnWk1UYyZdxdEIZNU
        eJrnAJVwJzFccWe0WqBhOoEWO+/2mqvu1qWfaqw2trU/6ysvrt1MgojB3CrvHo1KXpkqv/dt1Z8W+
        /5pvLylhvCXyDfGby3ePBMV/l0RBTEuNyfPZ+kYZSm473rVKzVFnZb2TuX2fHrN896DA=;
Received: from p200300ccff0871001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff08:7100:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ianhE-0001xZ-6S; Fri, 29 Nov 2019 22:21:00 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1ianhD-0004mP-Of; Fri, 29 Nov 2019 22:20:59 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, stefan@agner.ch, b.galvani@gmail.com,
        phh@phh.me, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/6] Add rtc support for rn5t618 mfd
Date:   Fri, 29 Nov 2019 22:20:39 +0100
Message-Id: <20191129212045.18325-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

In the variant rc5t619 the mfd has a rtc. This patchset adds
support for it. To do so it adds the missing register defines in 
rn5t618.h and general irq handling for that.
Probably the irq definitions are the same except missing rtc + charger
but due to missing information about that I do not add them.
There might be some oddity about the charger irq which should be 
researched when adding the charger subdevice.

The rtc driver itself is based on 
https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6sll-clara/kernel.tar.bz2
but heavily reworked.

It was tested on the Kobo Clara HD.

Changes in v3:
- alignment cleanup
- output cleanup, remove useless toggling of alarm flag in rtc probe
- updated bindings description, so patch 1/5 becomes 2/6 and so on

Changes in v2:
- no dead code in irq code
- various improvements and cleanups in rtc driver itself

Andreas Kemnade (6):
  dt-bindings: mfd: rn5t618: Document optional property interrupts
  mfd: rn5t618: prepare for irq handling
  mfd: rn5t618: add irq support
  mfd: rn5t618: add rtc related registers
  mfd: rn5t618: add more subdevices
  rtc: rtc-rc5t619: add ricoh rc5t619 RTC driver

 .../devicetree/bindings/mfd/rn5t618.txt       |   3 +
 drivers/mfd/Kconfig                           |   1 +
 drivers/mfd/Makefile                          |   2 +
 drivers/mfd/{rn5t618.c => rn5t618-core.c}     |  52 +-
 drivers/mfd/rn5t618-irq.c                     |  85 ++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-rc5t619.c                     | 462 ++++++++++++++++++
 include/linux/mfd/rn5t618.h                   |  27 +
 9 files changed, 640 insertions(+), 3 deletions(-)
 rename drivers/mfd/{rn5t618.c => rn5t618-core.c} (78%)
 create mode 100644 drivers/mfd/rn5t618-irq.c
 create mode 100644 drivers/rtc/rtc-rc5t619.c

-- 
2.20.1

