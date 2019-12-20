Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90DEB127B03
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Dec 2019 13:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbfLTMY4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 20 Dec 2019 07:24:56 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:48358 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727347AbfLTMY4 (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 20 Dec 2019 07:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Message-Id:Date:Subject:Cc:To:From:Sender:
        Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RBosA1WXv7+ZQ+18j+VhmhTjKGR8E8xllD/Rd9oJey4=; b=Tk2mRZKAgHCqxHXhZkJZCaXkcz
        ziDMUULEv7GANWvFA+/U0sKpZscZo/do24A4Pg4/5KH64P9F78UefievcccXdBj7+1VGNHClW4MJH
        sQ8WBEu8GuWD8jbx+pvJ5dSFsJRXwj3nz+iPQwVArFVRU+VN/V3EgD/ointGEBkabTOM=;
Received: from [2a02:790:ff:1019:7ee9:d3ff:fe1f:a246] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iiHKn-0001zJ-6K; Fri, 20 Dec 2019 13:24:45 +0100
Received: from andi by localhost with local (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iiHKj-0008TW-Ni; Fri, 20 Dec 2019 13:24:42 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, stefan@agner.ch, b.galvani@gmail.com,
        phh@phh.me, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v5 0/5] Add rtc support for rn5t618 mfd
Date:   Fri, 20 Dec 2019 13:24:11 +0100
Message-Id: <20191220122416.31881-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.11.0
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

In the variant RC5T619 the mfd has an RTC. This patchset adds
support for it. To do so it adds the missing register defines in 
rn5t618.h and general irq handling for that.
It seems that the irq definitions are the same except missing RTC
but due to missing ability to test that I do not add them here.

The rtc driver itself is based on 
https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6sll-clara/kernel.tar.bz2
but heavily reworked.

It was tested on the Kobo Clara HD.

For cleaning up there is a separate off-topic patch:
mfd: rn5t618: cleanup i2c_device_id

Changes in v5:
- static rn5t618_irq_init
- PLATFORM_DEVID_NONE
- added some Acked-Bys

Changes in v4:
- use macros for IRQ definitions
- merge rn5t618-core.c and rn5t618-irq.c

Changes in v3:
- alignment cleanup
- output cleanup, remove useless toggling of alarm flag in rtc probe
- updated bindings description, so patch 1/5 becomes 2/6 and so on

Changes in v2:
- no dead code in irq code
- various improvements and cleanups in rtc driver itself

Andreas Kemnade (5):
  dt-bindings: mfd: rn5t618: Document optional property interrupts
  mfd: rn5t618: add IRQ support
  mfd: rn5t618: add RTC related registers
  mfd: rn5t618: add more subdevices
  rtc: rc5t619: add ricoh rc5t619 RTC driver

 Documentation/devicetree/bindings/mfd/rn5t618.txt |   4 +
 drivers/mfd/Kconfig                               |   1 +
 drivers/mfd/rn5t618.c                             | 109 +++++-
 drivers/rtc/Kconfig                               |  10 +
 drivers/rtc/Makefile                              |   1 +
 drivers/rtc/rtc-rc5t619.c                         | 444 ++++++++++++++++++++++
 include/linux/mfd/rn5t618.h                       |  26 ++
 7 files changed, 593 insertions(+), 2 deletions(-)
 create mode 100644 drivers/rtc/rtc-rc5t619.c

-- 
2.11.0

