Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF05B1A4871
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2020 18:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgDJQ1n (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 Apr 2020 12:27:43 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:22267 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgDJQ1m (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 Apr 2020 12:27:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1586536062; x=1618072062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=4fUL9yUbl3HkQSaoUyLLEtE2zx2uKNsuNY5LbHGoncU=;
  b=PmcTyZYpzuKlwNB+qPnThLeKD797Cg4/DzRBl0iGI7kcFtwCUsvXRnTP
   DCPQL8z8o0CyRNDAAlAYz+QvDu5Ir04dv8phHkp8LWZIqsEPny2AGqQFC
   d9kQSbEjtQY0uOpp3zIi4Y3hLkbrt/Zg5ppxjSFG128HMIXS6hH3K9gca
   jlx7iL2bwkTJZb6IA4sUvxFP5b2WNnIr8aEYT2N7YnC9RKpeOcIao+ZnP
   00dKOAR0elsYaHq9Au5RaEdS/XbScZAlamR/ehPc2mf0g888dNjZEw3vH
   anpFDWmB1yYSx26JM937OpFceOTTW3MGJnzC3536094tU++7siS9KBk/O
   g==;
IronPort-SDR: yU0rYU+Y7AXIRsg31MF3hdZXUtjt2xaU54vxF1Bwmor9o4+uRWryQ+YRSioAzLcYlRzCG2RTsi
 W+bv6aP05q8GbkytoyjOyFWQDPq1bNZyvhzw8VJ0Mos6O8hpK9Se8R3zvTyX6fQZgfKRCgsxCZ
 6c0f5tEc9XE/X/pmTxQ5VDud96jyZBw/2OhhVBLXWk4asGNpDQtbkgytJJ0Ff9OIhopcdUL5GU
 h/wAi5+aM3X4XMPCS+/pcGvhiWPALXIZCiLV/i3+ldH8aIhWM4yJvjjlx1jjRoMB00yS4o2nhZ
 JJI=
X-IronPort-AV: E=Sophos;i="5.72,367,1580799600"; 
   d="scan'208";a="8791236"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Apr 2020 09:27:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 10 Apr 2020 09:27:53 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 10 Apr 2020 09:27:32 -0700
From:   Claudiu Beznea <claudiu.beznea@microchip.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <nicolas.ferre@microchip.com>, <ludovic.desroches@microchip.com>,
        <tglx@linutronix.de>, <jason@lakedaemon.net>, <maz@kernel.org>
CC:     <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 3/5] ARM: dts: sam9x60ek: enable gpbr
Date:   Fri, 10 Apr 2020 19:26:57 +0300
Message-ID: <1586536019-12348-4-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Enable gpbr.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/at91-sam9x60ek.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
index 9f30132d7d7b..ab3d2d9a420a 100644
--- a/arch/arm/boot/dts/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
@@ -309,6 +309,10 @@
 	};
 };
 
+&gpbr {
+	status = "okay";
+};
+
 &i2s {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2s_default>;
-- 
2.7.4

