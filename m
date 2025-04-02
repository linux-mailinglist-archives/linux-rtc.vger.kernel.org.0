Return-Path: <linux-rtc+bounces-3720-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBC2A78CA8
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Apr 2025 12:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F73617090D
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Apr 2025 10:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656F42376FD;
	Wed,  2 Apr 2025 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AQkDSCei"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4744623716E
	for <linux-rtc@vger.kernel.org>; Wed,  2 Apr 2025 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591085; cv=none; b=aOPM/CIVJUGzlBeTUZc51fyT4hoFkyGdMF0guxjaDxG+LrfiadGjXWD8C7GeAsahRp7GNPmfBlXyydytzjQQbPKF78C7X/NJS8enXBCZ0T+Y913FCQD6UscnSrHLDimG56AoK1HUF+OFVpmFPjccqUZ0n+QsFOlJi/6AqhKNfSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591085; c=relaxed/simple;
	bh=kapZgj+SJrEW/7vg45el3XbqPXPyGqqzv8dsBko1XSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L1jwY4VtyJ1LHwseD11+ePznstKkhL0tcUqlfipo8bF4MPzYrIkaPG+BTjMBBMUFio2tt8MfDLFRmp/nQPRfRBuIIeLlmHC1t+NsuAxODtx2V2o87UNadWSgoGyTC7tRlhZ4bLmHVJMtVUqVvxz6tlOD/SFfkT9jR2mvGbFp7gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AQkDSCei; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0782d787so43367405e9.0
        for <linux-rtc@vger.kernel.org>; Wed, 02 Apr 2025 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743591081; x=1744195881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=AQkDSCeizhTmfdcGIrm/tp/oyvBfu8Nc9d3MEoStsT8Fn03sd6rh9JGsKKEMigxxox
         t1PMY276IN4B54zW2NvsxOfaiXXIH8rB15d1knGEUytn9gvJUvogC25jOdVu0jLscuIV
         y/f4DxPlDrqjkPtJkCNAUsIu1LgOy11Tee+I3XRkHZtZnIam42j9T7jKjuwLyvkZ2tw+
         xp9YynOpGjqsuaEXvOnne0LFIe4dRP48tRpzCcT6coPIj6+YL2j4Hu6AFvq5Zqqyf3fM
         aHVbAXfaa5xXw/IHytGfjP7js3MA8wW4asH5lppLDyZ0qQWuw13qT/v5QSDZWLi3cFFM
         TibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591081; x=1744195881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=tT9Ra+bkH5V2zRHO66oEVWAEAWfIKIlXzEbSyjnRnbyNl8colklHppW5Am4wN9wDzf
         CJppBvjyAQA+ie5airNs5YcF/RzvvQoGoiZBo+HNEluoP2T2m/pfzY1JwFjvWeDb6ivx
         oKW8g0HCXQkYnwfK2MpV6IZxHmU2zxyZPCfUhU9hiHSUGUTGuBuPGOagYRLyQ6EJmAGb
         HEoHstw91Rg/NQBApBxyvD5H/0GFAUYOx+llsOE9gCQ1wheg8ON+N8byLv6xh94DSvx+
         RHncmTnZ1ZLfZ5OSVnD+wr5HrY0AdHcNDomJcPxIHkZruhqkS7S+RvtYHvvZjds6FKvs
         awpw==
X-Forwarded-Encrypted: i=1; AJvYcCVKdpM3sDTuj+uXcj68RxJWLREEexKRzoKgI1JW4MDbO5Iy78ykr4vx1e9Cf/qNvD8IFBM7lXa45FU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZj7wz8TMexAg+EGzLZ1fqQq8m8ywSjppPhu7Er7YU5QEhbt4l
	Q/09ZLKGNx+haPd8bSoXizAQwNr6a0nKAL8hEbL2ZCUB2KdFfoPfczQYCR66g7E=
X-Gm-Gg: ASbGncs6kU1OK5ZE4nXG8vTbzJwOWSqZyjhprXw3XPTu0ysa6SHQwYoKGQZPT57Bsx0
	F5t5rFiT7gqDxS2JMZexbSyq7Hd3j/PMw+wD4mupoovck6wqjqLy+Jod9MJm/yS3Q1N5eq7ZNG2
	0+Odw66WH22iSXQEovq998Ap42fNx/ZxGq2ow5NxFc+lMPJ01xc+9hnngL5e+mPEBCfSYsqKiQe
	37W7oWxWjkHM+EiJ9ZXMmDpvLLWMopXqFMH2DSd+yB461gPNPZZAwwk1wBkBWjFD6H1JqJczvE1
	MVkQ0tQtn0Ejs99J/f9ZmVNMpdh5DaKvJ76QvRlaUIx6jGS/
X-Google-Smtp-Source: AGHT+IHFX4ZEIcE1aZQVlgxdshZZ58qTruQoF7kCcWbrh4WBDQPX8/67a4gnRmDu7c4Qlr6lUUYk6g==
X-Received: by 2002:a5d:59a5:0:b0:391:3cb0:3d8d with SMTP id ffacd0b85a97d-39c120dc1b6mr11880056f8f.19.1743591081602;
        Wed, 02 Apr 2025 03:51:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:b96e:56b4:f317:73c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm16849484f8f.94.2025.04.02.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:51:21 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 02 Apr 2025 12:50:59 +0200
Subject: [PATCH v2 1/2] rtc: mt6359: add mt6357 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v2-1-d7ddc3e73c57@baylibre.com>
References: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=kapZgj+SJrEW/7vg45el3XbqPXPyGqqzv8dsBko1XSY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn7Rak5IWC3xb2IP9/KDZQCL9AVG2vNEYj0BN1MrkE
 IftGCGeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ+0WpAAKCRArRkmdfjHUReV7D/
 0cLHSn10CwEySMB8HDoWMVHV7DniaF+s6ri1VtDU5Z90ujzhyoNjYpW6ocn5hkkDAQkovJc3mB9HV9
 MxyDr23liQEY4Ga7N1h3WHDkvSrd6qW6ZzRq33lUvEyOWk1jECxAQ4fax5e9/hNec/3DDWs/nYPI37
 YR2lz60otwSz+oiIL/lYOLNWW6Gb4uQgYQDSUDQt+o6w3OTlXf0oOsFd5Gjm5l3O9kuKeQqp5hAHlR
 XmyFEY2LQFiJWDT8M+zHZ2f8v/zpLYeCGv/yqMRmu5NKFOGem3EMNAqa9+TJfTtOvDS0rYKT9easi2
 JFi0A3hhjRLjNxit5UFBAp8N6RzWqDvxcEJ/Kw21mj01/TG4UfXeR6i4xLyF5+o33SLg17jLdXUb4w
 kVxYfL/t91biAZPmuALxMOayH7g3Sr7wc/x9s+mItMOPThVPIzzped18FRm+RWNpWs42LqkMTHJtd/
 +dc5cRwLiif403QHP+3umO/GXDA78qlt+vRVM7RnYz8EFQ8xFazthZLFEwLMJgNwST/BXzLStxlMGE
 VufnIuLKEyEtIcUvh88iVNxHtSso6EPQ/nKOkaDEW75LgQ7yeTKmozCg2pt7yUp7RPWvOoVk4b4YJi
 Cut172ovjm6QfkBBhF+bl6GvF1ELcd+fxbhLvP7W4RouCdJMvQJKX20jkuNQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

The MT6357 PMIC contains the same RTC as MT6358 which allows to add
support for it trivially by just complementing the list of compatibles.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 6979d225a78e4..692c00ff544b2 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -332,6 +332,7 @@ static const struct mtk_rtc_data mt6397_rtc_data = {
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
+	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }

-- 
2.25.1


