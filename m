Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98EAE52504F
	for <lists+linux-rtc@lfdr.de>; Thu, 12 May 2022 16:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355443AbiELOj3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 May 2022 10:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355071AbiELOj0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 May 2022 10:39:26 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50C0B26197D;
        Thu, 12 May 2022 07:39:24 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2E3C820000A;
        Thu, 12 May 2022 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652366362;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Y8Q8PUTBehY+tn9jgIuohlr4xyjhUPPOjt8DiFB/M08=;
        b=Z/osUR+FF/oOteSlo1iDCesBiu7WNLgDpfuUwye+kCWtOj0igx1YEHaP0wLkXR9Ui9taIo
        DdWAIJz6rrBVGlg4IRu30zEWZj6i0+Pb5IawMUYMY7MjvlPMQZWWM8yaYN/dXMFAW+WGVn
        0gPBlfP58KbyiCFNvsKrNArepgbo1llEyS4Vf+8LDmzPPal3yJSwWJAHtab7pRaHX0jMQm
        uYKyrGxVtrHSR5u7zxtH0XzaYqvLiGpz4oLEE2bB0TTLee8RJiQwZPIsd6+Cgmi0DL0Zmm
        ccjwprV1wbldO1GkUaDEexbCQcAeMMiPmVx+WWLVtN+cbuDb9AtkgoN76OSmfA==
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
Subject: [PATCH v5 0/5] RZ/N1 RTC support
Date:   Thu, 12 May 2022 16:39:15 +0200
Message-Id: <20220512143920.238987-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
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

Cheers,
Miquèl

Changes in v5:
* Dropped a (now) useless header that could produce a build error.

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
 drivers/rtc/rtc-rzn1.c                        | 422 ++++++++++++++++++
 5 files changed, 508 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
 create mode 100644 drivers/rtc/rtc-rzn1.c

-- 
2.27.0

