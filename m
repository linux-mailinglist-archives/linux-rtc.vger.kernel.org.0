Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B24F41FE668
	for <lists+linux-rtc@lfdr.de>; Thu, 18 Jun 2020 04:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729364AbgFRBOs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Jun 2020 21:14:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:44536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729359AbgFRBOq (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 17 Jun 2020 21:14:46 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49A1621D7B;
        Thu, 18 Jun 2020 01:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592442886;
        bh=fi+m/bnr5keFuFBgdxP/afZxdbREdMtNlTV0G1uL0gs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LdJnBGeIV6zNiMYPEsXNmEgEOVMFz1IB7a2pbNdM8N02xXWKTReZL+ySoKyNfsgGj
         4ZzTgILu44UL0iVSnJpM4Gq2lQ9pO0srSkAhhzSKyABUcGoKHlcdKe2pl4+KyDDDy8
         +SvTM0Hf/CatipcqG2MOdgPHWjxtaVwtD4JgwPz8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Chuhong Yuan <hslester96@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sasha Levin <sashal@kernel.org>, linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 309/388] rtc: rv3028: Add missed check for devm_regmap_init_i2c()
Date:   Wed, 17 Jun 2020 21:06:46 -0400
Message-Id: <20200618010805.600873-309-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Chuhong Yuan <hslester96@gmail.com>

[ Upstream commit c3b29bf6f166f6ed5f04f9c125477358e0e25df8 ]

rv3028_probe() misses a check for devm_regmap_init_i2c().
Add the missed check to fix it.

Fixes: e6e7376cfd7b ("rtc: rv3028: add new driver")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Link: https://lore.kernel.org/r/20200528103950.912353-1-hslester96@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/rtc/rtc-rv3028.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index a0ddc86c975a..ec84db0b3d7a 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -755,6 +755,8 @@ static int rv3028_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	rv3028->regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(rv3028->regmap))
+		return PTR_ERR(rv3028->regmap);
 
 	i2c_set_clientdata(client, rv3028);
 
-- 
2.25.1

