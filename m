Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 850A161FF09
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Nov 2022 21:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232679AbiKGUD4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Nov 2022 15:03:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbiKGUDk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Nov 2022 15:03:40 -0500
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl [79.96.170.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17816186E7;
        Mon,  7 Nov 2022 12:03:38 -0800 (PST)
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP (IdeaSmtpServer 5.0.0)
 id b18ae63cded67791; Mon, 7 Nov 2022 21:03:36 +0100
Received: from kreacher.localnet (unknown [213.134.188.205])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by v370.home.net.pl (Postfix) with ESMTPSA id BAD926682BE;
        Mon,  7 Nov 2022 21:03:35 +0100 (CET)
Authentication-Results: v370.home.net.pl; dmarc=none (p=none dis=none) header.from=rjwysocki.net
Authentication-Results: v370.home.net.pl; spf=fail smtp.mailfrom=rjwysocki.net
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/5] rtc: rtc-cmos: Call rtc_wake_setup() from cmos_do_probe()
Date:   Mon, 07 Nov 2022 21:00:03 +0100
Message-ID: <13152185.uLZWGnKmhe@kreacher>
In-Reply-To: <2276401.ElGaqSPkdT@kreacher>
References: <2276401.ElGaqSPkdT@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 213.134.188.205
X-CLIENT-HOSTNAME: 213.134.188.205
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgddufeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtufertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepvdffueeitdfgvddtudegueejtdffteetgeefkeffvdeftddttdeuhfegfedvjefhnecukfhppedvudefrddufeegrddukeekrddvtdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddufedrudefgedrudekkedrvddthedphhgvlhhopehkrhgvrggthhgvrhdrlhhotggrlhhnvghtpdhmrghilhhfrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqedpnhgspghrtghpthhtohepkedprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrtghpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
 lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhpmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhirdiihhgrnhhgsehinhhtvghlrdgtohhmpdhrtghpthhtoheprgdriihumhhmohesthhofigvrhhtvggthhdrihhtpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomh
X-DCC--Metrics: v370.home.net.pl 1024; Body=8 Fuz1=8 Fuz2=8
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

To reduce code duplication, move the invocation of rtc_wake_setup()
into cmos_do_probe() and simplify the callers of the latter.

No intentional functional impact.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/rtc/rtc-cmos.c |   28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

Index: linux-pm/drivers/rtc/rtc-cmos.c
===================================================================
--- linux-pm.orig/drivers/rtc/rtc-cmos.c
+++ linux-pm/drivers/rtc/rtc-cmos.c
@@ -744,6 +744,7 @@ static irqreturn_t cmos_interrupt(int ir
 		return IRQ_NONE;
 }
 
+static inline void rtc_wake_setup(struct device *dev);
 static void cmos_wake_setup(struct device *dev);
 
 #ifdef	CONFIG_PNP
@@ -938,6 +939,13 @@ cmos_do_probe(struct device *dev, struct
 	nvmem_cfg.size = address_space - NVRAM_OFFSET;
 	devm_rtc_nvmem_register(cmos_rtc.rtc, &nvmem_cfg);
 
+	/*
+	 * Everything has gone well so far, so by default register a handler for
+	 * the ACPI RTC fixed event.
+	 */
+	if (!info)
+		rtc_wake_setup(dev);
+
 	dev_info(dev, "%s%s, %d bytes nvram%s\n",
 		 !is_valid_irq(rtc_irq) ? "no alarms" :
 		 cmos_rtc.mon_alrm ? "alarms up to one year" :
@@ -1357,7 +1365,7 @@ static void rtc_wake_setup(struct device
 
 static int cmos_pnp_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 {
-	int irq, ret;
+	int irq;
 
 	if (pnp_port_start(pnp, 0) == 0x70 && !pnp_irq_valid(pnp, 0)) {
 		irq = 0;
@@ -1373,13 +1381,7 @@ static int cmos_pnp_probe(struct pnp_dev
 		irq = pnp_irq(pnp, 0);
 	}
 
-	ret = cmos_do_probe(&pnp->dev, pnp_get_resource(pnp, IORESOURCE_IO, 0), irq);
-	if (ret)
-		return ret;
-
-	rtc_wake_setup(&pnp->dev);
-
-	return 0;
+	return cmos_do_probe(&pnp->dev, pnp_get_resource(pnp, IORESOURCE_IO, 0), irq);
 }
 
 static void cmos_pnp_remove(struct pnp_dev *pnp)
@@ -1463,7 +1465,7 @@ static inline void cmos_of_init(struct p
 static int __init cmos_platform_probe(struct platform_device *pdev)
 {
 	struct resource *resource;
-	int irq, ret;
+	int irq;
 
 	cmos_of_init(pdev);
 
@@ -1475,13 +1477,7 @@ static int __init cmos_platform_probe(st
 	if (irq < 0)
 		irq = -1;
 
-	ret = cmos_do_probe(&pdev->dev, resource, irq);
-	if (ret)
-		return ret;
-
-	rtc_wake_setup(&pdev->dev);
-
-	return 0;
+	return cmos_do_probe(&pdev->dev, resource, irq);
 }
 
 static int cmos_platform_remove(struct platform_device *pdev)



