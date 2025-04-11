Return-Path: <linux-rtc+bounces-3929-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1471FA85D27
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 14:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 537B38C7320
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 12:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB65129AAF6;
	Fri, 11 Apr 2025 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AJsEHcjg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1543829C33F
	for <linux-rtc@vger.kernel.org>; Fri, 11 Apr 2025 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374990; cv=none; b=tTW8xxplE5bzPrfzaCCrYbvIBXaSldN4Q8z2ksPoZ0PRDOyGhIucyQr9lDBdU7nrZ0Cvugww8m2rAmODPweiteTeK49+V3zDik9bw/L/muSV4U6x8J9o482ZCCzzM4Ad8hfyhHp/XmkkAL3dSXEccvuBEObE4wslaFsXwHLKObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374990; c=relaxed/simple;
	bh=kapZgj+SJrEW/7vg45el3XbqPXPyGqqzv8dsBko1XSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D9smxIR7J7vPgs5resec+t/6Z8+AXa//sZMbv5UQzIfUbM7JFhII8f6yVmtYiHk89xxSF0HpQe58x0l90um9S1vFQjCyGo+NzRDyA5XbThYHJEwRkTEzPsioYGG1IxIBEgz8gM7PsuEkLt4iT/6cMpBvc9psGoGs7cNsjApMcSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AJsEHcjg; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so1536789b3a.3
        for <linux-rtc@vger.kernel.org>; Fri, 11 Apr 2025 05:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744374988; x=1744979788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=AJsEHcjg/xZUtt5UNRfKW6z4eeDKXzSN2/+X+t1ScYcQirFDnTLpPq8H6aPziaB7CQ
         CEcIU+y99ZgW861z9cAaxkxnQzEJyplu9qzs0EXuxDOvpnjUHfJ0yiptjwFFYyIFFO8P
         7FbVIIf9oagEpXDyKNrlKqGatESNLZQZWVNDV8NbfFpNZkoA5EwsWbtV0meEFXBcdQtJ
         8nNeojhHZZrSjlKEIk9RScxU4Nf0vvWIvadjxYUCrIOnOMz9yptlJ3Gv3MNRwmV4jomY
         9d9q5GCDLMwxiV7B56pqcYQZTkCa6IDfSNqzVcjP3jLQyP7tRfwAfAPxL/RdgVMd5Mvi
         wv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374988; x=1744979788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jM702IHJZgWY+bz6KCTgaeHyuuKyyx07sXK0MSiTh1k=;
        b=TcaDi5po1nXLdv1NNKDSnjGQTuwGhgTV7HXbz2LgIF+hTFy4Nbg2NxVDHnVwc6KXFV
         cIBQrUrEWIMqPef+WYsgMTf02cSV4Qe9wfTQMnSU3FCoQLRQQ54bIc884//7uwCYHcp2
         dz1nqiC4dO72LgJ22MKmK02RTXYjsqUEAmWldVHiKR5aPAcefVf/Pbw3hdiZ+Ox7IxKS
         GBWLTLFgv0ZOI0Btua+IKrI3xHW+krkU6SuHStd3Wvbp0SBxoZP2O9L8OyS8ojbXFg9H
         taY6WInp32NFxuM62j9pIQS15/IXo4rrcVM6M1D56dC+/ucOWkGrYS8FV5uupHFVpJ1U
         i7oA==
X-Forwarded-Encrypted: i=1; AJvYcCUugBPd8XTBI8KyFcPnaSUckQSKEvdxlXBgiFRVVHXOUJa/IsrOVC/ZZwYuKLWiLhWGE5i0d64HDIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/A+NLUG/2W1TjI+dMtsMm8BKdOjJ/RmjbYiFk+QXEK0gD+Os6
	HN/W+H3eRgr7WHhv6WnrNmwoDwck4OOMw71wlunZtLsFsFCrLBUUGHuDjzF6vP4=
X-Gm-Gg: ASbGncvWm3o+l0+2Sjv7bb8e6vK1p2uy6io7oluJTKguZYFT8QnZCNZT2UXuudQrS9D
	W5bOs9nJhqt8Ib7jCdkXM5EJXmWkpyirQkVXetxocUy6FASZ647KIhTDDTrume6scLacZSJ3zuQ
	tpSpDIgjqizPP9hebTllvfd0oQyHu96orL/xgDAcinx5jsr6Qd5xUQhA/l9K5qtcLE4vMcpO8VT
	qiTBli74rNcM9bpF5tBKS4gbDrkuiAyQU6XWf+YPB3FG1bNMBF76blP/v1W+CvP0SX9OYcAKv5K
	Q0Et84z6oeiUIo5WXE2uFnsgXu5iqz8049I+2ILHR3U=
X-Google-Smtp-Source: AGHT+IHQwIeS61ZHw7ELcaetMk1hxBxZhzt/gB3vL7AAjlG4usbaBhvHS6AeD5lvUMBQjtxiLN9JMg==
X-Received: by 2002:a05:6a20:2d0e:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-201799908cemr4162219637.38.1744374988404;
        Fri, 11 Apr 2025 05:36:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:28 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:54 +0200
Subject: [PATCH v3 1/5] rtc: mt6359: Add mt6357 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-1-f003e8144419@baylibre.com>
References: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=kapZgj+SJrEW/7vg45el3XbqPXPyGqqzv8dsBko1XSY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+TYlfRYrK9qBDtMoT67TK2uUDW65YoKt+VK8q
 GnOGMrmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURR2DD/
 4yLxGKl9OOCFSJeMkLVMWu8AstKcIkMWXfnsYBqGiG0y70mV141mnz9uA1Wc0q0e436oYHlfRwILuj
 8vaI3DBOZWPdM/vUXhxbr06wjzwcYlTSrvVEQD9mwFWuVcRma8pnf7iinuqfOQAl0xsdZ4vs/gn2//
 5Fxxc8ddmo2NGUZlrxrgFhYrn5FZe7ICGucwwYbHE6aJQVKSCv7ndCXIBFUs6hUZ0ZU9a2tPcmOemT
 WTVdyPhr+e/DT0LtIPnaqlgRaFEepcVsClWO2gD/TNvOoEakEuhUryURlyDJkApbyRme6GolKf4mCG
 pOT6Tf1mgbrGy1+NfTixaf58L0ePsfbhAUBXYotRpddCYUzbSTjLrFNmT1fpVzSfUvb4Bt6QzarYJC
 iiSUZwUappYupYyPDSPVV9jq17rxTtlRmXCEdJEjSBUmjaIt+0D2hPmSoJVwG2vhvSk6I99CJpRkKF
 IGQiqU9unaNRqaO1LK2nUKL9o5OoWDgs8QzyPglItnNxE3AdyMqLysqQENtPq3zEpQJq6QznOFOS5g
 D5bVbSKVNMxItR+mw5dlkJ5V5UuIleFlsoTvFThtHRjdfUQ5pFM5Pogs7PR435ybYQp7/MZwKStj2L
 y23u5rPPoMo2O0aFe0vMVu2TUB37HGnrKMbmKoVXX9l61d7LzZQfDbpfD1Bw==
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


