Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 664B677D5D6
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Aug 2023 00:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232960AbjHOWRP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Aug 2023 18:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232864AbjHOWQt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Aug 2023 18:16:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C0A198C
        for <linux-rtc@vger.kernel.org>; Tue, 15 Aug 2023 15:16:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 30FAD64038
        for <linux-rtc@vger.kernel.org>; Tue, 15 Aug 2023 22:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C56DC433C8;
        Tue, 15 Aug 2023 22:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692137807;
        bh=XwXvMZmSyw0Fultdv91spvUYs8G7JznbXwG0CGzyAxM=;
        h=From:Date:Subject:To:Cc:From;
        b=KaH3eQclvi001FrOcutYbDGQo7hpeSF0k96n1brchRa+PiK6n2Ae+08jPrhGrUg8T
         eGCnjPwfFEWv+aMO+PZtOQKDFyPKAdFvH/OSA/jtdlDAW4KZqzIs2CCVlesgdEr8Hh
         MTwHqy+4AcvB3zN7Fto4z2hfELMIGWO6M4uO+lrwREwp/cETpubtrlMs5hock/a7hQ
         cW6lJXtRXM2fhmXtByLyZjKJcHtJjUQb0IaZuON8+tszOg3o2QwPmXObWcboYaF5ge
         TMS6t95ODItsb5blWCaSKTaqKU3ogPmd6ZEZayY/9p48hBjFqAEqfR1M14/gQ4k2Li
         geulV0KHc0eWw==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Tue, 15 Aug 2023 15:16:41 -0700
Subject: [PATCH] rtc: stm32: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230815-rtc-stm32-unused-pm-funcs-v1-1-82eb8e02d903@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEj522QC/x3MMQ6DMAxA0asgz1hKAq1Cr4IYWscpHkhRTBAS4
 u5EHd/w/wnKWVjh1ZyQeReVX6qwbQM0v9OXUUI1OOM64+0D80ao29I5LKkoB1wXjCWR4mCC7z/
 kyNgn1H7NHOX4v8fpum502a94awAAAA==
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        arnd@arndb.de, linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, patches@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2767; i=nathan@kernel.org;
 h=from:subject:message-id; bh=XwXvMZmSyw0Fultdv91spvUYs8G7JznbXwG0CGzyAxM=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCm3f/rNPqfvaPfxjI/qv/SEwyGPJnwSUl0SduxYtgDPp
 S69U5dPdJSyMIhxMMiKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJbCxm+B/Vfi3Ps2eVwv+z
 d45+XBFroiSRWzq3mEllOSNb0qquM7wMv9kzPjClnctoZ5LVLOpb6rI3oe17fUy/WCuD88+wnYt
 X8QMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

After the switch to SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() and a subsequent
fix, stm32_rtc_{suspend,resume}() are unused when CONFIG_PM_SLEEP is not
set because SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() is a no-op in that
configuration:

  drivers/rtc/rtc-stm32.c:904:12: error: 'stm32_rtc_resume' defined but not used [-Werror=unused-function]
    904 | static int stm32_rtc_resume(struct device *dev)
        |            ^~~~~~~~~~~~~~~~
  drivers/rtc/rtc-stm32.c:894:12: error: 'stm32_rtc_suspend' defined but not used [-Werror=unused-function]
    894 | static int stm32_rtc_suspend(struct device *dev)
        |            ^~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

The non-"SET_" version of this macro, NOIRQ_SYSTEM_SLEEP_PM_OPS(), is
designed to handle this situation by only assigning the callbacks when
CONFIG_PM_SLEEP is set while allowing the functions to appear used to
the compiler. Switch to that macro to resolve the warnings. There is no
functional change with this, as SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() is
defined using NOIRQ_SYSTEM_SLEEP_PM_OPS() when CONFIG_PM_SLEEP is set.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I am not sure what to do about a Fixes: tag for this change. I am not
sure how Arnd triggered the error/warning in commit a69c610e13e2 ("rtc:
stm32: remove incorrect #ifdef check"), since from what I can tell,
SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() is only defined in terms of
NOIRQ_SYSTEM_SLEEP_PM_OPS() when CONFIG_PM_SLEEP is set, so I am not
sure how those functions could be absent in the source file but used in
NOIRQ_SYSTEM_SLEEP_PM_OPS() when CONFIG_PM_SLEEP is unset... I could be
missing something though.

However, I think this change should have been done as part of commit
fb9a7e5360dc ("rtc: stm32: change PM callbacks to "_noirq()"") because
the "SET_" macros are deprecated and that would have made Arnd's change
necessary so... assign an appropriate Fixes: tag based on that
information as you will :)
---
 drivers/rtc/rtc-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 3ce4b3d08155..76753c71d92e 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -923,7 +923,7 @@ static int stm32_rtc_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops stm32_rtc_pm_ops = {
-	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32_rtc_suspend, stm32_rtc_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(stm32_rtc_suspend, stm32_rtc_resume)
 };
 
 static struct platform_driver stm32_rtc_driver = {

---
base-commit: 4f3688dca15053555ade31a785a9c75837a64fb8
change-id: 20230815-rtc-stm32-unused-pm-funcs-90d84bc2c016

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

