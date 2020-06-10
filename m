Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5D51F50C1
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jun 2020 11:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgFJJFo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jun 2020 05:05:44 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:10179 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgFJJFo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Jun 2020 05:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591779944; x=1623315944;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=8TnDDBGvjHsVFDp8wvSJgEncCN5mhl7gO30xVW7TOu8=;
  b=Tcv0NfsAui0jKW1TpwdgCViUwlcciHF6d/lnY0ovwQ96TV2IVjx1vRhF
   PScDwuh9JkhDYtJODt/1MEEgELeQP3OR19vtkl58JundLlZLmopwwyGnc
   0NVtcZBIRq30jrmTcP2OWYJM2pBB7hG1HzVUqMrVLKH3oAhkMchzb44LY
   mUjCYxE+oOGOnN0hkDbrVoLJjhxvWGuI2MLV4Oh0w7wMJNjYGJn0JQepA
   Detl+YAn06wPzc4wfi29F5fnDm3wsBJDorRovfl3nq6akrYNKbz/0qv0a
   SXo10m4N7oQK2TrTpvRnfLs5EMk2WWYewhHN7e5BhwjW9sPy7t/3NcCWW
   Q==;
IronPort-SDR: bEQtM5O08WY8XWPZjThcORefaYzLaYHRKlbGPIiYxkkzUQKbY97lKXCIRSplUE5/0eMClhaX+4
 gebC76JG9zjTxzY6MVCBE+rG6ab9+RSBtXlxmZ2q+rRWTB+hakfTGFaxDPhjr65p6eqAEv2Gtc
 gB5m/Ee1tbcJahx+vdeetPYiNCfzWHHpK+P6KqtxVINVhSM9PSJ1t4Il0iTEDCVHtZ3V3zNAlw
 hJkVn8F39xowDl2MV44dPrNschw5929QQSuNFCPLiKrn41E5mWZc4yMObr+4GpLhpXQMPztunf
 vWQ=
X-IronPort-AV: E=Sophos;i="5.73,495,1583218800"; 
   d="scan'208";a="82953209"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jun 2020 02:05:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 10 Jun 2020 02:05:43 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1847.3 via Frontend Transport; Wed, 10 Jun 2020 02:05:38 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <nicolas.ferre@microchip.com>,
        <ludovic.desroches@microchip.com>, <tglx@linutronix.de>,
        <jason@lakedaemon.net>, <maz@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 0/3] add RTT support for SAM9X60
Date:   Wed, 10 Jun 2020 12:05:33 +0300
Message-ID: <1591779936-18577-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This series adds RTT support for SAM9X60.

Changes in v2:
- use "atmel,at91sam9260-rtt" as fallback for compatible
- in patch 1 keep only the addition of sam9x60_aic_irq_fixup
- get rid of patches 2/5 from v1
- squash patches 4/5, 5/5 from v1
- change commit title for patch "rtc: at91sam9: add microchip,sam9x60-rtt"
  from v1 into "dt-bindings: rtc: add microchip,sam9x60-rtt" and
  place it before device tree patch

Claudiu Beznea (3):
  irqchip/atmel-aic5: add support for sam9x60 rtt fixup
  dt-bindings: rtc: add microchip,sam9x60-rtt
  ARM: dts: sam9x60: add rtt

 Documentation/devicetree/bindings/rtc/atmel,at91sam9-rtc.txt | 4 +++-
 arch/arm/boot/dts/at91-sam9x60ek.dts                         | 9 +++++++++
 arch/arm/boot/dts/sam9x60.dtsi                               | 7 +++++++
 drivers/irqchip/irq-atmel-aic5.c                             | 8 +++++++-
 4 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.7.4

