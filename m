Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343693C8E60
	for <lists+linux-rtc@lfdr.de>; Wed, 14 Jul 2021 21:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236745AbhGNTri (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 14 Jul 2021 15:47:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:37098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237061AbhGNTqe (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 14 Jul 2021 15:46:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7753613E9;
        Wed, 14 Jul 2021 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626291765;
        bh=E+iOY2yzXNa/d+8Y+LyMMqT6lx3jzGNbC2lLNqo6/cM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GQwB5rxx+H+fobHhOWc2JLdw1iOx1Vza7x7Un0QtwaFp7VYTwCrMEq1Tc2BLGOjyC
         +f4+upwqW8NIyPvANxWBe9NT45Qjkkw+t3PD/ZMPHtjKNc5ujQWXEFd6ozwanINp1m
         j+Y+kaxyc4j5bI2KpQgnUv0zt3hat34dEmnyvrlb542dRbKM8RhLHXpP9Gum6qWqQl
         2BrHzYlUsS+LuS+AFZIFznr7yaNwYkmqvylJ2dzU9H+3dzrKcNJ2WF2wwwMZUI0wnH
         w/WkY6+4bwFLllBwcYBO1SGvNDO4hwezEJX6/ENrDyrwPit+i9FQXgQe+bRtl7yE1b
         pl9FwgIThmqJw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sasha Levin <sashal@kernel.org>, linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 091/102] rtc: max77686: Do not enforce (incorrect) interrupt trigger type
Date:   Wed, 14 Jul 2021 15:40:24 -0400
Message-Id: <20210714194036.53141-91-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194036.53141-1-sashal@kernel.org>
References: <20210714194036.53141-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

[ Upstream commit 742b0d7e15c333303daad4856de0764f4bc83601 ]

Interrupt line can be configured on different hardware in different way,
even inverted.  Therefore driver should not enforce specific trigger
type - edge falling - but instead rely on Devicetree to configure it.

The Maxim 77686 datasheet describes the interrupt line as active low
with a requirement of acknowledge from the CPU therefore the edge
falling is not correct.

The interrupt line is shared between PMIC and RTC driver, so using level
sensitive interrupt is here especially important to avoid races.  With
an edge configuration in case if first PMIC signals interrupt followed
shortly after by the RTC, the interrupt might not be yet cleared/acked
thus the second one would not be noticed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Link: https://lore.kernel.org/r/20210526172036.183223-6-krzysztof.kozlowski@canonical.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/rtc/rtc-max77686.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index d51cc12114cb..eae7cb9faf1e 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -717,8 +717,8 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 
 add_rtc_irq:
 	ret = regmap_add_irq_chip(info->rtc_regmap, info->rtc_irq,
-				  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
-				  IRQF_SHARED, 0, info->drv_data->rtc_irq_chip,
+				  IRQF_ONESHOT | IRQF_SHARED,
+				  0, info->drv_data->rtc_irq_chip,
 				  &info->rtc_irq_data);
 	if (ret < 0) {
 		dev_err(info->dev, "Failed to add RTC irq chip: %d\n", ret);
-- 
2.30.2

