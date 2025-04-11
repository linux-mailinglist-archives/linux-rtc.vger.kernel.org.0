Return-Path: <linux-rtc+bounces-3933-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABC6A85D78
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 14:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 019E64C4797
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 12:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD52218AA3;
	Fri, 11 Apr 2025 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0oQmKPpf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C9A2E339C
	for <linux-rtc@vger.kernel.org>; Fri, 11 Apr 2025 12:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375020; cv=none; b=OT1nC/1dw2I86k5Wr3jlVdMh1B1ZVhCr0PmJ6tAhyVOkdAaDM2dMciEOj892Dj7l1LRmqqn9lBlfSIPEStZMgsMGxBvxYkDkotJMATysnelp3ImXC5OOAeGSPZqW6J0mEWXvddaVev9i3lBXow70TMORD2HJdL2dX8LoTUfxZ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375020; c=relaxed/simple;
	bh=7fUfH1eE+n+zmzKhP4D/88n0duk+DQJUKxhnlJl8LM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+zXs/zF4+GPU4YCr9dzx0V9ZjNAqFccbcSDZ6nxeaY4CM+Qv6e6Nk7CQfiZR1nTeEtE1HG0DmSHOL8CHFn+YyyQYapVTQgcFcUYZ0YxUp4CJWgnjyEUOkx3uYgKq2+nVHVJS+Sd0lSnfiICz2bFKSKrmLXli6XEi7R1pmDybl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0oQmKPpf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223fb0f619dso19947195ad.1
        for <linux-rtc@vger.kernel.org>; Fri, 11 Apr 2025 05:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744375018; x=1744979818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPJqCmoSsx1GevRwEqwTz+KiO5ldodlroUJvFu2/V3o=;
        b=0oQmKPpfP4qUut/3hcryutK5usIxOqRG+Md7deKTQaAVOsjsfZZwV7b33kreEL8HT5
         5qJAHw5VhjVT6t3f2ttK/JNHTaLob9acgitQfTYdefpsf7gvYNjsV0QvJ3e3tHhO1g4L
         mMPqU9t8NnP+FM/MKVNd2EuJCJjBL9xVXms0GKzTvdFymq0zMI8b8QaWav8U9dDUQ+ja
         qtV9/9TrKKR+DM5OYwXmjoZDAj5FRdv0BqvHRnUXCJwbHfRW3X+VNkuV0wrS6BB1b27r
         PrCHiNuw2mbfiSLuhjB9p/NS/2jkkD8aErgCV5lGauY/I1MctF8VRsoTtxM74FmEsD+K
         e2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375018; x=1744979818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPJqCmoSsx1GevRwEqwTz+KiO5ldodlroUJvFu2/V3o=;
        b=s8aXYh1+NtJ8wJhVLmMuGiLdmyzlBsRgG0yBHPccCaPVbc4CAtv1qXbcvHcpAK7eFo
         CNoLIgakzsOj6D4fgUxA6V9Xbq1nmH4V8hSxINf6hwOUcjUQzw2WCjPY/KBoEg9hhwmt
         GArmMIEPE8Wtkhjd5V3eaL5gKqXOvVYcVHznh2l8Xki9B2zzjAa58rJpzSW0/ALXn2M4
         nvmGUSfElgUA1BGmQSmV1EFXTk1PVOmkjyQ7mLXb8PMgDECCZaOfAUf1HiECapxsWKDi
         celycDxlYqwin499XokwzM54zCx34+DlGKGar6Mg29RK0P6mLI1Ajd/sNmtCUreuqxMl
         1KIw==
X-Forwarded-Encrypted: i=1; AJvYcCWgBKMxUIx+FkXOIwlzyu3M8utWRMu7AYHTkalhrzKySGoNMdwm92IqYcS3Yerds182qAbldB26yFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrgVhmcMg9V+1cxHeFi3ZV6aFnqW3ox1AtxJ9xdPlvEu8JmF/J
	1pH4YQgKCyXYR8j7kZOaTyOtxz+HZRFL3UONNeZdPu7fSKKe3ni5gV3KoarxWWY=
X-Gm-Gg: ASbGnctb5t5G1LlUqQs1Tcl/qcTbv2HZl36biN/Rt2KmCz+c6sMBuSNUlE0CnmmXHsV
	g5NJhi1KbTtqx+QDUuagQ8Dt01ii9vovmn9eAknzShIZfrGHsqobHDpdpptrUW2ADZRZ6rLtTo7
	ouA0TKpw5dkioLz/cdFUTYnYY1AUSpIpcgbtKo87HFa3zpTcy4mTlB3BkAYNIJ7PsBMYTQlBYzs
	0DvrBNUQMALrKQnx0NolZ/byLr03Gmp5UnSnTHsWk0KB8mTq3dyvgEnZPYAxGE83dG03Aa1xMCg
	/DPjDYG1fL777vs1cDc3hqc737D3C0e8JExFyQZ+9rc=
X-Google-Smtp-Source: AGHT+IFpLD5B7k7fXna43PL4COCo2fb781nBQohi+uOKDq+PQ5C/xXOE6xN0MQ0jZ8H8pyV6WtJL6g==
X-Received: by 2002:a17:902:cec9:b0:227:e980:9190 with SMTP id d9443c01a7336-22bea4fcad1mr41903285ad.44.1744375018241;
        Fri, 11 Apr 2025 05:36:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:57 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 11 Apr 2025 14:35:58 +0200
Subject: [PATCH v3 5/5] arm64: dts: mediatek: Set RTC start year property
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v3-5-f003e8144419@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=7fUfH1eE+n+zmzKhP4D/88n0duk+DQJUKxhnlJl8LM8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+kE39onw4c/4Fkz528PzOFaSGz5L4XeHhWzBX
 hDMFF+eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURZFAEA
 CMgGOq5n82NrZ1LYEtWO5FV0efEnXxIHS7oTUff/+0zjS/Y8jlqnNx8HPZO5nwUH8Nf9LGtZBslozP
 vWuRX7cK0jNVQfcIjqh9mpcZ2kT1QJoVCsGw9gN+QqAL6mNPZVhvCwG2HIOIEsxRF69xVDOMZbGJMH
 DRGrZpV24VYPp83m3Rgz+RqqYjOsB6go3Cppb67f56Go43Wa7Bh4h5bL0jMyT9wvc47+ZzIhF8Dsnu
 tL3sRzfjBIhd456WR4crywwS+Le3HSdnF0s0KBzUmHhKd4e9llBzJ6d9jxQfZmsNvXqlatDiioEYYz
 G2WgVthTQ1zPwsLFGvmM8dAbs6P/tc1O1RRVxU1RIdOaRjwIh2+BuH6Nf9TC9a748hBugjATRYmiTX
 5DUCslbH/zOfvqxbGqVbwjZhdyKXFSTewkXwDt1YuxWaE8spAjAFQYBu6Wcf7p79iPZy1Eoq4D2VtD
 4VbzRlik1xMo/9KPiwY3Np5IFPJpEqx2CnO2uCx27ns+84mWkSUIPlxhQVC5yrk/qbbU/hc+7N9uCZ
 EeICxRI7pmEj546cN1sweBOzcU67+ct8Kd4CZ1plilw+i65YAUP0JXj5JJVcxsWta+SoyGzIojnLcw
 HDa/GKX3CnNeQrPYSTWlTk7V9dW560HevmEhZH0M64UhIbAGF5pDYsk1OjIw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Set the start-year property for MT6357, MT6358 and MT6359 to have a
consistent value between the HW registers and the RTC framework.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 1 +
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 1 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 5fafa842d312f..d79ba87361d00 100644
--- a/arch/arm64/boot/dts/mediatek/mt6357.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -267,6 +267,7 @@ mt6357_vusb33_reg: ldo-vusb33 {
 
 		rtc {
 			compatible = "mediatek,mt6357-rtc";
+			start-year = <1942>;
 		};
 
 		keys {
diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index e23672a2eea4a..226259a51188f 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -340,6 +340,7 @@ mt6358_vsim2_reg: ldo_vsim2 {
 
 		mt6358rtc: rtc {
 			compatible = "mediatek,mt6358-rtc";
+			start-year = <1968>;
 		};
 
 		mt6358keys: keys {
diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 150ad84d5d2b3..7f9182be79724 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -299,6 +299,7 @@ mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
 
 		mt6359rtc: mt6359rtc {
 			compatible = "mediatek,mt6358-rtc";
+			start-year = <1968>;
 		};
 	};
 };

-- 
2.25.1


