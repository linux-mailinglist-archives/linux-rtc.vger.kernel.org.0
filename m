Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB6414B6FA
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Jan 2020 15:10:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgA1OKI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Jan 2020 09:10:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:58740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729113AbgA1OKH (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 28 Jan 2020 09:10:07 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40DE524685;
        Tue, 28 Jan 2020 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580220606;
        bh=imP1lVLmVr62EPE8Lw+MwCm/y8htQT19fBkKWTSVtdo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=evAi4hb8CPmWAWcE73Pmdv0Pb5no9tPsK59WxywJijxmPvzQuMGg/I4wq7sU4tDCt
         IRcm692pXd33D3K1rtzjDxC3A9REFvNAZzRMhxvPk1ywI+CDg3kmHUhOo4nsMZktIW
         Os8LszGs86efVfuoFYIKpNr/Y4lDfJROVsElk1yE=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Sylvain Chouleur <sylvain.chouleur@intel.com>,
        Patrick McDermott <patrick.mcdermott@libiquity.com>,
        linux-rtc@vger.kernel.org, Eric Wong <e@80x24.org>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.4 037/183] rtc: cmos: ignore bogus century byte
Date:   Tue, 28 Jan 2020 15:04:16 +0100
Message-Id: <20200128135833.714056908@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200128135829.486060649@linuxfoundation.org>
References: <20200128135829.486060649@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Eric Wong <e@80x24.org>

[ Upstream commit 2a4daadd4d3e507138f8937926e6a4df49c6bfdc ]

Older versions of Libreboot and Coreboot had an invalid value
(`3' in my case) in the century byte affecting the GM45 in
the Thinkpad X200.  Not everybody's updated their firmwares,
and Linux <= 4.2 was able to read the RTC without problems,
so workaround this by ignoring invalid values.

Fixes: 3c217e51d8a272b9 ("rtc: cmos: century support")

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Sylvain Chouleur <sylvain.chouleur@intel.com>
Cc: Patrick McDermott <patrick.mcdermott@libiquity.com>
Cc: linux-rtc@vger.kernel.org
Signed-off-by: Eric Wong <e@80x24.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/asm-generic/rtc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/rtc.h b/include/asm-generic/rtc.h
index 4e3b6558331ea..3e457ae2d571d 100644
--- a/include/asm-generic/rtc.h
+++ b/include/asm-generic/rtc.h
@@ -106,7 +106,7 @@ static inline unsigned int __get_rtc_time(struct rtc_time *time)
 	time->tm_year += real_year - 72;
 #endif
 
-	if (century)
+	if (century > 20)
 		time->tm_year += (century - 19) * 100;
 
 	/*
-- 
2.20.1



