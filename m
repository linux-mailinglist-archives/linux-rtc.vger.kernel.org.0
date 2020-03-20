Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0797A18C8B3
	for <lists+linux-rtc@lfdr.de>; Fri, 20 Mar 2020 09:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgCTILc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 20 Mar 2020 04:11:32 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:51332 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726631AbgCTILa (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 20 Mar 2020 04:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/tNgPzPvBgCPfKKRPyvUe6Q7AEQzyG6kRTYOs3M9DUI=; b=OGigWW4lHLlo1FNdpuKgv7a9Sf
        5tPcRcz4mgKK9+Z8hPDypWqIOEEFxKXHH3WlFSZ6NT8cHEskwFIHdZQTF22EdRjYZmmtcMGOX6pF8
        VDLXUvUxTaLEpks+CfyKyRNBWgK8fd6Nb0+grAXTDiVJ0QLre90WkBhI84n0z2innsq4=;
Received: from p200300ccff093a00e2cec3fffe93fc31.dip0.t-ipconnect.de ([2003:cc:ff09:3a00:e2ce:c3ff:fe93:fc31] helo=eeepc)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1jFCkP-00058T-5a; Fri, 20 Mar 2020 09:11:18 +0100
Received: from andi by eeepc with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1jFCkG-00039E-60; Fri, 20 Mar 2020 09:11:08 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, stefan@agner.ch, b.galvani@gmail.com,
        phh@phh.me, letux-kernel@openphoenux.org, knaack.h@gmx.de,
        lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org,
        jic23@kernel.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v7 0/7] mfd: rn5t618: Add RTC/ADC support
Date:   Fri, 20 Mar 2020 09:10:58 +0100
Message-Id: <20200320081105.12026-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

In the variant RC5T619 the mfd has an RTC. This patchset adds
support for it. To do so it adds the missing register defines in 
rn5t618.h and general irq handling for that.
It seems that the IRQ definitions are the same except missing RTC
for the RN5T618 but due to missing ability to test that they are
not added here.
It also adds support for the ADC, it is available in both the
RN5T618 and RC5T619 but due to missing ability to test that,
the subdevice is only added for the RC5T619.

It was tested on the Kobo Clara HD.

Changes in v7:
- cleanup in IRQ init stuff

Changes in v6:
- put together with ADC series
- also added cleanup i2_device_id patch to avoid merge
  conflicts

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


Andreas Kemnade (7):
  dt-bindings: mfd: rn5t618: Document optional property interrupts
  mfd: rn5t618: add IRQ support
  mfd: rn5t618: add RTC related registers
  mfd: rn5t618: add more subdevices
  rtc: rc5t619: add Ricoh RC5T619 RTC driver
  iio: adc: rn5t618: Add ADC driver for RN5T618/RC5T619
  mfd: rn5t618: cleanup i2c_device_id

 .../devicetree/bindings/mfd/rn5t618.txt       |   4 +
 drivers/iio/adc/Kconfig                       |  10 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/rn5t618-adc.c                 | 256 ++++++++++
 drivers/mfd/Kconfig                           |   1 +
 drivers/mfd/rn5t618.c                         | 109 ++++-
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-rc5t619.c                     | 444 ++++++++++++++++++
 include/linux/mfd/rn5t618.h                   |  26 +
 10 files changed, 851 insertions(+), 11 deletions(-)
 create mode 100644 drivers/iio/adc/rn5t618-adc.c
 create mode 100644 drivers/rtc/rtc-rc5t619.c

-- 
2.20.1

