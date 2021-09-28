Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3441241AF24
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 14:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240636AbhI1Mkw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 08:40:52 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:53818
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240526AbhI1Mkw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 08:40:52 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B2C0E4030D;
        Tue, 28 Sep 2021 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632832746;
        bh=2DViiAQTdEoKI2fpopTtP6odKlo9WFvqVxYGHWPH0g4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=mK8yiJZQs8b8HsY3AavAxHYNnvDECP6ov7lnytbU9Sv071sThnwfns6nwyGWGLwwD
         /txRgug6pG/RoyiCdzpQgHu+ggvQ1KQPwuxZCsHcgIk32/ZCe0Fq8yalKnpGvPyJvV
         9qzmBUEetfqaYvGh+GRZ1DG4IS4JJWVWz4Fk64TZbn/bmynf50Dpq8Nb2Zrss9KVrS
         KDOHmGRvhQVSmvxWvn49y3xyZJBiKQ5TXYDUlt99uzR/QC2ThHYtxfacQLkXO1bymZ
         cRr/gMjqFUzPi1mMg+C9HrkhGgcfrAdapFKTHxwcbscXWNZPwHQ1UtgZehZSkaKpZ/
         kA/ekJG3u9aAw==
From:   Colin King <colin.king@canonical.com>
To:     Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] rtc: msc313: Fix unintentional sign extension issue on left shift of a u16
Date:   Tue, 28 Sep 2021 13:39:06 +0100
Message-Id: <20210928123906.988813-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting the u16 value returned by readw by 16 bits to the left
will be promoted to a 32 bit signed int and then sign-extended
to an unsigned long. If the top bit of the readw is set then
the shifted value will be sign extended and the top 32 bits of
the result will be set.

Fixes: be7d9c9161b9 ("rtc: Add support for the MSTAR MSC313 RTC")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-msc313.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-msc313.c b/drivers/rtc/rtc-msc313.c
index 5f178d29cfd8..7430244ad867 100644
--- a/drivers/rtc/rtc-msc313.c
+++ b/drivers/rtc/rtc-msc313.c
@@ -53,7 +53,7 @@ static int msc313_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	unsigned long seconds;
 
 	seconds = readw(priv->rtc_base + REG_RTC_MATCH_VAL_L)
-			| (readw(priv->rtc_base + REG_RTC_MATCH_VAL_H) << 16);
+			| ((unsigned long)readw(priv->rtc_base + REG_RTC_MATCH_VAL_H) << 16);
 
 	rtc_time64_to_tm(seconds, &alarm->time);
 
-- 
2.32.0

