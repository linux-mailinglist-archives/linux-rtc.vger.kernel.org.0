Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57CF31A4868
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2020 18:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgDJQ1f (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Apr 2020 12:27:35 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:22244 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgDJQ1f (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Apr 2020 12:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586536055; x=1618072055;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=zr0Ggw5HD1A8LRe/mt3YAqOJsFRxxBVnqpuZVViM2tY=;
  b=OPMwW4b3c555JJuC07SgRX/fv3X0Xce+LVwi1SYpMHRYyxrQmg+pozCT
   lanHwNhUSDLLRQYoi1/Q9UEmeQ0uvYxwVDF/AHCD0H3jErLam3mXSWeC1
   PjHQQ9mOt9ZVJEV0PkCoMbj6SNqe/Sp4cKMVGwXhBk7AmHxIrZQUub5M6
   dWH5SCwQldyMpjoNLYQkA04j3GCkwE8nt/Aj7VvQgJy1qnxWlwrYCjCvI
   AvsR4RWZimKpFIbiVAUjYNOvWo7AOFE8HR2mOtbv3P80nMWcfTSj33LvG
   OwGPhOUk/kj5Q7UVdvKVqtrBZhAMDdpuGD7kyayhptY6JXjFfh44M9egs
   w==;
IronPort-SDR: dcQHvo1Tp+DwO8ph7m4XMUxGX8s3fRDJf307Wju2OXU0I8VAGZ+0cPP5Br/thD7Xa9DYAIEwnu
 CqAV2L3cOcdKzmmVsPYk7FA4QMUL1QzL9PX18cSv35NtmjosZH2LioRQGuKSc3/Z2kAnvNHBs4
 Y2YypEBUytMFVZZ7J4brZOcj0uoS/Dxnqlm/F7031oukA/IUqrbFJ0UGd8QhTHf80IEkXaHR+g
 Hd/loSkz16ZVl0dj60XKaOjvOxqps1aReqmc8MNxB7SGeWJ7AyZmQyywL0NrhY0efEfkFgED8l
 LiU=
X-IronPort-AV: E=Sophos;i="5.72,367,1580799600"; 
   d="scan'208";a="8791173"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Apr 2020 09:27:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 10 Apr 2020 09:27:38 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 10 Apr 2020 09:27:18 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <nicolas.ferre@microchip.com>, <ludovic.desroches@microchip.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>, <maz@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 0/5] add RTT support for SAM9X60
Date:   Fri, 10 Apr 2020 19:26:54 +0300
Message-ID: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This series adds RTT support for SAM9X60.

Claudiu Beznea (5):
  irqchip/atmel-aic5: add support for sam9x60 rtt fixup
  rtc: at91sam9: enable driver for sam9x60
  ARM: dts: sam9x60ek: enable gpbr
  ARM: dts: sam9x60: add rtt
  rtc: at91sam9: add microchip,sam9x60-rtt

 .../devicetree/bindings/rtc/atmel,at91sam9-rtc.txt |  2 +-
 arch/arm/boot/dts/at91-sam9x60ek.dts               |  9 ++++++
 arch/arm/boot/dts/sam9x60.dtsi                     |  7 +++++
 drivers/irqchip/irq-atmel-aic-common.c             | 36 +++++++++++++---------
 drivers/irqchip/irq-atmel-aic5.c                   |  8 ++++-
 drivers/rtc/rtc-at91sam9.c                         |  1 +
 6 files changed, 47 insertions(+), 16 deletions(-)

-- 
2.7.4

