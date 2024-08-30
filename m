Return-Path: <linux-rtc+bounces-1807-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99720966267
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 15:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDB361C234B3
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 13:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BB91B2ECB;
	Fri, 30 Aug 2024 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rXlxiy1a"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814D1B2516
	for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022973; cv=none; b=AOkmdplE5w3mU/u4kIqVeQ7AMMeVLUnR5njMuMzXDSnX5NTsQA5grezi2H1RZ8wYTFksaxTR7w2CWEKsXhggBcZ7M+nQ6w6PeoaVHx8X9tPzdzKXCK4jhAgtIDffTY39b2xVCMbyvS5aVdoL2+whswWzrZpQB55pak01NpLH45c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022973; c=relaxed/simple;
	bh=XoEdsWD3GFV8d0KfrEKPk7Ur4yqRuu/m00zmMrSLN9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FAWBMfwuhMWjARY2mk9lz99LypTfJgDTEftY9SbphXU7fUhxVcpGypMnq6ULqdNS38rE0LhSKsSMeVpYNhrnhQsVzGuNw7BUVC+DZDJAYW/IwfewqLss+gWlXkZESadhuOsYqVFR73GwYYo+oMj35ThBVGmfnwizkkuAKeYHifY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rXlxiy1a; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374ba74e9b6so61810f8f.0
        for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022969; x=1725627769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jv0oZD54JwyxxGSiMjJenEWJkyUF1s8+LyLX9GNpM7s=;
        b=rXlxiy1aUQGbGmM3mk+dviQ1CBZ+LhD4NEeLEe5e2CVKC2tuiP84DoP55ygJwKTWb2
         nHu682KCTq7Ot1OQsEkV5eN90Q+0UxmEh0tffVayjhb12APhEx2PKmDaIeJ15aV+OQZ/
         r0/6HUrORInNYDaXBHNR6T9s/2/P0JeKNaPQSnbl9wsGYsSeuM3UAYVyr+E4Rm9CGLVi
         4FGYWba3AG68qVhOcLx6Wy+03c+zny4b+unNGrg7wivdNwI7dJLPxT/RFPmKCH3IQa5u
         UGK6r4VhyuGDEsh5rOACC13fq2mQgUDKj2OJl1mcU3VwSNacboF8ftdCYq9CerFQYdsL
         pyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022969; x=1725627769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jv0oZD54JwyxxGSiMjJenEWJkyUF1s8+LyLX9GNpM7s=;
        b=AkgiSvJPL8cCLZxSEXBZ3ubf+7sXCaM3OoKn1sFJq53cCuOfJcuOjL5wy1/1WW4OZM
         5XeG9pMidGZzb3Fs0jKTWqzijaZIZkK8nSld5pLWa7KUolNO7aZb1qsmOn1wq8h4pJZB
         WzglVys0JdCTe+F1yOMxxbgYXkXJvu7qwiY9N8ChDiFPaFhdie93GOJwwy1KrryaLmzn
         gBYBZlecOY+n+nFazEq8e57BKZ97N2YJrwUXRNrBylJ/GEFWuI+NivDleND8MuwjmnPp
         9mwWIKWzY1zQ9sV8p7hv5GFOzljS+vfvM3y6vorA2wBQ8gjJX9siT/IRs+BxdHHpcrx+
         JW8A==
X-Forwarded-Encrypted: i=1; AJvYcCXCYKU1udIpni3lkCRsfuhvaH5vjcBBMtWjdH0jnE3pZYEzdYU3Nzaqgfb5c0ozHU9E2AXkC0qJ3c4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9hzx7cOa8iRuqOOc1woV7UY1INml9gwXaEzgcgBUvo3FtTkG0
	Lo4Q8KuFBwqn/H7qHZ0ALcl1lEIqD7mizFSm4TQahRDi4bQru9WkX7KKAOrjCjc=
X-Google-Smtp-Source: AGHT+IFJuYbBZoAS0PSV5YK7faHO8M89tBMM5ZoWIn7ROBTJ6rIOk/KLg+dQnZBya/I75t5xQlCWlg==
X-Received: by 2002:adf:ee12:0:b0:368:7282:51d6 with SMTP id ffacd0b85a97d-3749b544a72mr4671516f8f.21.1725022968774;
        Fri, 30 Aug 2024 06:02:48 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:48 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 09/12] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
Date: Fri, 30 Aug 2024 16:02:15 +0300
Message-Id: <20240830130218.3377060-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the VBATTB controller. It provides the clock for RTC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- updated patch description
- dropped vbattclk
- added renesas,vbattb-load-nanofarads on vbattb
- moved vbattb before vbattb_xtal

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 21bfa4e03972..591a90ccfe3c 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -346,6 +346,15 @@ mux {
 	};
 };
 
+&vbattb {
+	renesas,vbattb-load-nanofarads = <12500>;
+	status = "okay";
+};
+
+&vbattb_xtal {
+	clock-frequency = <32768>;
+};
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.39.2


