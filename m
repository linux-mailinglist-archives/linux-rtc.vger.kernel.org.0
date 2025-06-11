Return-Path: <linux-rtc+bounces-4265-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CBEAD4B41
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 08:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70DB23A740B
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Jun 2025 06:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA559239090;
	Wed, 11 Jun 2025 06:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="umbveQz6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE642376FD
	for <linux-rtc@vger.kernel.org>; Wed, 11 Jun 2025 06:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622503; cv=none; b=dc2CIs5XkXdeayCYr/jClBGHi0jzJ2v0au6Uz1j3Qn/ne/CKG84nU8dYLEuE7hgzlQJfZW5B9cF4eXSBOPJUIqKj0Dmii4jSJb23uzxCdnUTKJh0PIOy8OeyZXjdt/L+po1r6tXynnmmtt1krpLT/a6mwPpxWYtuwDA4jcrqmYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622503; c=relaxed/simple;
	bh=+flFdO+wB1jUsuwdikr4oTVuYRRszXJESkvc2OSpc4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZkDl7d+pGSXA5m1SCC8qdrh5kTAWML/plNDLyAs4PibCSUW7tYxgCPFDvb8c4WgrQ0PqVPpnaaK4R6y+no0kwjeSu2g5gk7sn7JlJ/9yRLdLZHqn2TIO1EgbT39yvBu0+n5MACCte74lJGfFWiMDzrmsy8XCTd2HnRjHLMViWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=umbveQz6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a524caf77eso25261f8f.3
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 23:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622500; x=1750227300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dpZC43mjqQSL2n4C7kbwZXGNoboHrOdh0nn9Na/CTw=;
        b=umbveQz6xL+Gbh5fMuMSKAojZfbPHAuqPtXDU0BzYjqiQSYHZs+D8PR1d6hNZvkQq1
         cgbEsegN4CoWl7z5BT8sLSpTn4Om++GhNafpn5vGnhsyPJdkP1VmR2qerkZeiJ1P8Wr2
         yCk7FJskpUD0vDd9YlZC9v0niY5fNn5jRvUbO0J1hqsZwNnAMcM8F6FkLO8TXGDfjANj
         DQuVKTDhk70vd+lQvpkQhQcxFPM7E1+d0G1HILGIe1Wk0FbyraYBrigdIMZl+CcHAXkP
         OmarWu0b0vztxSA3Lun/6Gmw8vwU+dO+ZoV73baLAGibB2GdHgTfsMUSuXNgPPX212IF
         NYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622500; x=1750227300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dpZC43mjqQSL2n4C7kbwZXGNoboHrOdh0nn9Na/CTw=;
        b=KO3PHjxRFarKvqAXbdwX+thlhK9Lf7AMiU6PgNyOWEhirp2GyIfI3Epml7zHSAamUk
         B3kU7rxGn82yP4qs/1SlVhpGlYZB3qx6N63b/ixPVP6ylb7coNtP6kLBXF09E49dVsxS
         ZPx+X6TSIoKy/JPvtDz09MgfojboF/C6WbNHXx2XbIC8Prf6uWEO+kbmffnO43MOg0Q+
         AWBlTHBXNI4EswIjj9hIFRFqyWxUBDA6qvJt7efhxKsx4X7Uc6muzNy4/FwTB7ltEITg
         O5KHacXOggpr2BqipbVIeChoK0wkhGBN+vkmBV8skT/CKXCX7e5aLoEsrwvAFhha4OIj
         I4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUf1o4GLhQc3fm4L6ZxKyuCPO11rFQlyYF/2DsVHzmOxPMdI8smja0Ww26JR5X5PRa1T1XbJz/V1fU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSnkAVAo4wTyWj7kkF9RqAkX5eKGZIZzRhcpaugqNh/yoceRMf
	OSKPgKFWFpuL4GWxsuvNCEx2o1c/7pIKiYFiaYlYUy9eoFPZSE+5SPHfyxfbYFO895c=
X-Gm-Gg: ASbGncshJr4F21RvtpAgus5Be+KNe9pXXW6twXH7CYFSpbZnvRTS6meXGTBMwk0X/FM
	VWOgm0Wg+DDIr+M2GVi7uQ4iewpKxdOkirbFWkFaHlB2I0gdnh7LD2/IKb/598Rp2bHrhVI6ppV
	+fniDKrbqYKCqHnRH9Fv2DVBCgSGzZjeQ6Vkdji++QUVBaRUSj1X+unLgHI1E64HxuMweI3lAK2
	IptEYf2S/XH8jol7rvEzPSO3o/ZypOEt5mvLcSFu1VaMkBHiYe1F5BpluMcmZzvLcWmPdGR+vDu
	ckZgbuO69jLYFKIObX5gpOwRYRaafijjU2Hqk2VmbyNWz+ImDXlsAj191f11vkgR/3iP0VOtaj/
	0KqYdcdU=
X-Google-Smtp-Source: AGHT+IF+8CuDuQ4kf6mSJfvCZWVF2nwaA+1YTCjzunNZUTEkAuuOsBPS39QliHzSk5Dki6Jz/oOC5g==
X-Received: by 2002:a05:6000:2303:b0:3a3:61ab:86c2 with SMTP id ffacd0b85a97d-3a5586cba07mr495450f8f.7.1749622499974;
        Tue, 10 Jun 2025 23:14:59 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:46 +0200
Subject: [PATCH v2 14/17] pinctrl: renesas: Move fixed assignments to
 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-14-b11c1d650384@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1336;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+flFdO+wB1jUsuwdikr4oTVuYRRszXJESkvc2OSpc4Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6rDKvTnvN7uWrkaR38SoKZ0JyrYcQvhwNCm
 /Q2Dq83gq6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqwAKCRDBN2bmhouD
 14FeD/4ieFxDBp2aYLDtBNbnYfL2Cs+jpT6Ln8r5h8k7iHk7UFGxh34/qOVxHUd1z1j+6DSnp0k
 Ke/5Mro6a+xzalY4l7ACNl9imdQ2c1Gzag+tWv72+5bvxiGqP8bZqL0Jw0w0zL6sWtytvSfKqWO
 BGkf3r1wHCuVlIPAta/4/+GAbC20Gbc2yR+46ZTzVjBSbDxXW/1q9H0GZebt08ZazmjdzHE/iwQ
 yOIIz88jzvOLYWHjKSWOL9LVDAK3GfiN7ClK0jGoNFuFmO2a1M4sBDhcX1nN4xbAmki3aupM8VD
 Tbp64fJQ896BpCzX2DnW2WqwdYVIVxtQhOvao+W/kMTC/vQc7fZdCPminzsgcFpdUsZcDW2G926
 JLDEoqmjl02ySwXcMvRRMfWxQMIzssWYFwDj6Nh2J6pmtzUPPdgn9YfXzP3DVD+YWq0Pm/AM4yP
 dlmgwSbCV3chOEk9k2nb8UY+TUCRLUDb7xXTAxI+ozgWRWv1brSG/BEZtSHbO2rZA7payHinZB5
 KN6dtKpxFObljSM+pANXsnq2vMRtRUfm/WYw/vNvczM7tfhsCOgw9BUrYElrlhYMcw9LcmSOP7j
 iaQdnaIObg7tji/TYEvlN7XdOkUPn6SjarApXOtiu6bjHdimu695XgL8gl39wSEZZH7kmPQj7NA
 W7xp+qiZCZd9aTA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index d442d4f9981c908389407275522b936dbce294d3..fb874867dbfb9877b012988543ecbfd1bfb11270 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -680,6 +680,8 @@ static struct pinctrl_desc rzn1_pinctrl_desc = {
 	.pmxops = &rzn1_pmx_ops,
 	.confops = &rzn1_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = rzn1_pins,
+	.npins = ARRAY_SIZE(rzn1_pins),
 };
 
 static int rzn1_pinctrl_parse_groups(struct device_node *np,
@@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
 
 	ipctl->dev = &pdev->dev;
 	rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
-	rzn1_pinctrl_desc.pins = rzn1_pins;
-	rzn1_pinctrl_desc.npins = ARRAY_SIZE(rzn1_pins);
 
 	ret = rzn1_pinctrl_probe_dt(pdev, ipctl);
 	if (ret) {

-- 
2.45.2


