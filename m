Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7CC520165
	for <lists+linux-rtc@lfdr.de>; Mon,  9 May 2022 17:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238576AbiEIPuU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 May 2022 11:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238583AbiEIPuS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 May 2022 11:50:18 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208D72BAE73
        for <linux-rtc@vger.kernel.org>; Mon,  9 May 2022 08:46:13 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 1796920000A;
        Mon,  9 May 2022 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652111162;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=3UPMpjr1/9eTsZPX43C+0yaWrNcWuFNQomhL2135hNA=;
        b=SvyA8TFxT+KLQn8w70C5gG5BloBUA8TAiGSgSaPNiiPEqBn2knXVH+SzItZmbf1B/ZERJx
        JmnrrmO+88WNxLZDmTVK0WyfhWeOa+SodA9317VnuywTovCc4gmpsq9J9lwXETA4U9lbch
        34CawoIZnhLFRli8dn52Doaic+Paw+/1FymBP4Np7DOFa1czCBe5SIpiQUFWmJVG8lULzi
        ggHwtBKlcaNK5GGax6bIUGaif+7BHAZdLbwfieOx72aZKS4njuIyG82ShFYSN6QHmG1OSf
        GSBITKjYvsxmLILQKSA6TC37elAc/RDYL7Z6zK3J+5Fgq5+kUuQhAFt1UQzSRw==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: [PATCH v4 0/5] RZ/N1 RTC support
Date:   Mon,  9 May 2022 17:45:54 +0200
Message-Id: <20220509154559.24851-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

This small series adds support for the RZ/N1 RTC.

Despite its limitations, I found useful to at least have alarm and
offset support.

The RTC hclk fix has been merged in the renesas-clk-for-v5.19 branch so
I dropped it from the series. Same for the DT patch.

Cheers,
Miquèl

Changes in v4:
* Collected more tags (on the DT bindings).
* Fixed the name of the SoC in the header: RZ/N1 instead of RZN1.
* Dropped the error message when the alarm IRQ is not available (already
  handled by the core)
* Used pm_runtime_put() instead of pm_runtime_put_sync().
* Used pm_runtime_resume_and_get() instead of pm_runtime_get().
* Used devm_pm_runtime_enable() instead of pm_runtime_enable().

Changes in v3:
* Collected tags.
* s/soc:/clk:/ in the clock commit title.
* Dropped the RTC hclk fix which has already been applied.
* Added the power-domain properties both in the bindings and in the DT.
* Used runtime PM to enable the clock instead of using the clk API
  directly. 

Changes in v2:
* Fixed the error path in the clk driver, where I missed to release a
  spin_lock.
* Collected tags.
* Moved the rtc subnode in the dt to keep the nodes ordered by unit
  address.
* Dropped the useless "oneOf" statement in the bindings (compatible
  property).
* Dropped the start-year property in the bindings (already defined).
* Avoided rollover calculations that could be more easily handled (and
  reviewed) with a time64_t conversion.
* Returned ERANGE instead of EOPNOTSUPP when the alarm date is not
  valid.
* Cleared RTC_FEATURE_UPDATE_INTERRUPT to avoid warning from the tools.
* Dropped the sysctl patch adding the reset helper, instead fulfilled
  the description of the RTC clock so that when requesting this clock to
  be enabled, the idle bit is released.
* Avoided rollover calculations that could be more easily handled
  (and reviewed) with a time64_t conversion.
* Fixed the max_range value, after a rtc-range test and looking at other
  implementations.

Michel Pollet (1):
  rtc: rzn1: Add new RTC driver

Miquel Raynal (4):
  dt-bindings: rtc: rzn1: Describe the RZN1 RTC
  rtc: rzn1: Add alarm support
  rtc: rzn1: Add oscillator offset support
  MAINTAINERS: Add myself as maintainer of the RZN1 RTC driver

 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  70 +++
 MAINTAINERS                                   |   8 +
 drivers/rtc/Kconfig                           |   7 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-rzn1.c                        | 423 ++++++++++++++++++
 5 files changed, 509 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
 create mode 100644 drivers/rtc/rtc-rzn1.c

-- 
2.27.0

