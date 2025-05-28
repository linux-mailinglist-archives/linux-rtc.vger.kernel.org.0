Return-Path: <linux-rtc+bounces-4185-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB33FAC6796
	for <lists+linux-rtc@lfdr.de>; Wed, 28 May 2025 12:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 829F64E4998
	for <lists+linux-rtc@lfdr.de>; Wed, 28 May 2025 10:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7052853E3;
	Wed, 28 May 2025 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hZF/OfWg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE786284B53
	for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428949; cv=none; b=iuhzHDB2rVZ/Clk9g7P9u7SBR6K4GWGVIFlPXNfmuxFRkN5+W0PEuqRYyUZSKIOSqMSx8ERIQ2SRJ6GxfpML6H4s2gaKsNQggSKzlQiTWTlbsCAnPNSK3CrIGpJ3ymCLRb/k7/kxHHFOPpyWYoLGAHJ8Vlvb/wTllmp275TTbwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428949; c=relaxed/simple;
	bh=aZiHVtAix4Bs7VFa47r9w+gaIOPFsTrPZZVeoeZFBbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqAWY+ktXddk2KNGphjrdu766+rglMt8HJ37nfj4M9My3GQosqDM069NcPoKgrtSSAG3arCUF0Jgn1zK3uwS2IoF/OnkdjSn9K+xdbevp14P+nnzAejJOfLpIUXuxZ1yU/IxJEz7kRCFlr+wxsv7nqRTZmgpv6I41N/7FOgf32w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hZF/OfWg; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4cfa5c8ddso707335f8f.0
        for <linux-rtc@vger.kernel.org>; Wed, 28 May 2025 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428946; x=1749033746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
        b=hZF/OfWgiDHsJZEHrud44zYhYtnloSsHnCau96QeFCOvnXEXgLj4a12VyTxSCAm11z
         N6oQ8koJ3ZnP8Ku5giMNrcY8pPyidl0PJuPILzUVpSbiCEIcHfZXXDVQrxzRsojwpETD
         +R09V8wtE9uHZXCgLssg8todkWdxNY6vBOmmqenSidkbH7oFrattB1MsjFbYuJS/Fdyy
         gIVCWCNXneazqGlBLC65swhWSZAwvbQ3I3kvCoYCckFFpi5lVxlTitLJnnuJRS0Ix8nk
         sOUfo111r1jspmfRO6g5KbZOC9Pk/V1AEhyJkDAFaV1hTtFM1XHieblnho6lyLHB7rv/
         TCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428946; x=1749033746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvIZrAnHYUbgegc3KzvI7IvlrGTu2jq1NObvCezVWR4=;
        b=Cx74hXMHpwtFXyHK2gx3UHnlr9gVq5X5qsRWH5hkHESIg6ZwZyMD7HfSGsPPo9y/Tb
         Lrpo3zWRpOP1GdkM2//BW8n5V3S7axoQrmc5Ae5QKgwyMgl+f9Rk5I76Yi2y5eExb7Cr
         MUPuhG+SHlOO5agMMAPvhq2ALNOGLEweUXVUEiGgWdSAEXmvCGjQk6och9jErWr/R8xL
         LxGfQG6O2QZEipNaiWRvyCVOatxWG0M8Q6LdV3RiJCL2JV3piEd6Lj/2lC08fvqqg1Ly
         McDfyOnaMzd7TrXYa1QHQns856dalMy4f5stdPvuvvYa9jlhUL3qxa0Kigz4plFQv16z
         h/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXjay53EB+umJsf1bE5WyPkw+5pRih2QotdcmWg8ID/etzNL+iKyopRxOfX9SpN5z6HhHodVsIJ7KM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoCEiCrwJtq78mH0moMo2OuRLIrfIv3kLa4Wz7HeweCrIGpUDN
	veG4IvTSbT0v9gVdSEZmRXXQy3pvdZtLXPJ6mT9Fe7a0DCPsfa+i/hhNtgawnYm1XkU=
X-Gm-Gg: ASbGncsdb/LIjK6MCVYQR159zKZKkNrsr20e3ydDGBs6NmChkoqcxYioyPZ8JH5F+5P
	kCyR+64V2ssMG7nkbEcE0BqcH21gfmQR8S5Zk3CzahxbvS4QoFP1CM8cx82XC70LjDIzlqx/kpx
	Tgcvh2rJ4sUXtYyAA7zRojTaRiCLc1DMoZgZThW4SVdh/ZswgLhAq83oKl9IwSGO/mYgh+6zjqZ
	0IEoEzBdsqkxHnPCC20fU2Ta8gVftNGCrFGQusBBYyUBb+NmpSOX0Da3FQ4ZnW/wl/LsMxBYaDc
	D4zcFtGEk6RMHO88fdGVlzreVU7rgB7Q3YoZSdBWdaMQHM6lg0Pdxzlg9svsLvOaCDxtAVQnp8v
	IWlqX/A==
X-Google-Smtp-Source: AGHT+IFNlq9KlCXRCQr1+6Ymqq9Ne7A6NiNU48Hh7WmaFcskniRj1xewpQQJ+ro3UTKAzWuWhYjH7g==
X-Received: by 2002:a05:6000:2408:b0:3a4:d0dc:184b with SMTP id ffacd0b85a97d-3a4d0dc1c54mr4702445f8f.6.1748428946040;
        Wed, 28 May 2025 03:42:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:13 +0200
Subject: [PATCH 17/17] rtc: stm32: Constify static 'pinctrl_desc'
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-17-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
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
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=923;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aZiHVtAix4Bs7VFa47r9w+gaIOPFsTrPZZVeoeZFBbI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhXAXetqzUvjtim1sn5fQnWeOfKvyrbA0k7X
 0F7r4JYgYKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVwAKCRDBN2bmhouD
 1y5gEACCSmP7bayECWKFTkwRKQ26DxhFqjfLlRRjLxFm5/ZteZr52oR68NuAqE5Oteaw0uuTlF0
 AY7psL9i9caogUFyGEHFJLQoNlWHJx87dbPtNhMZbGpsCLwXVf9MNN9NM5+baphXdCKj68+Ffud
 mc+WQUO8p0rqIbRViIvXBJ6gAx6Ilh7Q8yFzuoVIEAV6I9BDpcBgRtB0mqwZfNT1P01nvvfn/HK
 0/jT3G9Vdnpc9i1iTCLhpNp/FZupziVL6jPzDf47eWUlT3HFPpaJJ0tYcLLFl85Bsb82X73rnKM
 UBkCUre2kyXNDYjCNKOoZChLO04ZipNp38cUsCGyMOFi677HtzDsxz1RSX5Rbcbla1EOnS+6Zi6
 wES2PU+vUxe+LvEjmBnfAnsp4Vv47qY8+rU+v+N/7L2UAOT/N9w0X38a93OxUVi8HaJ071gheJB
 QCoBqlVg7+rjFK0nodd/1cYnU618gnyxlmtSWGKEOE1t7M+ApTiup2lOqvjt5YqTWangb8P6mI4
 91zeGot+yAXPL2gIH1Z6qaPZGgJ8qD+xTXRdP2qbVHh+EYSYcb3iCINKLCkSmeAA113O5CegW0f
 2YlveQzrIRHcqQzevdatgXRW8aDA6/KL/GFs07DAXEI2lUdBp+jh/3BAyA2S//my1rkpdfbhzcL
 ONXQAendt+UGD9Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch depends on this series - const in pinctrl core. Please ack and
this should go via pinctrl tree.
---
 drivers/rtc/rtc-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index ef8fb88aab48a0edad19ae5872421815aa04fe46..d4ebf3eb54aa9e91c8e9f8254f571c53794192fd 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -393,7 +393,7 @@ static const struct pinmux_ops stm32_rtc_pinmux_ops = {
 	.strict			= true,
 };
 
-static struct pinctrl_desc stm32_rtc_pdesc = {
+static const struct pinctrl_desc stm32_rtc_pdesc = {
 	.name = DRIVER_NAME,
 	.pins = stm32_rtc_pinctrl_pins,
 	.npins = ARRAY_SIZE(stm32_rtc_pinctrl_pins),

-- 
2.45.2


