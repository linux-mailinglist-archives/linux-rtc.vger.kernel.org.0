Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0844184FD
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Sep 2021 00:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhIYWgS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 25 Sep 2021 18:36:18 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:34984
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230024AbhIYWgS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 25 Sep 2021 18:36:18 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id CE56740CEC;
        Sat, 25 Sep 2021 22:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632609281;
        bh=kjS2kAtN+MZMc4+NVFH635/uKnmm+lhzssg8Vzka/GA=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=j0Qg4Z2essUvcrnDcjyGHhDS0FWGCz9y3p3ir6+lvVEJIs4wY7iI1VrN6YNTc7Sd2
         tj5FtF5CEClkB5c84NzrVHPXcMk3Z2mg7QaYkzULwaDzXX6Lnsqdr9GzXbqVO3UCFZ
         LyzdEDZvBXoFx74O9xXZioY+eTuje0xTD4s7lO0tsjHzz9xmm42eHe93sUdfMZgtoG
         vo6O92SZM4fZ1Yd6/JM6TxtZkyAHOvQKc4y5jo5lV7aNoOqBG4hIm5larQCV/Og46M
         K3YFwqQD1mZYDs68hPqJe645kCFwuTenYR6puDHtDRn0i6UHB/CVJxwvW+Es/cA72+
         lbi/1EZk6/7aw==
From:   Colin King <colin.king@canonical.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: m41t80: return NULL rather than a plain 0 integer
Date:   Sat, 25 Sep 2021 23:34:41 +0100
Message-Id: <20210925223441.182673-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Function m41t80_sqw_register_clk returns a pointer to struct clk,
so returning a plain 0 integer isn't good practice. Fix this by
returning a NULL instead.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-m41t80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index f736f8c22e96..6d383b629d20 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -557,7 +557,7 @@ static struct clk *m41t80_sqw_register_clk(struct m41t80_data *m41t80)
 		 * registered automatically when being referenced.
 		 */
 		of_node_put(fixed_clock);
-		return 0;
+		return NULL;
 	}
 
 	/* First disable the clock */
-- 
2.32.0

