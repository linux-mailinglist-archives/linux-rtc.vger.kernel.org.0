Return-Path: <linux-rtc+bounces-4012-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AA4A9F36E
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 16:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E8167AEB8F
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 14:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEE226D4F4;
	Mon, 28 Apr 2025 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WSIMp5Wu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CF726F460
	for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850606; cv=none; b=HAIKFmBu0VMXzRQ+bA3dnLkxhrgnhSXmS1lwODDBAEim+iKovw2byY71WqBgw5jSkHlM9onY4onFhB6Qs7SneEn2pHuw36WAlKS9IpnW3JXpTAdDVOWpJu7J3yAk0UECDirNeutyJ7rup+H/dxK/p3dpTNjWx3M7/t705h8ywcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850606; c=relaxed/simple;
	bh=ruIK2ZYu6lVtSOA1q39QxovEfdKMM9srBG4DrMyVUf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jc3/qrgG8TwQUlBYQQ1kGpd+7pmmMYtsjZoMK89OTs3sScmnAq02HGA6N2tknGnTYEbKoSrcouCqnb1Ga9nSNyaMA/s/2HQAec9/wlQbkgbh3qRoC1BmBhp/kTKNs4fkKk6zm/Ar5jXT+wPH+UeGhyGxVPr1LeU4V/fAmeYI7NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WSIMp5Wu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso32620595e9.2
        for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745850600; x=1746455400; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQYI98eNYPuBxf9D7Ml3+p+5IYpNd9AgbjcYArr6koc=;
        b=WSIMp5Wu1/TLqt0D1ExREOqJ0b1nou67qNuxcNJhrdsYAqTqZzAevtrsJSP1NIWR0r
         ydFy+6/Tp1YGAa8xdELj2sgL+mtOku/xjutDNzV/Ztfg7lR+hPABDstSZ6Vay1X9Hnkf
         stBCS2ne0hePnPoSdKVkCem/kckq1lPR4veIdIsbI8z+T0s8kNpHNpmBsrGYKABry6+N
         Ujs0qItxmjWxGv3FWzILX+Qy3L5K5oKne+f+l2ftUS/YTDIn5nvKGgSf8qlBXcBz4UuX
         gx1oEe7SNx4i9fuAbQZh8OLfEXFDJEtefu9qbwLmdWaMBZ2B/z4vGUdyCG3cH4eZcitw
         zWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745850600; x=1746455400;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQYI98eNYPuBxf9D7Ml3+p+5IYpNd9AgbjcYArr6koc=;
        b=lLbBG2JECBG/4cpF3rdgDAT5v1mKWRriYn+YSB54e1Tm5jleE0lJu6jWI9psBY+9qn
         ZqYKv8i1v71XzB6gNq4fYOMv08YPbfOpYs4XZx/y9lgKOmCC5XG32T6wKG8Ox7M1Hy1v
         APy393m3aNZ41aH8EOlc0areCACEP5jpyUM3nxhTbtClVauf/HaMFije2ZN4viNPC1m9
         OKDl5Vw5pH5G50eFczZ/Mj6Ds4N5/eBS/RV/OA0DDa6giK3juMQDCG4yldSp9kMsDIMQ
         ZVSgUZITUyiXB0BCfH+lwQWbyRuCqS9BJ7F3ZrZdaxlt40EGBgwcrSqmoYXaJtmYxsnG
         KwUg==
X-Forwarded-Encrypted: i=1; AJvYcCUNT/BRpZ6yGYA1m10XLmV5eH78Gik3kJFfXJLz2LiHF6KWHmCmiK4IiAMGEbKLJ7RLUZz6EagcCWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMbGV/mpurNJ8c/HvnKwguPrPbMVuH5+mSscjqukalDF2qa280
	/nTCBP823QXpY4Fus0c6cEi8IccaeeKg7/1vFOPN6x1Vf2QxXzjfSgi25t9pnFo=
X-Gm-Gg: ASbGncvKxtBqPTx3Pp2iBK/E4kOL3fgjpyec7W3EmobDM/pXv1ZqZIHIyxtDU5s8PVW
	WrPc6DdmXnVgByD2VgrwYN9PHjzzp7DcpcE5k8EvZBShEUboLQ0nckR212FG38gxA6WSu/Hecik
	28RxoAoMNThhizU6kK7oeFThqQJeDDpxp9Co4b+FKc7RuDmTBekk/FLcuXAatKpiUSjptPBIqTS
	/MNOIfb0WjK3Wkm79S6bQ2pldAME7kL0uF0YB11fP1RUjp+Ca9C/sqGFe7BOoCtM+iuk9ma8+ez
	oDnkTUBI9gnPgLvW32OGX/3APUJ1Iye2EcTNLXrN7sDYeXTCCGuKZZ0h/touUia5Zxx+tdIa8Me
	Yg3Ps
X-Google-Smtp-Source: AGHT+IFMzYA4rBwAp8XMm/VmBHtuPN7YejTTJCLHH0ds3UH44CvH+BTUCP1eWOoIxr4fWxmL+Mot/Q==
X-Received: by 2002:a05:600d:3:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-440aa5c57d2mr71982045e9.29.1745850600617;
        Mon, 28 Apr 2025 07:30:00 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-440a538f4aasm124616395e9.38.2025.04.28.07.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:30:00 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 28 Apr 2025 16:29:55 +0200
Subject: [PATCH] rtc: mt6359: Add mt6357 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-rtc-mt6357-v1-1-31f673b0a723@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOKQD2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3aKSZN3cEjNjU3NdYxPDxBRDoyQTi+REJaCGgqLUtMwKsGHRsbW
 1AAzLrJhcAAAA
X-Change-ID: 20250428-rtc-mt6357-341ad12b48ca
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ruIK2ZYu6lVtSOA1q39QxovEfdKMM9srBG4DrMyVUf8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoD5DnDmynJWGB3fQ71YEwcfouWK8V/j+TJRIOazo6
 JTbxnCqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaA+Q5wAKCRArRkmdfjHURdFbD/
 9SapbkaXzKJQv+9ANc35lhlI2QPX54DfEfjZjVAsUPn1ZRjXdtm9WR41IyzztGdGfpRmT6JitqlK2N
 XSue5F/P7bNCF1nboTy8/bssi5w2NdJIJv9onhgr8e+VJK2IWTWLATwdJ3IIdI8b/g9V06yUkOZr9A
 8PRLwmOu3hkFBqh279hQRA+DVclO6MhZbMUkEYkLoOrqCAnlSOoHW9XbFbbT/4/heej9DCwJLBBBdM
 KLJfufLks3tBLoU/e1jJwHenVVTAL2R5g29cnknxL2NsSMJOxM6giESU4jKrf6BP7pcIVB0YJpqzqt
 CxFysyaZEH916/YYkpj3XZ76uUfqFm7WzR8yVOXBLbgLaB/M51msZSyAVj0HDU2nmC3qaQ9NZ1sngL
 +2uiLVXZj2dhNFuj/VMFtojm3KI3Cjd6nIymlOOV8ZTU/OhHWMHYvPYEwlPpZ7nuH+nl2vj/JIhlyv
 cuVGNJai+xMc25fD6pJ4Tm78MCePjXxAORRDV3TWyF3KbAtyxTvyKwpnkS6Ghu7/hVw9ALCl3T2cDh
 wX/PiNYmdNqBLIhq2InUWrPfuyAhEnv6rhXW+b87E6u+FgMHTH+0CChOb2gno3JR21JwTYbj8o4+pf
 0GTaX6z2uIjtLHzQmQ5phDZVJ+ML70x25abikqmGttA4S3mTKaZzyVw9GOEA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

The MT6357 PMIC contains the same RTC as MT6358 which allows to add
support for it trivially by just complementing the list of compatibles.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
The `arch/arm64/boot/dts/mediatek/mt6357.dtsi` file already contains both
"mediatek,mt6357" and "mediatek,mt6357-rtc" which are documented in the
`Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml` file.

This serie come from another splitted serie [1]

[1]: https://lore.kernel.org/r/20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 6979d225a78e47f73b7652159e73f70c43b4fcde..692c00ff544b22b471b51f115dded9fcea432de3 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -332,6 +332,7 @@ static const struct mtk_rtc_data mt6397_rtc_data = {
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
+	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }

---
base-commit: 424dfcd441f035769890e6d1faec2081458627b9
change-id: 20250428-rtc-mt6357-341ad12b48ca

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


