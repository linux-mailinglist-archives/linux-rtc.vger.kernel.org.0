Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665C443B3BE
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Oct 2021 16:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236419AbhJZOP4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 26 Oct 2021 10:15:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:41136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236452AbhJZOPu (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 26 Oct 2021 10:15:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C24E6103C;
        Tue, 26 Oct 2021 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635257604;
        bh=xEjjHGXJAboK5YTWBRsXglKxth2kJ86QBuqXxDLsjas=;
        h=From:To:Cc:Subject:Date:From;
        b=EKzxtcBSL+1FrQIUiefovFv89wJKwD55jiuXqkgWy579z8UHLvRacSwG4gJEwz8HO
         5/Ot+bD23auaRFQV7yTf3rYcYczb83v+dpr54HAViR0p20DSLLSgsqL5whROuxxshE
         gE8FMPzQ0nkQ1l+DQcnPwC02rBcIwDyHfV5K2vOqjvsOxDSYlTNw5aQflsUAOISfFJ
         rytlFBtHssx4o6GAEb819ME82gmnMYsVMY35J9VpkntoU7k3Ejh3LnAjvjal6WqCak
         6VLA3Kuwx49P7zgaLAdVOorO59L+iI/BqcG1L49asmeTRTeYgOmiNAVUFWGXiiuYCL
         un1zQbsqokRwQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        Sachi King <nakato@nakato.io>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: x86: amd-pmc: fix build failure with CONFIG_RTC_SYSTOHC=n
Date:   Tue, 26 Oct 2021 16:12:15 +0200
Message-Id: <20211026141317.2999103-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The newly added logic to set the RTC during suspend from
platform specific code fails with a link error here:

drivers/platform/x86/amd-pmc.c:428:30: error: use of undeclared identifier 'CONFIG_RTC_SYSTOHC_DEVICE'

Add an #ifdef so this is only done if the functionality
is enabled.

Fixes: 59348401ebed ("platform/x86: amd-pmc: Add special handling for timer based S0i3 wakeup")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/amd-pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index 678bf6874c63..8bd5de4d9d3a 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -414,6 +414,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 	return -EINVAL;
 }
 
+#ifdef CONFIG_RTC_SYSTOHC
 static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
 {
 	struct rtc_device *rtc_device;
@@ -461,6 +462,7 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
 
 	return rc;
 }
+#endif
 
 static int __maybe_unused amd_pmc_suspend(struct device *dev)
 {
@@ -473,12 +475,14 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
 	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
 	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
 
+#ifdef CONFIG_RTC_SYSTOHC
 	/* Activate CZN specific RTC functionality */
 	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
 		rc = amd_pmc_verify_czn_rtc(pdev, &arg);
 		if (rc < 0)
 			return rc;
 	}
+#endif
 
 	/* Dump the IdleMask before we send hint to SMU */
 	amd_pmc_idlemask_read(pdev, dev, NULL);
-- 
2.29.2

