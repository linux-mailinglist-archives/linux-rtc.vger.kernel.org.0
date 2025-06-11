Return-Path: <linux-rtc+bounces-4254-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF6AAD4B16
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 08:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DD85189E454
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 06:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA3522D7BD;
	Wed, 11 Jun 2025 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jCjuaYR7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E022D4C4
	for <linux-rtc@vger.kernel.org>; Wed, 11 Jun 2025 06:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622464; cv=none; b=bApXFGv4jFOuR5rN5Rz6J/eZP1mlT+7WMcd5pw4tC4d/zctVJcoxO2I1dJWXwiwxKE605S96pe5MrvM4qnoLuvmeQ2NwJZ+iXJ9HR1lIaWYrUeTVorB2LV169DE0BP6helAXRw/OOh20kF42AToQc9vF0cX0UTG2anXsObsO5qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622464; c=relaxed/simple;
	bh=NNpY2A6LBp263syvyG1Ecsfx8CioM309dnOrlcmWHKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WO6wPwzs4MrqK0sk/X8lSkRwGS8lBZiH/FbcnHcw9FV6wYkBln5anjSuecg6/xDiQnwrS8X6C0z3TTnaNeDv4Qinzt0Hq0EaMRr3Gf9ool7bKNT3i/aC8XG2a8OMknLkcETVWN+bkk1tS3I7R2tM9sMRalXViSnY0xlJLJOdYio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jCjuaYR7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4531898b208so313375e9.3
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 23:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622459; x=1750227259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
        b=jCjuaYR7O8tZkQzIrDwhyqdYKo7gzjZ6heJtIsGbQCMg90zGo1duRORdJqVtqhC3Rn
         bivuqUQZtpTVSqbOBs0fEY6AvyfrKimtF+8oOC8CrdqAMd1vkkcO5c3wh0hrGJWKNP9R
         cctucrVnc5l8ABnbI3mjbn+GBwldtp9NJIwf6UP5jbDfEcG5HVJDY1LGsqvGrGG8WHti
         63dTiJxUMuNAUP6QoKZDY6qbIO3NvuhuTbnLz8skuXYLXaPEaeJ1TPfcbXILOMiKGRH1
         syJmxEZXr1ej8YSiUg+PksC4eZDpXO3LX+oWtZIjEYLxCI88cYxcmLz8mbf7XZXJMeQL
         yA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622459; x=1750227259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q86QDWzbyqUrHwy10F9ZLVZs4bIWtafdYZALzNzfzYA=;
        b=K7tKUOgCqF9XrdlR6szViaOJR03lKO5amZ+/tQtxozhdPJmdzRT9+Z/P9JT1CZBc2T
         RIILvAEmouSvKgSr8VlCpj5GBLxF0YRj6EQujGXPxZbZHa+lqwmYwZaAVRY/cHaAgpew
         vSd5ZNOpchMFyncqenBtqZ/91qGFzZsHbM+2jxvcQZ4sZD2Apioz06JUD2lM5h109pxH
         ELbD8XksJ9cNg6HLC+AxUDgvcUdv4OPFNHyK37P7Q7g/AnuNzMrJBh8KjYBBbMW+XDqE
         tM4I44PUgBkrgx8V9eCTvsx7XF8kciqeaEfDn9EoQdUchiY4FLlhKQC/iOaqWuBB4u8L
         13kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR38li2JzDlbhv5zdFM4eIvnV3NS1ddFQ/6j5uS9qwtycn1gM3pBSVF8GnzF7YsFCAEd4q10Gnw7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH9USG79HXvZLUUQKsQ2E9lRweOCQZUsKMXSsQXaEjFlZCvAoK
	mi+uy0QBiVCg41PjgQ8MbMnEDsiebXlyzMzKh/ysMwseQx8OUB8/eDqhtttte2Akrno=
X-Gm-Gg: ASbGncsXm9sHR+V+bl6iM3Gt0/TbNfrtReOkrmkjxPYehH4oTcWfRcBe50OZH9rH41Z
	S7oetcGkAqe92XE3S4I/C0mrGdjTfXieJXeLPfiJCna24Nv7brFFhmVGnsEhZ4dClPPyf3E8zz2
	WJx5S9GZjIFM4/KZ0G/NsNOZM/CZXor0sFgUYgXO//jrE96joSkzrFtluO/cqM9YmSR2RsrPP/6
	jOD9cLd9YT3hOf85T+vpy0Bsj5UrdSw/bbC6RwldSOJ0TnE9tUBamwX/2Bhn+iKhRZf+B+qDnjo
	q0AyRspJ1oqtxzGgdWIT0QvzrZxfQtNLuYjdvQRAOQ+jArUK0GU7dqjq37OCiXbPL8cZiRAUj/u
	UIUebsSM=
X-Google-Smtp-Source: AGHT+IG0MrurMqwANRNDslKVkh3dKprU9y6IrTQpViebfAkp6mB1Umn/L5OKQlg735b88DTWJ/T9nQ==
X-Received: by 2002:a05:6000:288e:b0:3a5:2dae:970f with SMTP id ffacd0b85a97d-3a558821396mr547873f8f.13.1749622459437;
        Tue, 10 Jun 2025 23:14:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:35 +0200
Subject: [PATCH v2 03/17] pinctrl: amd: Constify pointers to 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-3-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2097;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NNpY2A6LBp263syvyG1Ecsfx8CioM309dnOrlcmWHKA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6hdhqC2eDe217cvGUZMEh1W/4vld1oNnYW+
 YkZbRVX0u6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeoQAKCRDBN2bmhouD
 15CoD/4hfYjkCZdVyazNq2ibT7AGxKu+nI1YPoMthyyZMz5plU+l+nNgmymy2NyhFPLVlkvCK4A
 4FsvS1iJn3Dkr+y2bC4QBIUT6dXj23C/I9Y+3v2Xg6Hx56dWfC6oNqEvF+rYuLqoJpq7A4T3RPj
 11snIaP0e4JrVwiKZh0u+TcJM7WOVXMiQmX60PHyUR1rnzJ8HXuhCqTtE+RTBK6gIjHFzZGp5L9
 q8UgvNJTUf5z2aiIeb1m20vw8f+zaUsHEVTBA5pQfrzaP3VRCuXmtWb9nRDuE1Q5btLjbaAmtiG
 9eaROFIx5bFOf+Sg9Ok9Gj2Q10AZYnHmnkoy4IqVI6kGx30tO/SVz/T3rgjNol+hXAQHI1hLcmk
 XVGVC16NfQipwhxK+aPcl2ywGautuFcWgIHKgPcVZZENQIcSUvtYzB18VACNwO+5ipDcASefqro
 QFP3fiWL3DaMswdeQCBUr36ds+srNu1ED0hRChkBFVsv/mKeJCXpoy9aEwWCSVtFi89Zld0QFFX
 MVKlitmuZXfSPnxmXiQaGaYXstF+0Fj4VHKYg2U27Irx1aunnaZdNwgPgX5pSPhe9Y4xoUm0xrm
 2HtZbv19j2BQ7vx/8hkKMv2025M8QDoGlqAB55eUy1ppAZx8gZ1ZQyAOOBIcShwwTyUgeLGvELM
 hElg3VcQFmHOyDg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Internal functions obtaining pointers to 'struct pinctrl_desc' do not
modify the contents so they can be made pointers to const.  This makes
code safer, explicit and later allows constifying 'pinctrl_desc' in
pinctrl core code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-amd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 5cf3db6d78b79af9ac5e7226de239a0d2f9aaacc..85617cfed2299e131c110e9d4084370790106404 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -872,7 +872,7 @@ static const struct pinconf_ops amd_pinconf_ops = {
 
 static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 {
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	u32 pin_reg, mask;
 	int i;
@@ -901,7 +901,7 @@ static void amd_gpio_irq_init(struct amd_gpio *gpio_dev)
 static void amd_gpio_check_pending(void)
 {
 	struct amd_gpio *gpio_dev = pinctrl_dev;
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	int i;
 
 	if (!pm_debug_messages_on)
@@ -957,7 +957,7 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
 static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
 	u32 wake_mask = is_suspend ? WAKE_SOURCE_SUSPEND : WAKE_SOURCE_HIBERNATE;
@@ -1001,7 +1001,7 @@ static int amd_gpio_hibernate(struct device *dev)
 static int amd_gpio_resume(struct device *dev)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
-	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	const struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
 

-- 
2.45.2


