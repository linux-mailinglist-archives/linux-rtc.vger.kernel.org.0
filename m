Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2299126B7E
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Dec 2019 19:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730425AbfLSS5C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Dec 2019 13:57:02 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:50189 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730815AbfLSS4j (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Dec 2019 13:56:39 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1ii0xz-0004Ep-UI; Thu, 19 Dec 2019 18:56:08 +0000
From:   Colin King <colin.king@canonical.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] rtc: rv3029: remove redundant return statement
Date:   Thu, 19 Dec 2019 18:56:07 +0000
Message-Id: <20191219185607.21285-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two return statements at the end of the function
rv30x9_init, the latter is redundant and can be removed. Remove
it.

Addresses-Coverity: ("Structurally dead code")
Fixes: ef2f1df54a29 ("rtc: rv3029: remove useless error messages")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-rv3029c2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index 4eda0db72b66..7c52efb7d113 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -898,8 +898,6 @@ static int __init rv30x9_init(void)
 		return ret;
 
 	return rv3049_register_driver();
-
-	return ret;
 }
 module_init(rv30x9_init)
 
-- 
2.24.0

