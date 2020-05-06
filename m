Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD5C1C7CA4
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2020 23:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbgEFVle (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 6 May 2020 17:41:34 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33866 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729600AbgEFVle (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 6 May 2020 17:41:34 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9712E8030808;
        Wed,  6 May 2020 21:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id eEFPn27T9Bdr; Thu,  7 May 2020 00:41:29 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>, <linux-mips@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, <linux-rtc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/7] dt-bindings: timer: Move snps,dw-apb-timer DT schema from rtc
Date:   Thu, 7 May 2020 00:41:02 +0300
Message-ID: <20200506214107.25956-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
References: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This binding file doesn't belong to the rtc seeing it's a pure timer
with no rtc facilities like days/months/years counting and alarms.
So move the YAML-file to the Documentation/devicetree/bindings/timer/
directory.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org
---
 .../devicetree/bindings/{rtc => timer}/snps,dw-apb-timer.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{rtc => timer}/snps,dw-apb-timer.yaml (96%)

diff --git a/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
rename to Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
index 002fe1ee709b..5d300efdf0ca 100644
--- a/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/rtc/snps,dw-apb-timer.yaml#
+$id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Synopsys DesignWare APB Timer
-- 
2.25.1

